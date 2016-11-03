% Programme d'initialisation du sous-systeme STATION
%
% Jean de Lafontaine
% Cr�ation: janvier 2003
% R�vision: novembre 2011
% R�vision: septembre 2014

% Condition initiales 
% -------------------
% Position du centre sportif de l'UdeS

  latsta_deg    =  45.38;                           % latitude en degr�s 
  lonsta_deg    = -71.93;                           % longitude en degr�s 
  altsta_m      = 255.0;                            % altitude au-dessus de la mer en metres

% Calcul des parametres
% ---------------------

  latsta        = latsta_deg*deg2rad;           % theta (radians)
  lonsta        = lonsta_deg*deg2rad;	        % lambda (radians)
  possta_mod    = re+altsta_m*m2km;             % module du vecteur position de la station selon r�f�rentiel inertiel       
  