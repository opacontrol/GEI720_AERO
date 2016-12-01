  function C_1 = C_1(angle)

% Rotation elementaire autour de l'axe 1
% Jean de Lafontaine
% Janvier 2003

  cangle = cos(angle);
  sangle = sin(angle);

  C_1(1,1) = 1.0;
  C_1(1,2) = 0.0;
  C_1(1,3) = 0.0;
  C_1(2,1) = 0.0;
  C_1(2,2) = cangle;
  C_1(2,3) = sangle;
  C_1(3,1) = 0.0;
  C_1(3,2) =-sangle;
  C_1(3,3) = cangle;
