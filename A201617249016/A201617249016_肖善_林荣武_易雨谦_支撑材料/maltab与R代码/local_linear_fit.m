function [fit_x,fit_y] = local_linear_fit(x,y,h_bandwidth)
% local_linear_fit:local linear regression
%   [fit_x,fit_y] = local_linear_fit(x,y,h_bandwidth),x: independent
%   variable,y:dependent variable,h_bandwidth:bandwidth
% 
% ncf,July,2016
% Email:1476879092@qq.com
% log:
% 2016-7-12:Complete

% column matrix
test_sample_x = x;
test_sample_y = y;

test_sample_X = [ones(length(test_sample_x),1) test_sample_x];

num_x = length(test_sample_x); 
% Weight_speed
Weight_speed = 1;

%% linear fit
% line_fit_beta = (test_sample_X'*test_sample_X)\(test_sample_X'*test_sample_y);
% line_fit_y = line_fit_beta(1) + line_fit_beta(2)*test_sample_x;
% plot(test_sample_x,line_fit_y,'b')
%% local linear fit
% fit_x and fit_y
fit_x = min(test_sample_x):0.3:max(test_sample_x);
fit_y = zeros(length(test_sample_x),length(h_bandwidth));

% colors = ['m' 'c' 'k' 'r' 'g']; 

for k_bandwidth = 1:length(h_bandwidth)
    h = h_bandwidth(k_bandwidth);
    for k_fit_y = 1:length(fit_x)
        w = zeros(num_x,num_x);
        K_h_all = zeros(num_x,1);
        % compute K_h
        for k_w = 1:num_x
            K_h_all(k_w) = gaussian_kernel((fit_x(k_fit_y)-test_sample_x(k_w))/h,Weight_speed)/h;
        end
        sum_K_h_all = sum(K_h_all);
        % compute w
        for k_w = 1:num_x
           w(k_w,k_w) = K_h_all(k_w)./sum_K_h_all;
        end
        local_beta = (test_sample_X'*w*test_sample_X)\(test_sample_X'*w*test_sample_y);
        fit_y(k_fit_y,k_bandwidth) = local_beta(1)+local_beta(2)*fit_x(k_fit_y);
    end
%     plot(fit_x,fit_y,colors(k_bandwidth))
end
% legend('trainingdata','linear','r=.1','r=.3','r=.8,','r=2','r=10'); 
fit_x = [fit_x',fit_x',fit_x'];
