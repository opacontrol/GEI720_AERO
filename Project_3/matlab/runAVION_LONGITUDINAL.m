% Programme qui simule et donne les resultats (étudiants)

% Fermeture des fenetres d'affichage
  clear
  close all
  clc

% SIMULATION
% ----------

% Initialisation du modèle SIMULINK de l'avion longitudinal
  iniAVION_LONGITUDINAL

%initialisation des poles desire  
  %Poles_d

% Definition de la matrice-colonne temps

  t = [0.0:0.05:3000]';

% Execution de la simulation avec integrateur par defaut et
% enregistrement des resultats dans la matrice 'y'.
% Il y a autant de colonnes dans y qu'il y a de sorties dans
% le modele 'AVION_LONGITUDINAL'. Il y a une rangee pour chaque
% valeur de temps dans 't'.

  [tsim,x,y]         = sim('AVION_LONGITUDINAL2',t);
 % [tsim2,x2,y2]         = sim('AVION_CONTROL',t);


  
  
% GRAPHIQUES
% ----------

  figure(1)
  subplot(2,1,1)
  plot(t, [y(:,1)],'LineWidth',2), grid
  hold on
  plot(t, [y(:,17)],'c','LineWidth',2)
  xlabel('Temps (s)', 'FontWeight', 'bold')
  ylabel('Vitesse (m/s)', 'FontWeight', 'bold')
  title('Vitesse et angle d''attaque en fonction du temps', 'FontWeight', 'bold')
  
  subplot(2,1,2)
  plot(t, [y(:,2)],'LineWidth',2), grid
  hold on
  plot(t, [y(:,18)],'c','LineWidth',2);
  xlabel('Temps (s)', 'FontWeight', 'bold')
  ylabel('Angle d''attaque (deg)', 'FontWeight', 'bold')
  
  figure(2)
  subplot(2,1,1)
  plot(t, [y(:,3)],'LineWidth',2), grid
  hold on
  plot(t, [y(:,19)],'c','LineWidth',2)
  xlabel('Temps (s)', 'FontWeight', 'bold')
  ylabel('Angle de tangage (deg)', 'FontWeight', 'bold')
  title('Angle et vitesse angulaire en tangage en fonction du temps', 'FontWeight', 'bold')

  subplot(2,1,2)
  plot(t, [y(:,4)],'LineWidth',2), grid
  hold on
  plot(t, [y(:,20)],'c','LineWidth',2)
  xlabel('Temps (s)', 'FontWeight', 'bold')
  ylabel('Vitesse angulaire en tangage (deg/s)', 'FontWeight', 'bold')

  figure(3)
  plot(t, [y(:,5)],'LineWidth',2), grid
  hold on
  plot(t, [y(:,21)],'c','LineWidth',2)
  xlabel('Temps (s)', 'FontWeight', 'bold')
  ylabel('Angle de vol (deg)', 'FontWeight', 'bold')
  title('Angle de vol (''flight path angle'') en fonction du temps', 'FontWeight', 'bold')
  text(1100, 2, 'L''avion descend', 'FontWeight', 'bold')
  text( 100, 2, 'Vol horizontal', 'FontWeight', 'bold')

  figure(4)
  plot(y(:,16)/1000, y(:,15)/1000,'LineWidth',2), grid
  hold on
  plot(y(:,32)/1000, y(:,31)/1000,'c','LineWidth',2)
  xlabel('Position horizontale (km)', 'FontWeight', 'bold')
  ylabel('Altitude (km)', 'FontWeight', 'bold')
  title('Altitude en fonction de la position horizontale', 'FontWeight', 'bold')
   
  figure(5)
  plot(t, [y(:,4)],'-','LineWidth',2), grid
  hold on
  plot(t, [y(:,20)],'--','LineWidth',2)
  V = axis;
  axis([495, 540, V(3), V(4)])
  xlabel('Temps (s)', 'FontWeight', 'bold')
  ylabel('Vitesse angulaire en tangage (deg/s)', 'FontWeight', 'bold')
  title('Zoom pour illustrer le mode ''short period'' (2s) et le mode phugoid (22s)', 'FontWeight', 'bold')
  text(502, 18, 'periode = 1.3 s', 'FontWeight', 'bold')
  text(516,  8, 'periode = 20 s', 'FontWeight', 'bold')
  legend('Modèle non linéaire', 'Modèle linéarisé');
  
  
  
  
  
