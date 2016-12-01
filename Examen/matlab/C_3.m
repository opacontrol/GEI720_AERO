  function C_3 = C_3(angle)

% Rotation elementaire autour de l'axe 3
% Jean de Lafontaine
% Janvier 2003

  cangle = cos(angle);
  sangle = sin(angle);

  C_3(1,1) = cangle;
  C_3(1,2) = sangle;
  C_3(1,3) = 0.0;
  C_3(2,1) =-sangle;
  C_3(2,2) = cangle;
  C_3(2,3) = 0.0;
  C_3(3,1) = 0.0;
  C_3(3,2) = 0.0;
  C_3(3,3) = 1.0;