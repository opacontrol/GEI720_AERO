% Fichier d'initialisation de la dynamique en rotation du satellite

% JdeL 
% Décembre 2011

% ROUE 1
% ------

% Inertie et conditions initiales de la roue 1
RW1inertie = 4.10e-04;
RW1inertie_inv = inv(RW1inertie);
wrw1_ini = (2*pi/60)*20;
hrw1_ini = RW1inertie*wrw1_ini;
RW1axe_B = [1, 0, 0]';
hrw1_B_ini = hrw1_ini*RW1axe_B;
 

% ROUE 2
% ------

% Inertie et conditions initiales de la roue 2
RW2inertie = 4.11e-04;
RW2inertie_inv = inv(RW2inertie);
wrw2_ini = (2*pi/60)*30;
hrw2_ini = RW2inertie*wrw2_ini;
RW2axe_B = [0, 1, 0]';
hrw2_B_ini = hrw2_ini*RW2axe_B;


% ROUE 3
% ------

% Inertie et conditions initiales de la roue 3
RW3inertie = 4.12e-04;
RW3inertie_inv = inv(RW3inertie);
wrw3_ini = (2*pi/60)*40;
hrw3_ini = RW3inertie*wrw3_ini;
RW3axe_B = [0, 0, 1]';
hrw3_B_ini = hrw3_ini*RW3axe_B;


% Paramètre d'ensemble des roues
% ------

RWaxe_B = [RW1axe_B, RW2axe_B, RW3axe_B];
hrw_B_ini = hrw1_B_ini+hrw2_B_ini+hrw3_B_ini;


% SATELLITE
% ---------

% Inertie et conditions initiales du satellite
SCinertie = [8.0, 0.2, -0.4; 0.2, 10.0, 0.5; -0.4, 0.5, 7.0];
SCinertie_inv = inv(SCinertie);
wsc_B_ini = [0, 0, 0]';
hsc_B_ini = SCinertie*wsc_B_ini;

htot_B_ini = hsc_B_ini+hrw_B_ini;
qsc_I_ini = [0, 0, 0, 1]';


 

