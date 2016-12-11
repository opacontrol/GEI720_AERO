% Fichier d'initialisation de la dynamique en rotation du satellite

% JdeL
% Décembre 2011
% Modified by:
%   - bouo3102
%   - dems2304

%
% Constante utiles
%
RPM2RAD = 2*pi/60;

% ROUE 1
% ------

% Inertie et conditions initiales de la roue 1

 RW1inertie     = 4.10E-04;
 RW1inertie_inv = 1/RW1inertie;
 wrw1_ini       = 20 * RPM2RAD;
 hrw1_ini       = RW1inertie*wrw1_ini;
 RW1axe_B       = [1 0 0]';
 hrw1_B_ini      = hrw1_ini*RW1axe_B;


% ROUE 2
% ------

% Inertie et conditions initiales de la roue 2

 RW2inertie     = 4.11E-04;
 RW2inertie_inv = 1/RW2inertie;
 wrw2_ini       = 30 * RPM2RAD;
 hrw2_ini       = RW2inertie*wrw2_ini;
 RW2axe_B       = [0 1 0]';
 hrw2_B_ini      = hrw2_ini*RW2axe_B;

% ROUE 3
% ------

% Inertie et conditions initiales de la roue 3

 RW3inertie     = 4.12E-04;
 RW3inertie_inv = 1/RW3inertie;
 wrw3_ini       = 40 * RPM2RAD;
 hrw3_ini       = RW3inertie*wrw3_ini;
 RW3axe_B       = [0 0 1]';
 hrw3_B_ini     = hrw3_ini*RW3axe_B;

% Paramètre des 3 roues ensembles
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
htot_B_e = [0, 0, 0]';
hrw1_e = 0;
hrw2_e = 0;
hrw3_e = 0;
epsilon_e = [0, 0, 0]';
eta_e = 1;
q_e = [epsilon_e; eta_e];

hrw_B_e = hrw1_e*RW1axe_B +  hrw2_e*RW2axe_B + hrw3_e*RW3axe_B;
wb = SCinertie_inv * (htot_B_e - hrw_B_e);

htot_B_cross = [ 0          , -htot_B_e(3),  htot_B_e(2);
                 htot_B_e(3), 0           , -htot_B_e(1);
                -htot_B_e(2), htot_B_e(1) ,  0];

wb_cross = [ 0    , -wb(3),  wb(2);
             wb(3), 0     , -wb(1);
            -wb(2), wb(1) ,  0];

syms delta_htot_B ...
     delta_Tex_B;
delta_htot_B_dot = (htot_B_cross * SCinertie_inv - wb_cross) * ...
                   delta_htot_B + eye(3) * delta_Tex_B;

syms delta_Tc1 ...
     delta_Tc2 ...
     delta_Tc3;

delta_hrw1_dot = delta_Tc1;
delta_hrw2_dot = delta_Tc2;
delta_hrw3_dot = delta_Tc3;

syms wb1 wb2 wb3;
w_b = [wb1; wb2; wb3];
delta_epsilon_dot = (1/2) * w_b;


%%% P4-2
A = zeros(9,9);
B = zeros(9,6);
E = eye(3);

A_htot    = htot_B_cross * SCinertie_inv - wb_cross;

E(1:4:end)= hrw_B_e;
A_hrw     = E;

E(1:4:end) = wb;
A_epsilon = E;

A(1:3,1:3) = A_htot;
A(4:6,4:6) = A_hrw;
A(7:9,7:9) = A_epsilon;

E = eye(3);
B(1:3,1:3) = E;
B(4:6,4:6) = E;

%%% Show results
SHOW_RESULTS = 1;
if SHOW_RESULTS
    delta_htot_B_dot
    delta_hrw1_dot
    delta_hrw2_dot
    delta_hrw3_dot
    delta_epsilon_dot

    A
    B
end

%%% P4-3
