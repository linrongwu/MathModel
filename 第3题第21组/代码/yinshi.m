function [o,oo]=zxcvbnm(u)
format long;
E=1*10^-2;
k=5.787*10^-7;
x=3000;
t=x/u;
n=20;
m=10;
hx=x/n;
ht=t/m;
c0=5
for i=1:n
    c(1,i)=c0; 
end
for i=2:m+1
    c(i,1)=c0^exp(-k*(i-1)*ht);
end
C(1:m,0.3*n)=c0;
    
a=-E/(hx^2);
b=1/ht+2*E/(hx^2)-u/hx+k;
y=u/hx-E/(hx^2);

ap=a-y;
bp=b+2*y;

for j=1:m
for i=1:n
    g(i)=c(j,i)/ht;
end
gp=g(1)-a*c(j+1,1);

w(1)=y/b;
G(1)=gp/b;
for i=2:n-1
    w(i)=y/(b-a*w(i-1));
    G(i)=(g(i)-a*G(i-1))/(b-a*w(i-1));
end
G(n)=(g(n)-ap*G(n-1))/(bp-ap*w(n-1));
c(j+1,n)=G(n);
for i=n-1:-1:1
    
c(j+1,i)=G(i)-w(i)*c(j+1,i+1);
end
end
o=c(m,n);
oo=c;
end
