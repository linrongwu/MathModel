function [Y]=AF_foodconsistence(X)
cosy=53.2/56.16;
siny=18/56.16;
l=1.8;%长度
lD=56.1888;%对角线长度
beta=91*(pi/180);%太阳方位角
h=(pi/180)*48;%太阳高度角
a0=(pi/180)*5.71;%坡度角
a1=(pi/180)*42;%屋顶偏角
fishnum=size(X,2);
n_=0;
T=1.8/18;
for i=1:fishnum
    %D=(l*sin(X(i))+T*l*cos(X(i))*cos(beta-a1)/tan(h))/(1-T*cos(beta-a1)/tan(h))+l*cos(X(i));
    D=sin(pi-(X(i)+h))*l/sin(h-a0);
   % D=sin((X(i)+h))*l/sin(a0+h);
    m=lD*cos(a1)*(cosy*cos(beta)+siny*sin(beta))-sin(a1)*(siny*cos(beta)-cosy*sin(beta));
    for n=1:200
        if  (n*D<=m)&&((n+1)*D>m)
            n_=n;
            break
        end
    end
     Y(1,i)=n_*l*sin(X(i)+h);
end

