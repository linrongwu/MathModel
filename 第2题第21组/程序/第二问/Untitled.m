juzhen=0;
t=0;
while 1
    if need(:)==0
        break;
    else
        c=min(min(timer));  %�ҵ������е���Сֵ
        cposition=find(timer==c);% �ҵ�c�ھ����е�λ�ã���ֵ�ǰ������еõ���
        cposition=cposition(size(cposition,1));%��ֵ���ĵط�
        yushu=mod(cposition,4);%�ڼ���
        n=cposition/4;%�ڼ�����������
        n=floor(n);
        if yushu==0
            m=demand(n);%��n���������ĵĹ�Ӧ
            if need(4)>0
                if need(4)>m
                need(4)=need(4)-m;%����Ӧ��
                demand(n)=0;%��Ϊ0
                juzhen(4,n)=m;
                t=[t c];%��ʱ��
                else%����Ӧ��
                    demand(n)=demand(n)-need(4);%������
                    juzhen(4,n)=need(4);
                    need(4)=0;%��Ϊ0
                    ju(4,n)=demand(n);
                    t=[t c];%��ʱ��
                end
            end
            timer(4,n)=99999;%�ų��õ�
        else
            n=n+1;%�ڼ�����������
            m=demand(n);
            if need(yushu)>0
                if need(yushu)>m
                need(yushu)=need(yushu)-m;%����Ӧ��
                demand(n)=0;%��Ϊ0
                juzhen(yushu,n)=m;
                t=[t c];%��ʱ��
                else %����Ӧ��
                    demand(n)=demand(n)-need(yushu);%������
                    juzhen(yushu,n)=need(yushu);
                    need(yushu)=0;%��Ϊ0
                    ju(4,n)=demand(n);
                    t=[t c];%��ʱ��
                end
            end
            timer(yushu,n)=99999;%�ų��õ�
        end
    end
end     