% Fichier d'initialisation de la dynamique en rotation du satellite

% JdeL 
% D�cembre 2011

% constante utiles
RPM2RAD = 2*pi/60;
Wb = [0 0 0 ];


% ROUE 1
% ------

% Inertie et conditions initiales de la roue 1
 
 RW1inertie     = 4.10E-04;
 RW1inertie_inv = 1/RW1inertie;
 wrw1_ini       = 20 * RPM2RAD;
 RW1axe_B       = [1 0 0]';
 hrw1_ini       = RW1inertie*(wrw1_ini +(RW1axe_B*Wb));
 hrw1_B_ini      = 0;
 

% ROUE 2
% ------

% Inertie et conditions initiales de la roue 2


 RW2inertie     = 4.11E-04;
 RW2inertie_inv = 1/RW1inertie;
 wrw2_ini       = 30 * RPM2RAD;
 hrw2_ini       = 0;
 RW2axe_B       = [0 1 0]';
 hrw2_B_ini      = 0;

% ROUE 3
% ------

% Inertie et conditions initiales de la roue 3



 RW3inertie     = 4.12E-04;
 RW3inertie_inv = 1/RW1inertie;
 wrw3_ini       = 40 * RPM2RAD;
 hrw3_ini       = 0;
 RW3axe_B       = [1 0 0]';
 hrw3_B_ini      = 0;
% SATELLITE
% ---------

% Inertie et conditions initiales du satellite

hrw_B_ini   = 0;
RWaxe_B     = 0;

