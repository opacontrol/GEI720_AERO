% Programme d'initialisation du sous-systeme SOLEIL
%
% Jean de Lafontaine
% Cr�ation: janvier 2003
% R�vision: novembre 2011
% R�vision: septembre 2014

% Condition initiales
% -------------------

  Sun_incl_deg_ini     = 23.45;	    % inclinaison (deg)
  Sun_meanlong_deg_ini = 45.00;	    % Sun mean longitude initiale (deg)

% Sun_meanlong_deg_ini = 0 au printemps, 
%                      180 a l'automne,

% Calcul des parametres (deg � rad)
% ---------------------------------

  Sun_incl_ini      = Sun_incl_deg_ini*deg2rad;         % inclinaison (rad)
  Sun_meanlong_ini  = Sun_meanlong_deg_ini*deg2rad;	    % Sun mean longitude (rad)

  Sun_mmot    = 2*pi/(365.2422*24*3600);                % vitesse angulaire apparente du soleil (rad/s)

