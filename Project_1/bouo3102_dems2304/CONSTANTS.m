% Programme d'initialisation des constantes
%
% Jean de Lafontaine
% Création: janvier 2003
% Révision: novembre 2011
% Révision: septembre 2014

% Constantes
% ----------
  
  deg2rad = pi/180;         % conversion degrés en radians
  rad2deg = 1.0/deg2rad;    % conversion radians en degrés
  m2km    = 1/1000.0;       % conversion metres en kilomètres
  
  re = 6378.16;             % rayon de la terre en km  
  mu = 398601;              % parametre gravitationnel de la terre en km3

  persid  = 24/(1+1/365.2422)*3600.0;    % Période de rotation inertielle de la Terre (jour sidéral) en secondes
  
  RPY_O = [0, 1, 0;         % Matrice de rotation du repère orbital (ORB) vers le repère Roll-Pitch-Yaw (RPY)
           0, 0,-1;         % Utilisé dans le module POSREL/ORB2RPY
          -1, 0, 0];        
