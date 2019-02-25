%% ��ջ���
clc % ����
clear all; % ɾ��workplace����
close all; % �ص���ʾͼ�δ���
%% ������ʼ��
%����Ⱥ�㷨�е���������
c1 = 1.49445;
c2 = 1.49445;

maxg=100;   % ��������  
sizepop=100;   %��Ⱥ��ģ
u=0.04;
Vmax=1;
Vmin=-1;
popmax=100;
popmin=0;
c0=4.80886066421392;
%% ������ʼ���Ӻ��ٶ�
for i=1:sizepop
    %�������һ����Ⱥ
    pop(i,:)=100*rands(1,2);    %��ʼ��Ⱥ
    V(i,:)=rands(1,2);        %��ʼ���ٶ�
    %������Ӧ��
    c=PianWeifen(pop(i,:),c0);
    uu=afdasd(c,u,c0); 
    fitness(i)=fun(pop(i,:),uu);   %Ⱦɫ�����Ӧ��
end

%����õ�Ⱦɫ��
[bestfitness bestindex]=min(fitness);
zbest=pop(bestindex,:);   %ȫ�����
gbest=pop;                %�������
fitnessgbest=fitness;     %���������Ӧ��ֵ
fitnesszbest=bestfitness; %ȫ�������Ӧ��ֵ

%% ����Ѱ��
for i=1:maxg
    maxg %��������
    for j=1:sizepop
        
        %�ٶȸ���
        V(j,:) = V(j,:) + c1*rand*(gbest(j,:) - pop(j,:)) + c2*rand*(zbest - pop(j,:));
        V(j,find(V(j,:)>Vmax))=Vmax;
        V(j,find(V(j,:)<Vmin))=Vmin;
        
        %��Ⱥ����
        pop(j,:)=pop(j,:)+0.5*V(j,:);
        pop(j,find(pop(j,:)>popmax))=popmax;
        pop(j,find(pop(j,:)<popmin))=popmin;
        
        %����Ӧ����
        if rand>0.8
            k=ceil(2*rand);
            pop(j,k)=rand;
        end
      
        %��Ӧ��ֵ
        c=PianWeifen(pop(j,:),c0);
        uu=afdasd(c,u,c0) ; 
        fitness(j)=fun(pop(j,:),uu);
        
        
        %�������Ÿ���
        if fitness(j) < fitnessgbest(j)
            gbest(j,:) = pop(j,:);
            fitnessgbest(j) = fitness(j);
        end
        
        %Ⱥ�����Ÿ���
        if fitness(j) < fitnesszbest
            zbest = pop(j,:);
            fitnesszbest = fitness(j);
        end
        
    end
    yy(i)=fitnesszbest;    
        
end

%% �������
plot(yy,'Linewidth',2)
title(['��Ӧ������  ' '��ֹ������' num2str(maxg)]);
grid on
xlabel('��������');ylabel('��Ӧ��');
% ������
zbest %��Ѹ���ֵ

