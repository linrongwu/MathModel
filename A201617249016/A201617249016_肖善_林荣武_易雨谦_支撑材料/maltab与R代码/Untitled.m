clc
clear
load('C:\Users\lrw\Desktop\数据.mat');

%% 局部线性拟合
AQI=C{1}(:,1);
data = AQI(1:481);

cut_off =100;
x_lim_all = [min(AQI),max(AQI)];

% 获取左侧的样本点
data_low = data(data<cut_off);
bin_width_low = 2*std(data_low)/sqrt(length(data_low));%std计算标准差，默认n-1,默认按列
bin_num_low = (cut_off-min(data_low))/bin_width_low;
[y_low,x_low] = hist(data_low,bin_num_low);
figure(1);
hist(data_low,bin_num_low);%频率直方图
y_low=y_low/length(AQI)/mean(diff(x_low)); %概率密度

% 获取 右侧的样本点
data_up = data(data>cut_off);
bin_width_up = 2*std(data_up)/sqrt(length(data_up));
bin_num_up = (max(data_up)-cut_off)/bin_width_up;
[y_up,x_up] = hist(data_up,bin_num_up);
figure(2);
hist(data_up,bin_num_up);
y_up=y_up/length(AQI)/mean(diff(x_up)); 

y_lim_all = [min([min(y_low) min(y_up)]) max([max(y_low) max(y_up)])];

% 拟合
% 绘制样本点
colors = ['m' 'c' 'k' 'r' 'g']; 
figure;
hold on;
plot([x_low x_up],[y_low y_up],'.b');%散点图

% 局部线性拟合
% 左侧拟合
h_bandwidth = [10*bin_width_low 15*bin_width_low 20*bin_width_low]; % bandwidth
[x_low_fit,y_low_fit] = local_linear_fit(x_low',y_low',h_bandwidth);
for k = 1:length(h_bandwidth)
    plot(x_low_fit(:,k),y_low_fit(:,k),colors(k))
end
%  右侧拟合
h_bandwidth = [10*bin_width_up 15*bin_width_up 20*bin_width_up]; % bandwidth
[x_up_fit,y_up_fit] = local_linear_fit(x_up',y_up',h_bandwidth);
for k = 1:length(h_bandwidth)
    plot(x_up_fit(:,k),y_up_fit(:,k),colors(k))
end

legend('trainingdata','a=10,','a=15','a=20')
axis([x_lim_all*1.1 y_lim_all*1.1])
% %% 鲁棒性带宽过大过小的比较
% figure;
% hold on;
% plot([x_low x_up],[y_low y_up],'.b');
% % 局部线性拟合
% h_bandwidth = [1*bin_width_low 15*bin_width_low 30*bin_width_low]; % bandwidth
% local_linear_fit(x_low',y_low',h_bandwidth)
% 
% h_bandwidth = [1*bin_width_up 15*bin_width_up 30*bin_width_up]; % bandwidth
% local_linear_fit(x_up',y_up',h_bandwidth)
% 
% legend('trainingdata','a=1,','a=15','a=30')
% axis([x_lim_all*1.1 y_lim_all*1.1])
