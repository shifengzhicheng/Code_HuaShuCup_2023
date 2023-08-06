function acceptance_probability = acceptance_probability(delta, temperature)
    % 根据 Metropolis 准则计算接受概率
    if delta < 0
        acceptance_probability = 1.0;
    else
        acceptance_probability = exp(-delta / 0.001*temperature);
    end
end