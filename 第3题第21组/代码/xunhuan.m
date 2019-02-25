u=0.1:0.04:0.2;
n=length(u);
oo=cell(1,n);
x=3000;
for i=1:n
    [o(i),oo{1,i}]=zxcvbnm(u(i));
end
