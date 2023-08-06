function F = equation_2(x, para_fabric, A_all, A_air)
%% 方程组
para_all = 8.333333333333334 * A_all;
para_air = 0.246666666666667 * A_air;
para_temp = 6;
T3_T1 = 0.068552498400567;
F(1) = x(2) + x(3) - x(1);
F(2) = para_all * x(4) * x(5) - x(1);
F(3) = para_air * x(4) - x(2);
F(4) = para_fabric * x(4) - x(3);
F(5) = para_temp * x(6) - x(4) * x(5);
F(6) = x(6) - x(4) - T3_T1;
end

