%% 清空环境
clc % 清屏
clear all; % 删除workplace变量
close all; % 关掉显示图形窗口
%% 参数初始化
%粒子群算法中的两个参数
c1 = 1.49445;
c2 = 1.49445;

maxg=100;   % 进化次数  
sizepop=100;   %种群规模
u=0.04;
Vmax=1;
Vmin=-1;
popmax=100;
popmin=0;
c0=4.80886066421392;
%% 产生初始粒子和速度
for i=1:sizepop
    %随机产生一个种群
    pop(i,:)=100*rands(1,2);    %初始种群
    V(i,:)=rands(1,2);        %初始化速度
    %计算适应度
    c=PianWeifen(pop(i,:),c0);
    uu=afdasd(c,u,c0); 
    fitness(i)=fun(pop(i,:),uu);   %染色体的适应度
end

%找最好的染色体
[bestfitness bestindex]=min(fitness);
zbest=pop(bestindex,:);   %全局最佳
gbest=pop;                %个体最佳
fitnessgbest=fitness;     %个体最佳适应度值
fitnesszbest=bestfitness; %全局最佳适应度值

%% 迭代寻优
for i=1:maxg
    maxg %迭代次数
    for j=1:sizepop
        
        %速度更新
        V(j,:) = V(j,:) + c1*rand*(gbest(j,:) - pop(j,:)) + c2*rand*(zbest - pop(j,:));
        V(j,find(V(j,:)>Vmax))=Vmax;
        V(j,find(V(j,:)<Vmin))=Vmin;
        
        %种群更新
        pop(j,:)=pop(j,:)+0.5*V(j,:);
        pop(j,find(pop(j,:)>popmax))=popmax;
        pop(j,find(pop(j,:)<popmin))=popmin;
        
        %自适应变异
        if rand>0.8
            k=ceil(2*rand);
            pop(j,k)=rand;
        end
      
        %适应度值
        c=PianWeifen(pop(j,:),c0);
        uu=afdasd(c,u,c0) ; 
        fitness(j)=fun(pop(j,:),uu);
        
        
        %个体最优更新
        if fitness(j) < fitnessgbest(j)
            gbest(j,:) = pop(j,:);
            fitnessgbest(j) = fitness(j);
        end
        
        %群体最优更新
        if fitness(j) < fitnesszbest
            zbest = pop(j,:);
            fitnesszbest = fitness(j);
        end
        
    end
    yy(i)=fitnesszbest;    
        
end

%% 结果分析
plot(yy,'Linewidth',2)
title(['适应度曲线  ' '终止代数＝' num2str(maxg)]);
grid on
xlabel('进化代数');ylabel('适应度');
% 结果输出
zbest %最佳个体值

