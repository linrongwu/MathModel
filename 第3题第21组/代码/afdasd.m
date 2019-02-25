function uu=afdasd(xx,u,c0)
%有限差分
Q=40;%s
D=0.01;%s
K=0.05/(24*3600);%s
%c0=5;
x=7000;
M=20;%x的步长数
h=x/M;
N=100;%t的步长数
T=x/u;
t=T/N;
for i=1:M+N+1
    c(1,i)=c0;%初值
end
 for k=2:N+1
     c(k,1)=(xx)*exp(-K*(k-1)*t);%边界
 end
for k=1:N
    for i=2:M+N-k    
        c(k+1,i)=(D*t/(h^2)+u*t/(2*h))*c(k,i-1)+(1-2*D*t/(h^2)-K*t)*c(k,i)+(D*t/(h^2)-u*t/(2*h))*c(k,i+1);     
    end
end
uu=c(N,M);
end
