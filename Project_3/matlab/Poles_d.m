% calcul des poles desiree selon
Ts = 8;
Zeta = sqrt(2)/2;

Wn = 4/(Zeta*Ts);
Poled_1 = -Zeta*Wn + Wn*sqrt(1-(Zeta^2))*i;
Poled_2 = -Zeta*Wn - Wn*sqrt(1-(Zeta^2))*i;
Facteur_pole = 1/2;
Wn2 = 4/(Zeta*Ts*Facteur_pole);
Poled_3 = -Zeta*Wn2 + Wn2*sqrt(1-(Zeta^2))*i;
Poled_4 = -Zeta*Wn2 - Wn2*sqrt(1-(Zeta^2))*i;

Poled = [Poled_1, Poled_2, Poled_3,Poled_4];