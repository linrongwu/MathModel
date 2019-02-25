function c=PianWeifen(pop,C)
Q=40;%流量
%C=4.91401813825403;%下游3000m的初始浓度
E=1*10^-2;%扩散系数
a=1;%混合系数
c=(pop(1)*pop(2)+a*C*Q)/(pop(2)+a*Q);%混合浓度
end
