  function C_2 = C_2(angle)

% Rotation elementaire autour de l'axe 2
% Jean de Lafontaine
% Janvier 2003

  cangle = cos(angle);
  sangle = sin(angle);

  C_2(1,1) = cangle;
  C_2(1,2) = 0.0;
  C_2(1,3) =-sangle;
  C_2(2,1) = 0.0;
  C_2(2,2) = 1.0;
  C_2(2,3) = 0.0;
  C_2(3,1) = sangle;
  C_2(3,2) = 0.0;
  C_2(3,3) = cangle;
  