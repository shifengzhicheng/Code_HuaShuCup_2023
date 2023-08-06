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

% 单位换算
d = d / 10; % 单位：cm
h = 2 * d; % 织物的厚度，单位：cm
theta_s = theta_s * pi / 180;
theta_w = theta_w * pi / 180;

specific_heat = 0.05; % 织物整体的比热，单位：MJ/m^3 K
thermal_diffusivity = 0.663; % 织物整体热扩散率，单位：mm^2/s
k_air = 0.0296; % 静态空气热导 单位：W/(mK)
% 在这里k_all是求解量，k_fabric是已知量
% k_all = 0.033; % 织物整体热导率 单位：W/(mK)

alpha = 50; % 对流换热系数 α = 50W /(m2K)

k_fabric = 0.0363;
%% 列方程进行计算

A_all = 1 / rho_w * 1 / rho_s;
A_air = (1 / rho_w - d) * (1 / rho_s - d);
A_fabric = d * (1 / rho_w + 1 / rho_s) - d ^ 2;

sub_k_fabric = get_sub_k(k_fabric,theta_s,theta_w);

para_all = 1 / h ;
para_air = k_air / h ;
para_fabric = sub_k_fabric / h;
para_temp = alpha * h;
T3_T1 = t_step.*sum(discrete_temperature-25); 
