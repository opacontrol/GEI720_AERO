  function q = LIB_QUA_MAT2QUA(MAT)
  
  q = zeros(4,1);
  
  temp = 1.0 + MAT(1,1) - MAT(2,2) - MAT(3,3);
  if temp > 0.0 
     q(1) = 0.5 * sqrt(temp);
  else
     q(1) = 0.0;
  end

  temp = 1.0 - MAT(1,1) + MAT(2,2) - MAT(3,3);
  if temp > 0.0 
     q(2) = 0.5 * sqrt(temp);
  else
     q(2) = 0.0;
  end

  temp = 1.0 - MAT(1,1) - MAT(2,2) + MAT(3,3);
  if temp > 0.0 
     q(3) = 0.5 * sqrt(temp);
  else
     q(3) = 0.0;
  end

  temp = 1.0 + MAT(1,1) + MAT(2,2) + MAT(3,3);
  if temp > 0.0 
     q(4) = 0.5 * sqrt(temp);
  else
     q(4) = 0.0;
  end

% Compute q(1:3)

  if     (q(1)>=q(2) && q(1)>=q(3) && q(1)>=q(4)) 

     q(2) = 0.25 * (MAT(1,2) + MAT(2,1)) / q(1);
     q(3) = 0.25 * (MAT(1,3) + MAT(3,1)) / q(1);
     q(4) = 0.25 * (MAT(2,3) - MAT(3,2)) / q(1);

  elseif (q(2)>=q(1) && q(2)>=q(3) && q(2)>=q(4)) 

     q(1) = 0.25 * (MAT(1,2) + MAT(2,1)) / q(2);
     q(3) = 0.25 * (MAT(2,3) + MAT(3,2)) / q(2);
     q(4) = 0.25 * (MAT(3,1) - MAT(1,3)) / q(2);

  elseif (q(3)>=q(1) && q(3)>=q(2) && q(3)>=q(4)) 

     q(1) = 0.25 * (MAT(1,3) + MAT(3,1)) / q(3);
     q(2) = 0.25 * (MAT(2,3) + MAT(3,2)) / q(3);
     q(4) = 0.25 * (MAT(1,2) - MAT(2,1)) / q(3);

  elseif (q(4)>=q(3) && q(4)>=q(2) && q(4)>=q(1)) 

     q(1) = 0.25 * (MAT(2,3) - MAT(3,2)) / q(4);
     q(2) = 0.25 * (MAT(3,1) - MAT(1,3)) / q(4);
     q(3) = 0.25 * (MAT(1,2) - MAT(2,1)) / q(4);

  end
