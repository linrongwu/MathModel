function c=PianWeifen(pop,C)
Q=40;%����
%C=4.91401813825403;%����3000m�ĳ�ʼŨ��
E=1*10^-2;%��ɢϵ��
a=1;%���ϵ��
c=(pop(1)*pop(2)+a*C*Q)/(pop(2)+a*Q);%���Ũ��
end
