% Programme de simulation de SATELLITE_ORBITE

% JdeL
% Création: 18 mars 2003
% Révision: novembre 2011
% Révision septembre 2014

% GEI720

% Initialisation

  iniSATELLITE_ORBITE

% PREPARATION DES SORTIES ET PARAMETRES
% -------------------------------------

% Colonnes de la sortie y
% 1:3   pos_I       position inertielle 
% 4:6   ORBx_I      composante du vecteur unitaire de position
% 7     r           rayon 
% 8     vr          vitesse radiale
% 9     u           argument de latitude
% 10    wn          vitesse angulaire 
% 11    gamma_deg       angle Soleil-satellite-Terre
% 12    eclipse_flag    indicateur d'eclipse
% 13    eclipse_time    temps passé dans l'eclipse (pas demande : mettre un ground)
% 14    lon_deg         longitude de la trace au sol en deg
% 15    lat_deg         latitude de la trace au sol en deg
% 16:18 relpos_I        position relative satellite-cible terrestre
% 19    roll_deg        angle de roulis
% 20    pitch_deg       angle de tangage
% 21    coelev_deg      angle de co-elevation

% IL FAUT S'ASSURER QUE TOUTES LES VARIABLE UTILISEES
% CI-DESSOUS SONT LES MEMES QUE DANS VOTRE CODE, PAR EX:

% f_perturb     matrice des pertubations orbitales
% orb_ini       matrice des 4 conditions initiales (r, vr, u, wn)

% Simulation 1 : Orbite circulaire et pas de perturbation extérieure
% ------------------------------------------------------------------

  tfin = 5800*5;            % Simulation sur environ 5 orbites
  t = [0 : 30: tfin]';	

  f_perturb = [0.0, 0.0];   % Pas de perturbations a l'entree

  [T,x,y] = sim('SATELLITE_ORBITE',t); 

% Tracé de l'orbite dans le plan orbital
% --------------------------------------
% L'option "axis('equal') met les deux axes à la meme échelle (un cercle apparait comme un cercle)
% On place la Terre à l'origine (0,0)

  figure(1)
  plot(y(:,7).*cos(y(:,9)), y(:,7).*sin(y(:,9)) )
  xlabel('Coordonnee en X (km)')
  ylabel('Coordonnee en Y (km)')
  axis('equal'), hold
  plot(0,0, 'o')
  title('Trace de l''orbite dans le plan orbital')

% Trace de l'orbite au sol
% ------------------------
% Les sorties 14 et 15 sont supposées en degrés. 
% Changer de rad à degrés ici si ce n'est pas le cas. 

  figure(2)  
  plot(y(:,14), y(:,15), '.')
  ylabel('Latitude (deg)')
  xlabel('Longitude (deg)')
  title('Trace de l''orbite au sol')
  hold on
  grid on
  plot(lonsta_deg, latsta_deg, 'o')

% Angles de co-elevation et de tangage
% ------------------------------------

  figure(3)
  subplot(2,1,1)
  plot(t, y(:,21))
  xlabel('Temps (s)')
  ylabel('Angle de co-elevation (deg)')
  title('Angles de co-elevation et de tangage en fonction du temps')
  subplot(2,1,2)
  plot(t, y(:,19))
  xlabel('Temps (s)')
  ylabel('Angle de tangage (deg)')

% Angles de co-elevation et de roulis
% -----------------------------------

  figure(4)
  subplot(2,1,1)
  plot(t, y(:,21))
  xlabel('Temps (s)')
  ylabel('Angle de co-elevation (deg)')
  title('Angles de co-elevation et de roulis en fonction du temps')
  subplot(2,1,2)
  plot(t, y(:,20))
  xlabel('Temps (s)')
  ylabel('Angle de roulis (deg)')

% Angles de co-elevation et eclipse-flag
% --------------------------------------

  figure(5)
  plot(t, [y(:,21), y(:,12)*100])
  xlabel('Temps (s)')
  ylabel('Angle de co-elevation (deg) et eclipse-flag')
  title('Angle de co-elevation et eclipse en fonction du temps')

% Simulation 2 : Orbite circulaire avec perturbation (trainée aérodynamique)
% --------------------------------------------------------------------------

% Simulation d'une orbite excentrique avec perturbation transverse 
% par exemple causée par la trainée aérodynamique 

% Ajoute une perturbation transverse de 10 micro-Newton.

  f_perturb = [0.0, -1.0e-05];
% f_perturb = [0.0, 0.0];

% Fait la simulation

  tfin = 5800*6;            % Simulation sur environ 6 orbites
  t2 = [0 : 60: tfin]';	

  [T2, x2, y2] = sim('SATELLITE_ORBITE', t2); 

  figure(6)
  plot(y2(:,7).*cos(y2(:,9)), y2(:,7).*sin(y2(:,9)) )
  xlabel('Coordonnee en X (km)')
  ylabel('Coordonnee en Y (km)')
  axis('equal'), hold
  plot(0,0, 'o')
  title('Trace de l''orbite dans le plan orbital')

% Trace de l'orbite au sol
% ------------------------
% Les sorties 14 et 15 sont supposées en degrés. 
% Changer de rad à degrés ici si ce n'est pas le cas. 

  figure(7)  
  plot(y2(:,14), y2(:,15), '.')
  ylabel('Latitude (deg)')
  xlabel('Longitude (deg)')
  title('Trace de l''orbite au sol')
  hold on
  grid on
  plot(lonsta_deg, latsta_deg, 'o')

% Angles de co-elevation et de tangage
% ------------------------------------

  figure(8)
  subplot(2,1,1)
  plot(t2, y2(:,21))
  xlabel('Temps (s)')
  ylabel('Angle de co-elevation (deg)')
  title('Angles de co-elevation et de tangage en fonction du temps')
  subplot(2,1,2)
  plot(t2, y2(:,19))
  xlabel('Temps (s)')
  ylabel('Angle de tangage (deg)')

% Angles de co-elevation et de roulis
% -----------------------------------

  figure(9)
  subplot(2,1,1)
  plot(t2, y2(:,21))
  xlabel('Temps (s)')
  ylabel('Angle de co-elevation (deg)')
  title('Angles de co-elevation et de roulis en fonction du temps')
  subplot(2,1,2)
  plot(t2, y2(:,20))
  xlabel('Temps (s)')
  ylabel('Angle de roulis (deg)')

% Angles de co-elevation et eclipse-flag
% --------------------------------------

  figure(10)
  plot(t2, [y2(:,21), y2(:,12)*100])
  xlabel('Temps (s)')
  ylabel('Angle de co-elevation (deg) et eclipse-flag')
  title('Angle de co-elevation et eclipse en fonction du temps')
