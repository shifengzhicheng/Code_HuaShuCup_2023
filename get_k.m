function k_fabric = get_k(sub_k_fabric, theta_s, theta_w)
    k_air = 0.033;
    frac = (16 / sin(theta_s) + 16 / sin(theta_w) - 16);
    yita = (frac - 2 * pi * (cot(theta_s) + theta_s) - 2 * pi * (cot(theta_w) + theta_w)) / frac;
    k_fabric = (sub_k_fabric - k_air * yita)/(1 - yita);
end
