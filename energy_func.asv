function k_all = energy_func(d, rho_s, rho_w, theta_s, theta_w, P)
    k_air = 0.0296; % 静态空气热导 单位：W/(mK)
    k_fabric = 0.0363; % 织物热导率 单位：W/(mK)
    h = 2 * d;
    A_all = 1 / rho_w * 1 / rho_s;
    A_air = (1 / rho_w - d) * (1 / rho_s - d);
    A_fabric = d * (1 / rho_w + 1 / rho_s) - d ^ 2;
    sub_k_fabric = get_sub_k(k_fabric, theta_s, theta_w);
    Q_fabric = - A_fabric / h * sub_k_fabric * P;
    Q_air =- A_air / h * k_air * P;
    Q_all = Q_fabric + Q_air;
    k_all = -Q_all/A_all*h/P;
end