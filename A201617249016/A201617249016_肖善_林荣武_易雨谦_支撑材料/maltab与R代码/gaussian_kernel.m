function k = gaussian_kernel(x,Weight_speed)
% Weight_speed Խ��Ȩֵ�仯Խ��

k = (1/(sqrt(2*pi)))*exp(-(x^2)/(2*Weight_speed^2));