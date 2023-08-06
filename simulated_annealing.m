function best_solution = simulated_annealing(initial_solution, initial_temperature, cooling_rate, T_min, P)
    current_solution = initial_solution;
    best_solution = initial_solution;
    temperature = initial_temperature;
    current_energy = energy_func(current_solution(1), current_solution(2), current_solution(3), current_solution(4), current_solution(5), P);
    best_energy = current_energy;

    % 参数的范围
    d_min = 0.03;
    d_max = 0.06;
    theta_min = 10 * pi / 180;
    theta_max = 26.565 * pi / 180;
    rho_min = 1;

    while (temperature > T_min)
        temperature = temperature * cooling_rate;
        
        new_solution = generate_new_solution(current_solution, temperature, d_min, d_max, theta_min, theta_max, rho_min);

        % 计算新解的能量
        new_energy = energy_func(new_solution(1), new_solution(2), new_solution(3), new_solution(4), new_solution(5), P);

        % 计算能量差异
        energy_difference = new_energy - current_energy;

        % 决定是否接受新解
        if acceptance_probability(energy_difference, temperature) > rand()
            current_solution = new_solution;
            current_energy = new_energy;
        end

        % 更新最优解
        if current_energy < best_energy
            best_solution = current_solution;
            best_energy = current_energy;
        end

    end

end
