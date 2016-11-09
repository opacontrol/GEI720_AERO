% Programme d'initialisation des parametres de la dynamique de l'avion
%
% JdeL 24 fevrier 2003
% GEI-720

% Constantes et conditions initiales 
% ----------------------------------

% Constantes

  d2r_cst = pi/180.0;		    % degres en radians
  r2d_cst = 1.0/d2r_cst;	    % radians en degres
  r2d_1x3 = [1,1,1]*r2d_cst;	% matrice-rangee de 3 constantes
  d2r_1x3 = [1,1,1]*d2r_cst;	% matrice-rangee de 3 constantes

  g_cst = 9.78;			        % m/s^2

% Altitude et position initiales. On choisit la position "nord" a zero
% et l'altitude a 10 000 metres.
% La matrice-rangee pos_ini apparait dans le bloc INTEG_POS.

  h_ini   = 10000.0;	    % m
  pN_ini  = 0.0;		    % m
  pos_ini = [h_ini, pN_ini];

% 		Sous-systeme 'DYN' 
% 		------------------

% Parametres d'inertie

  ACmass       = 90000.0;	% kg
  ACinertia_yy =  8000.0;	% kg m^2

% 		Sous-systeme 'AERO' 
% 		-------------------

% Parametres aerodynamiques

  cbar =   5.0;		% m
  Sref = 200.0; 	% m^2
  rho  = 1.225;		% kg/m^3 densite de l'air
 
  CD0    = 0.018;
  CD1    = 0.009;
  CD2    = 0.040;

  CL0    = 0.20;
  CLalfa = 0.20;

  CM0     =  0.050;
  CMalfa  = -0.001;
  CMdelta = -0.016;
  CMq     = -0.300;

% 		Sous-systeme 'PROPULSION' 
% 		-------------------------

% Parametres des moteurs

  thrust_max = 108000.0;	% Newtons (pour le cas ou FT_V = 0)

  FT80   = thrust_max ;
  FT_V   = -200.0;

% Offset entre ligne de poussee et centre de masse

  xt = -0.3;			% m

% ATTENTION: LES DONNEES CI-DESSOUS DOIVENTS ETRE CHANGEES POUR L'EQUILIBRE A 80 m/s
% L'equilibre choisi en exemple ici est un vol horizontal a 70 m/s.
% L'equilibre choisi pour le projet, et illustre dans le test de validation, est a 80 m/s.
% Vous pouvez utiliser les resultats ci-dessous pour valider votre solution TRIM a 70 m/s.
% Pour comparer avec le fichier de validation, ne pas oublier (evidemment) de changer 
% les valeurs a l'equilibre ci-dessous pour celles à 80 m/s.
% 

%   VTe   = 80.00000;		% vitesse à l'équilibre en m/s.
%   alfae =  0.10941;		% angle d'attaque à l'équilibre en rad (6.26845 deg)
%   tetae =  0.10941;		% angle de tangage à l'équilibre en rad (6.26845 deg)
%                         % alfae = tetae donc vol horizontal (gamae = 0.0)
%   qe    =  0.00000;		% 'pitch rate' est nul à l'équilibre
% 
%   deltae = 2.29707;     % gouvernail de profondeur à l'équilibre
%   ae     = 0.63467;     % propulsion à l'équilibre
X0  = [80, 0, 0, 0]'; IX  = [1];
U0  = []; IU  = [];
Y0  = [0, 0, 0, 0, 0]'; IY  = [5];
DX0 = []; IDX = [];  %% Always empty vector

tolerance = 1E-08;
OPTIONS = [1; tolerance; tolerance; tolerance];
[Xe, Ue, Ye, DXe, OPTIONS] = trim('AVION_TRIM',X0,U0,Y0,IX,IU, ...
                                  IY,DX0,IDX,OPTIONS);

%   alfae_deg =  6.26845;		% angle d'attaque en deg
%   tetae_deg =  6.26845;		% angle de tangage en deg

VTe = Xe(1);
alfae = Xe(2);
tetae = Xe(3);
qe = Xe(4);

deltae = Ue(1);
ae = Ue(2);

etat_equil = [VTe, alfae, tetae, qe]; % conditions d'equilibre 

% Conditions initiales:
% --------------------
% On choisit la dynamique initiale a l'equilibre (pas tjrs le cas). 
% Voir le bloc INTEG_DYN du modele Simulink ou elles apparaissent.

etat_ini = etat_equil;
