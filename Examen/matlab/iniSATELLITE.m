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

