function sub_k_fabric = get_sub_k(k_fabric, theta_s, theta_w)
    k_air = 0.033;
    frac = (16 / sin(theta_s) + 16 / sin(theta_w) - 16);
    yita = (frac - 2 * pi * (cot(theta_s) + theta_s) - 2 * pi * (cot(theta_w) + theta_w)) / frac;
    sub_k_fabric = k_fabric*(1 - yita) + k_air * yita;
end