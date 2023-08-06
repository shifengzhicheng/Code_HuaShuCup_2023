function F = equation_1(x)
%% 方程组
para_all = 0.005729166666667;
para_air = 0.001710222222222;
para_fabric = 0.115833333333333;
para_temp = 1.818181818181818e+02;
T3_T1 = 0.068552498400567;
F(1) = x(2) + x(3) - x(1);
F(2) = para_all * x(4) * x(5) - x(1);
F(3) = para_air * x(4) - x(2);
F(4) = para_fabric * x(5) * x(4) - x(3);
F(5) = para_temp * x(6) - x(4) * x(5);
F(6) = x(6) - x(4) - T3_T1;
end

