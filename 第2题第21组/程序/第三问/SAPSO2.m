function [xm,fv] = SAPSO1(fitness,N,c1,c2,wmax,wmin,M,D)
need=[        4500        5300        4200        5000     4500.00 	4100.00 	4300.00 	5200.00 ];
demand=[ 400         500         800        3000        3000        3500        4000        4000        3500        3000        4000        4000        4000];
timer=[  40    40    20    35    25    20    30    30    25    26    19    40    40    
         25    35    25    30    50    28    20    25    45    34    23    50    20    
         17    25    22    45    30    56    45    55    30    22    42    30    20   
         20    25    15    30    40    30    30    35    28    32    30    27    25
         20    24 	 25    26 	 27    34 	 36    35 	 34    41 	 21    23 	 22
         35    41 	 32	   41	 22    31 	 32    22	 16    17 	 23    22 	 30 
         18    34 	 34    56 	 34    22 	 25    20 	 17    18 	 34    37 	 43 
         19    36 	 34    34 	 43    23 	 30    45 	 15    35 	 46    32 	 28 ];
format long;

%------初始化种群的个体------------
x=zeros(N,D);
v=zeros(N,D);
n_c=length(need);
d_c=length(demand);
for i=1:N
    while 1
     n=rand(1,(floor(40+rand*10))+1)*D;
    % n=rand(1,floor(rand*D));
    n=floor(n);
    h=0;
    
    y1=[1:n_c;
        n_c+1:2*n_c; 
        2*n_c+1:3*n_c;];
    
    y1=y1(:,randperm(length(y1)));
    y2=floor(1+rand(1,3)*3);
    y3=[y1(1,y2(1)) y1(2,y2(2)) y1(3,y2(3))];
    
    n=[n y3];
    
    for j=1:size(n,2)
        if (mod(n(j),n_c))==0
            if n(j)==0               
            t=floor((rand*(demand(1,(n(j)/n_c)+1)/100-1)+1))*100 ; %随机初始化位置
            if(timer(1,(n(j)/n_c)+1)<40)%贪心4X16 27
             x(i,n(j)+1)=t;
            v(i,n(j)+1)=floor((rand*(demand(1,(n(j)/n_c)+1)/100-1)+1))*100 ; %随机初始化速度
            else
                x(i,n(j)+1)=0;
                v(i,n(j)+1)=0;
            end
            else
            t=floor((rand*(demand(1,(n(j)/n_c))/100-1)+1))*100 ; %随机初始化位置
             if(timer(n_c,(n(j)/n_c))<40)%贪心4X16 27
             x(i,n(j))=t;
             v(i,n(j))=floor((rand*(demand(1,(n(j)/n_c))/100-1)+1))*100; %随机初始化速度
             else
                 x(i,n(j))=0;
                 v(i,n(j))=0;
    
             end
            end
            else
            t=floor((rand*(demand(1,floor(n(j)/n_c)+1)/100-1)+1))*100; %随机初始化位置
            if(timer(mod(n(j),n_c),floor(n(j)/n_c)+1)<40)%贪心4X16 27
             x(i,n(j))=t;
            v(i,n(j))=floor((rand*(demand(1,floor(n(j)/n_c)+1)/100-1)+1))*100; %随机初始化速度
            else
                x(i,n(j))=0;
                v(i,n(j))=0;
            end
        end
    end
    if i==5
        X=[0	0	400	0	0	0	0	0	0	0	0	0	500	0	0	0	0	0	0	800	0	0	0	0	0	0	0	1900	1100	0	0	0	0	100	0	2300	0	0	0	0	500	1000	0	0	0	0	300	1700	0	4000	0	0	0	0	0	0	0	0	0	0	0	0	4000	0	0	0	0	0	0	0	0	3500	0	0	0	0	0	3000	0	0	4000	0	0	0	0	0	0	0	0	0	0	0	2900	1100	0	0	0	200	3800	0	0	0	0	0];
        n=floor(rand(1,(floor(1+rand))+1)*D)+1;
        X(n)=rand;
        x(i,:)=X;
    end
    x_=reshape(x(i,:),n_c,d_c);
    y_=x_;
    n=size(x_,1);
    m=size(x_,2);
    y_(y_>0)=1;
    y_(y_<=0)=0;
    juzhen=timer.*y_;
  for i=1:n
    zn=y_(i,:).*x_(i,:);
    zt(i)=sum(zn)-need(i);
    if i<4
    yt(i)=sum(y_(:,i))-1;
    end
end
zm=min(zt);
ym=min(yt);
for j=1:m
    zd=y_(:,j).*x_(:,j);
    zd=sum(zd);
    zt_(j)=demand(j)-zd;
end
zm_=min(zt_);
z=min([0 zm zm_ ym]);
if z==0
    x(i,:)=reshape(x_,1,d_c*n_c);
    break;
end
    end
end
X=[0	0	400	0	0	0	0	0	0	0	0	0	500	0	0	0	0	0	0	800	0	0	0	0	0	0	0	1900	1100	0	0	0	0	100	0	2300	0	0	0	0	500	1000	0	0	0	0	300	1700	0	4000	0	0	0	0	0	0	0	0	0	0	0	0	4000	0	0	0	0	0	0	0	0	3500	0	0	0	0	0	3000	0	0	4000	0	0	0	0	0	0	0	0	0	0	0	2900	1100	0	0	0	200	3800	0	0	0	0	0];
n=floor(rand(1,(floor(1+rand))+1)*D)+1;
X(n)=rand;
x(N,:)=X;
%------先计算各个粒子的适应度----------------------
for i=1:N

    p(i)=fitness(x(i,:));

    y(i,:)=x(i,:);

end

pg=x(N,:);             %Pg为全局最优

for i=1:(N-1)

    if fitness(x(i,:))<fitness(pg)

        pg=x(i,:);

    end

end

%------进入主要循环------------

for t=1:M

    for j=1:N
        fv(j) = fitness(x(j,:));
    end
    fvag = sum(fv)/N;
    fmin = min(fv);
    for i=1:N

        if fv(i) <= fvag
            w = wmin + (fv(i)-fmin)*(wmax-wmin)/(fvag-fmin);
        else
            w = wmax;
        end
        v(i,:)=w*v(i,:)+c1*rand*(y(i,:)-x(i,:))+c2*rand*(pg-x(i,:));%

        x(i,:)=x(i,:)+v(i,:);%
        

        if fitness(x(i,:))<p(i)

            p(i)=fitness(x(i,:));

            y(i,:)=x(i,:);

        end

        if p(i)<fitness(pg)

            pg=y(i,:);

        end

    end
    Pbest(t)=fitness(pg);

end
r=[1:1:M];
plot(r,Pbest,'r--');
xlabel('迭代次数')
ylabel('适应度值')
title('改进PSO算法收敛曲线')
legend('权重自适应PSO算法')
hold on
xm = pg';
fv = fitness(pg);