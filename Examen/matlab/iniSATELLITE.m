% Fichier d'initialisation de la dynamique en rotation du satellite
%
% JdeL
% D�cembre 2011
% Modified by:
%   - bouo3102
%   - dems2304
%
%
% Constante utiles
%
RPM2RAD = 2*pi/60;  % conversion RPM to RAD

% ROUE 1
% ------

% Inertie et conditions initiales de la roue 1

RW1inertie      = 4.10E-04;
RW1inertie_inv  = 1/RW1inertie;
wrw1_ini        = 20 * RPM2RAD;
hrw1_ini        = RW1inertie*wrw1_ini;
RW1axe_B        = [1 0 0]';
hrw1_B_ini      = hrw1_ini*RW1axe_B;


% ROUE 2
% ------

% Inertie et conditions initiales de la roue 2

RW2inertie     = 4.11E-04;
RW2inertie_inv = 1/RW2inertie;
wrw2_ini       = 30 * RPM2RAD;
hrw2_ini       = RW2inertie*wrw2_ini;
RW2axe_B       = [0 1 0]';
hrw2_B_ini     = hrw2_ini*RW2axe_B;

% ROUE 3
% ------

% Inertie et conditions initiales de la roue 3

RW3inertie     = 4.12E-04;
RW3inertie_inv = 1/RW3inertie;
wrw3_ini       = 40 * RPM2RAD;
hrw3_ini       = RW3inertie*wrw3_ini;
RW3axe_B       = [0 0 1]';
hrw3_B_ini     = hrw3_ini*RW3axe_B;

% Param�tre des 3 roues ensembles
% ------
hrw_B_ini   = hrw1_B_ini + hrw2_B_ini + hrw3_B_ini;
RWaxe_B     = [RW1axe_B,RW2axe_B,RW3axe_B];

% SATELLITE
% ---------

% Inertie et conditions initiales du satellite

SCinertie       = [8 0.2 -0.4; 0.2 10 0.5; -0.4 0.5 7];
SCinertie_inv   = inv(SCinertie);
wsc_B_ini       = [0 0 0]';
hsc_B_ini       = SCinertie * wsc_B_ini;
htot_B_ini      = SCinertie * wsc_B_ini + hrw_B_ini;
qsc_I_ini       = [0 0 0 1]';

%%%
%%%  Serie P
%%%

%%% P4-1
htot_B_e  = [0, 0, 0]';         % h_tot dans B a equilibre
hrw1_e    = 0;                  % hrw1 dans B a equilibre
hrw2_e    = 0;                  % hrw2 dans B a equilibre
hrw3_e    = 0;                  % hrw3 dans B a equilibre
epsilon_e = [0, 0, 0]';         % epsilon a equilibre
eta_e     = 1;                  % eta a equilibre
q_e       = [epsilon_e; eta_e]; % quaternion a equilibre


%%%
%%% P4-2
%%%
A = zeros(9,9);  % init matrice A
B = zeros(9,6);  % init matrice B
E = eye(3);

% Matrice A
tmp = (1/2) * SCinertie_inv;

tmp(2:3,1) = 0; 
tmp(1,2:3) = 0;
tmp(2,3)=0;
tmp(3,2)=0;

A(7:9,1:3) = tmp;
A(7:9,4:6) = -tmp;

% Matrice B
E = eye(3);
B(1:3,1:3) = E;
B(4:6,4:6) = E;


%%%
%%% P4-3
%%%
C = zeros(6,9);
D = zeros(6,6);

% Matrice C
C(1,1:3) = -RW1axe_B'*SCinertie_inv;
C(2,1:3) = -RW2axe_B'*SCinertie_inv;
C(3,1:3) = -RW3axe_B'*SCinertie_inv;

tmp = [RW1inertie_inv + RW1axe_B'*SCinertie_inv*RW1axe_B, RW1axe_B'*SCinertie_inv*RW2axe_B,                  RW1axe_B'*SCinertie_inv*RW3axe_B; ...
       RW2axe_B'*SCinertie_inv*RW1axe_B,                  RW2inertie_inv + RW2axe_B'*SCinertie_inv*RW2axe_B, RW2axe_B'*SCinertie_inv*RW3axe_B; ...
       RW3axe_B'*SCinertie_inv*RW1axe_B,                  RW3axe_B'*SCinertie_inv*RW2axe_B,                  RW3inertie_inv + RW3axe_B'*SCinertie_inv*RW3axe_B];
C(1:3,4:6) = tmp;
C(4:6,7:9) = eye(3);

%%%
%%% Show results
%%%
SHOW_RESULTS = 0;
if SHOW_RESULTS
    A
    B
    C
    D
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resolution d'examen %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Matrice de Q et R 
Bdum = B(1:end,4:end);

factreur_rho = 1000 ;
Q = eye(size(A,2));
R = eye(size(B,2)) * factreur_rho;

% calcul du gain optimal ( solution de l'equiation de riccati )

[P, vp, K] = care(A,B,Q,R);
testing=eig(A-B*K);
% vp = eig (A - B*K) % for validation 

% matrice COuts 
Xe = [htot_B_e; hrw1_e;hrw2_e; hrw3_e; epsilon_e];
Jc = Xe'*P*Xe;
%Jc = trace(P)


% COMMANDABILIT� PAR RETOUR D��TAT
%
% Methode 1 :
M = ctrb(A,B);
M = rank (M);
fprintf('\nLe rang de la matrice M = %d\n', M);
fprintf('La dimention de la matrice A = %d\n', length(A));


%P3-6 : Observabilite du systeme 
Ob = obsv(A,C);
unob = length(A)-rank(Ob);

%% choix de lobservateur 
facteur_rho2 = 100;
Re = [1 0 0 0 0 0
      0 1 0 0 0 0
      0 0 1 0 0 0
      0 0 0 1/1000 0 0 
      0 0 0 0 1/1000 0
      0 0 0 0 0 1/1000];

Qe = Re * facteur_rho2;

[Pe, vpe, Ke] = care(A',C',Q,R);
Ke = Ke';

Aobs = A - Ke*C;
Bobs = [B Ke];
Cobs = eye(9);
Dobs = zeros(9,12);





