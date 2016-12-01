function MAT = LIB_QUA_QUA2MAT(qua)

MAT = zeros(3,3);

MAT(1,1) = 2*qua(4)*qua(4) - 1 + 2*qua(1)*qua(1);
MAT(1,2) = 2*qua(1)*qua(2) + 2*qua(4)*qua(3);
MAT(1,3) = 2*qua(1)*qua(3) - 2*qua(4)*qua(2);
MAT(2,1) = 2*qua(1)*qua(2) - 2*qua(4)*qua(3);
MAT(2,2) = 2*qua(4)*qua(4) - 1 + 2*qua(2)*qua(2);
MAT(2,3) = 2*qua(2)*qua(3) + 2*qua(4)*qua(1);
MAT(3,1) = 2*qua(1)*qua(3) + 2*qua(4)*qua(2);
MAT(3,2) = 2*qua(2)*qua(3) - 2*qua(4)*qua(1);
MAT(3,3) = 2*qua(4)*qua(4) - 1 + 2*qua(3)*qua(3);