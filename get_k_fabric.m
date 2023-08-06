function k_fabric = get_k_fabric(d, rho_s, rho_w, theta_s, theta_w, P)
    k_air = 0.0296; % 静态空气热导 单位：W/(mK)
    k_all = 0.033; % 织物整体热导率 单位：W/(mK)
    h = 2 * d;
    A_all = 1 / rho_w * 1 / rho_s;
    A_air = (1 / rho_w - d) * (1 / rho_s - d);
    A_fabric = d * (1 / rho_w + 1 / rho_s) - d ^ 2;

    Q_all =- A_all / h * k_all * P;

    Q_air =- A_air / h * k_air * P;

    Q_fabric = Q_all - Q_air;

    sub_k_fabric = -Q_fabric * A_fabric / h / P;

    k_fabric = get_k(sub_k_fabric, theta_s, theta_w);
end
