% Programme d'initialisation du sous-systeme DYNORB
%
% Jean de Lafontaine
% Cr�ation: janvier 2003
% R�vision: novembre 2011
% R�vision: septembre 2014

% Condition initiales
% -------------------

  h  = 600.0;                       % altitude du satellite en km
  fr =   0.0;                       % perturbations orbitales radiales
  ft =   0.0;                       % perturbations orbitales transverses
  incl_ini_deg  =  60.0;            % inclinaison (degr�s)
  alat_ini_deg  =   0.0;            % argument of latitude initial(degr�s) (variable 'u' dans les notes de cours)
  raan_ini_deg  = -53.0;            % raan initial (degr�s)

% Calcul des parametres
% ---------------------

  f_perturb=[fr; ft];               

  incl_ini  = incl_ini_deg*deg2rad; % Conversions en radians
  alat_ini  = alat_ini_deg*deg2rad; 
  raan_ini  = raan_ini_deg*deg2rad;
  pos_mod   = re+h;                 % position radiale du satellite
  
% Conditions initiales des equations dynamiques du satellite (ORB_ini)
% --------------------------------------------------------------------
 
  mmot = sqrt(mu/pos_mod^3);        % vitesse angulaire orbitale initiale ("mean motion")
  period = 2*pi/mmot;               % p�riode orbitale initiale
  
  r_ini  = pos_mod;
  vr_ini = 0.0;
  u_ini  = alat_ini;
  wn_ini = mmot;
    
  orb_ini=[r_ini,vr_ini,u_ini,wn_ini];
