maxx=10;
minx=0;
midx=3;
Q=40;
c0=5;
kk=0.05;
D=0.01
cmax=10
M=20;%���Ȳ����� iΪ���� 
h=maxx/M;
N=100;%ʱ�䲽���� kΪʱ��
%t=?/N=;
t=0.0025
u=1;
%c(k+1,i)=(D*t/h^2+u*t/(2*h))*c(k,i-1)+(1-2*D*t/h^2-k*t)*c(k,i)+(D*t/h^2-u*t/(2*h))*c(k,i+1)+s*t/a;

for i=1:M+N+1
    c(1,i)=c0;
end

for k=1:N
    c(k+1,1)=c0*exp(-kk*k);
end
for k=1:N
    for i=2:M+N-k
        c(k+1,i)=(D*t/h^2+u*t/(2*h))*c(k,i-1)+(1-2*D*t/h^2-kk*t)*c(k,i)+(D*t/h^2-u*t/(2*h))*c(k,i+1);
        %+s*t/a;
    end
end