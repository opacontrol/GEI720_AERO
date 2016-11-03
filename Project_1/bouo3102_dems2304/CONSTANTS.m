% Programme d'initialisation des constantes
%
% Jean de Lafontaine
% Cr�ation: janvier 2003
% R�vision: novembre 2011
% R�vision: septembre 2014

% Constantes
% ----------
  
  deg2rad = pi/180;         % conversion degr�s en radians
  rad2deg = 1.0/deg2rad;    % conversion radians en degr�s
  m2km    = 1/1000.0;       % conversion metres en kilom�tres
  
  re = 6378.16;             % rayon de la terre en km  
  mu = 398601;              % parametre gravitationnel de la terre en km3

  persid  = 24/(1+1/365.2422)*3600.0;    % P�riode de rotation inertielle de la Terre (jour sid�ral) en secondes
  
  RPY_O = [0, 1, 0;         % Matrice de rotation du rep�re orbital (ORB) vers le rep�re Roll-Pitch-Yaw (RPY)
           0, 0,-1;         % Utilis� dans le module POSREL/ORB2RPY
          -1, 0, 0];        
