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

  t = [0.0:0.05:200]';

%
% Execution de la simulation
%
SIMULATION_FLAG = 3;  % Simulation flag utiliser pour simuler les differentes.
                      % 1: PARTIE A
                      % 2: PARTIE B
                      % 3: PARTIE C

switch SIMULATION_FLAG
    case 1
        fprintf('Model de simulation: AVION_CONTROL\n');
        [tsim,x,y] = sim('AVION_CONTROL',t);
    case 2
        fprintf('Model de simulation: AVION_OBSERV\n');
        [tsim,x,y] = sim('AVION_OBSERV',t);
    case 3
        fprintf('Model de simulation: AVION_OBSCTL\n');
        [tsim,x,y] = sim('AVION_OBSCTL',t);
end

% GRAPHIQUES
% ----------

  figure(1)
  subplot(2,1,1)
  plot(t, [y(:,1)],'LineWidth',2), grid
  hold on
  plot(t, [y(:,17)],'--r','LineWidth',2 )
  xlabel('Temps (s)', 'FontWeight', 'bold')
  ylabel('Vitesse (m/s)', 'FontWeight', 'bold')
  title('Vitesse et angle d''attaque en fonction du temps', 'FontWeight', 'bold')

  subplot(2,1,2)
  plot(t, [y(:,2)],'LineWidth',2), grid
  hold on
  plot(t, [y(:,18)],'--r','LineWidth',2);
  xlabel('Temps (s)', 'FontWeight', 'bold')
  ylabel('Angle d''attaque (deg)', 'FontWeight', 'bold')

  figure(2)
  subplot(2,1,1)
  plot(t, [y(:,3)],'LineWidth',2), grid
  hold on
  plot(t, [y(:,19)],'--r','LineWidth',2)
  xlabel('Temps (s)', 'FontWeight', 'bold')
  ylabel('Angle de tangage (deg)', 'FontWeight', 'bold')
  title('Angle et vitesse angulaire en tangage en fonction du temps', 'FontWeight', 'bold')

  subplot(2,1,2)
  plot(t, [y(:,4)],'LineWidth',2), grid
  hold on
  plot(t, [y(:,20)],'--r','LineWidth',2)
  xlabel('Temps (s)', 'FontWeight', 'bold')
  ylabel('Vitesse angulaire en tangage (deg/s)', 'FontWeight', 'bold')

  figure(3)
  plot(t, [y(:,5)],'LineWidth',2), grid
  hold on
  plot(t, [y(:,21)],'--r','LineWidth',2)
  xlabel('Temps (s)', 'FontWeight', 'bold')
  ylabel('Angle de vol (deg)', 'FontWeight', 'bold')
  title('Angle de vol (''flight path angle'') en fonction du temps', 'FontWeight', 'bold')
  text(1100, 2, 'L''avion descend', 'FontWeight', 'bold')
  text( 100, 2, 'Vol horizontal', 'FontWeight', 'bold')

  figure(4)
  plot(y(:,16)/1000, y(:,15)/1000,'LineWidth',2), grid
  hold on
  plot(y(:,23)/1000, y(:,22)/1000,'--r','LineWidth',2)
  xlabel('Position horizontale (km)', 'FontWeight', 'bold')
  ylabel('Altitude (km)', 'FontWeight', 'bold')
  title('Altitude en fonction de la position horizontale', 'FontWeight', 'bold')

  figure(5)
  plot(t, [y(:,4)],'-','LineWidth',2), grid
  hold on
  plot(t, [y(:,20)],'--r','LineWidth',2)
  V = axis;
  axis([0, 20, V(3), V(4)])
  xlabel('Temps (s)', 'FontWeight', 'bold')
  ylabel('Vitesse angulaire en tangage (deg/s)', 'FontWeight', 'bold')
  title('Zoom pour illustrer le mode ''short period'' (2s) et le mode phugoid (22s)', 'FontWeight', 'bold')
  text(502, 18, 'periode = 1.3 s', 'FontWeight', 'bold')
  text(516,  8, 'periode = 20 s', 'FontWeight', 'bold')
  legend('Modèle non linéaire', 'Modèle linéarisé');
