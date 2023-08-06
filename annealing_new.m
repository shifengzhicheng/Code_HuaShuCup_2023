% 清空之前的变量
clear;

% 文件路径
file_path = 'data\附件1.xlsx';

% 读取Excel数据
data = readtable(file_path);

% 第一列时间与第二列温度数据
time_data = data{:, 1};
temperature_data = data{:, 2};
t_step = 0.00001;
t_end = time_data(end);
% 初始化插值后的数据
discrete_time = zeros(1, round(t_end/t_step));
discrete_temperature = discrete_time;

for i = 1:length(time_data) - 1
    from = round(time_data(i)/t_step) + 1;
    to = round(time_data(i+1)/t_step) + 1;
    discrete_time(from:to) = linspace(time_data(i), time_data(i + 1), to - from + 1);
    discrete_temperature(from:to) = linspace(temperature_data(i), temperature_data(i + 1), to - from + 1);
end


%% 导入参数
% 实验样品参数
d = 0.6; % 单根A纤维的直径，单位：mm
rho_s = 60/10; % 经密，单位：根/cm
rho_w = 80/10; % 纬密，单位：根/cm
theta_s = 19.8; % 经纱弯曲角度，单位：度
theta_w = 25.64; % 纬纱弯曲角度，单位：度
% 参数单位转化
d = d / 10;
theta_s = theta_s * pi / 180;
theta_w = theta_w * pi / 180;

h = 2 * d; % 织物的厚度，单位：cm
% 常数参数
specific_heat = 0.05; % 织物整体的比热，单位：MJ/m^3 K
thermal_diffusivity = 0.663; % 织物整体热扩散率，单位：mm^2/s
k_air = 0.0296; % 静态空气热导 单位：W/(mK)
k_all = 0.033; % 织物整体热导率 单位：W/(mK)

%% 模拟退火算法计算最优解

% 设置模拟退火算法的参数
initial_solution = [d, rho_s, rho_w, theta_s, theta_w]; % 设置初始解
initial_temperature = 1000; % 设置初始温度
cooling_rate = 0.998; % 设置冷却率
T_min = 0.01; % 设置结束温度

% 调用模拟退火算法
result = simulated_annealing2(initial_solution, initial_temperature, cooling_rate, T_min);
d = result(1);
rho_s = result(2);
rho_w = result(3);
theta_s = result(4);
theta_w = result(5);
disp('最优解: ');
fprintf('d: %f, rho_s: %f, rho_w: %f, theta_s: %f, theta_w: %f\n', d, rho_s, rho_w, theta_s, theta_w);
fprintf('对应的 k_all 值: %f\n', energy_func2(d, rho_s, rho_w, theta_s, theta_w));
