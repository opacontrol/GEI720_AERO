% Programme d'execution de TST_SATELLITE

  close all
  clear
  clc
    
% JdeL 
% Décembre 2011

% NB: Avant d'executer ce programme, il faut:
%
% (1) Préparer le fichier d'initialisation iniSATELLITE.m
% (2) Compléter le modèle TST_SATELLITE_A_FAIRE.mdl
%     (dans lequel le sous-système SATELLITE est à compléter)
% (3) Renommer le fichier TST_SATELLITE.mdl.

% Apres, valider les résultats de simulation avec le fichier "valSATELLITE.doc".
  
  iniSATELLITE

% Matrice-colonne du temps

  t = [0:.1:60]';

% Test no 1 : pas de couple externes (magnetiques), seulement sur les roues
% -------------------------------------------------------------------------

  tor_mag_B = [0,0,0]';

  sim('TST_SATELLITE',t);

% Moment angulaire total dans le referentiel du satellite (B)

  figure
  plot(t, htot_B,'LineWidth',2), grid on
  title('TST1: Moment angulaire total dans B', 'FontWeight', 'bold')
  xlabel('Temps (s)', 'FontWeight', 'bold')
  ylabel('htot_B (Nms)', 'FontWeight', 'bold')
  
% Moment angulaire total dans le referentiel inertiel (I)
% Le htot_I doit etre constant dans I pcq les couples externes sont nuls.
% Toujours une bonne verification a faire

  figure
  plot(t, htot_I,'LineWidth',2), grid on
  title('TST1: Moment angulaire total dans I', 'FontWeight', 'bold')
  xlabel('Temps (s)', 'FontWeight', 'bold')
  ylabel('htot_I (Nms)', 'FontWeight', 'bold')
  
% Vitesse angulaire du satellite

  figure
  plot(t, wsc_B,'LineWidth',2), grid on
  title('TST1: Vitesse angulaire du satellite', 'FontWeight', 'bold')
  xlabel('Temps (s)', 'FontWeight', 'bold')
  ylabel('wsc_B (rad/s)', 'FontWeight', 'bold')
  
% Attitude du satellite (3 premiers quaternions)

  figure
  plot(t, qsc_I(:,1:3),'LineWidth',2), grid on
  title('TST1: Attitude du satellite', 'FontWeight', 'bold')
  xlabel('Temps (s)', 'FontWeight', 'bold')
  ylabel('qsc_I(1:3)', 'FontWeight', 'bold')
  
% Test no 2 : couple externes (magnetiques) appliques
% -------------------------------------------------------------------------

  tor_mag_B = [-2,1,-3]'*1e-03;

  sim('TST_SATELLITE',t);

% Moment angulaire total dans le referentiel inertiel (I)
% Le htot_I n'est plus constant dans I.

  figure
  plot(t, htot_I,'LineWidth',2), grid on
  title('TST2: Moment angulaire total dans I', 'FontWeight', 'bold')
  xlabel('Temps (s)', 'FontWeight', 'bold')
  ylabel('htot_I (Nms)', 'FontWeight', 'bold')

% Attitude du satellite (3 premiers quaternions)

  figure
  plot(t, qsc_I(:,1:3),'LineWidth',2), grid on
  title('TST2: Attitude du satellite', 'FontWeight', 'bold')
  xlabel('Temps (s)', 'FontWeight', 'bold')
  ylabel('qsc_I(1:3)', 'FontWeight', 'bold')
 



