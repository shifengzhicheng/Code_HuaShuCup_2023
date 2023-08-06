function new_solution = generate_new_solution(current_solution, temperature, d_min, d_max, theta_min, theta_max, rho_min)
    % 设置参数范围
    d_range = d_max - d_min;
    theta_range = theta_max - theta_min;

    % 生成新解
    new_solution = current_solution;

    % 调整参数1：距离d
    delta_d = d_range * (2*rand(1)-1) * exp(-10/temperature);
    new_solution(1) = max(min(new_solution(1) + delta_d, d_max), d_min);
    
    rho_range = 1/new_solution(1) - rho_min;
    % 调整参数2：rho_s和rho_w
    delta_rho = rho_range * (2*rand(1)-1) * exp(-10/temperature);
    new_solution(2:3) = max(min(new_solution(2:3) + delta_rho, 1/new_solution(1)), rho_min);

    % 调整参数3：角度theta_s和theta_w
    delta_theta = theta_range * (2*rand(1)-1) * exp(-10/temperature);
    new_solution(4:5) = max(min(new_solution(4:5) + delta_theta, theta_max), theta_min);
end