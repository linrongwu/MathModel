juzhen=0;
t=0;
while 1
    if need(:)==0
        break;
    else
        c=min(min(timer));  %找到矩阵中的最小值
        cposition=find(timer==c);% 找到c在矩阵中的位置，其值是按列排列得到的
        cposition=cposition(size(cposition,1));%找值最大的地方
        yushu=mod(cposition,4);%第几行
        n=cposition/4;%第几个配送中心
        n=floor(n);
        if yushu==0
            m=demand(n);%第n个配送中心的供应
            if need(4)>0
                if need(4)>m
                need(4)=need(4)-m;%供不应求
                demand(n)=0;%供为0
                juzhen(4,n)=m;
                t=[t c];%加时间
                else%供过应求
                    demand(n)=demand(n)-need(4);%供减少
                    juzhen(4,n)=need(4);
                    need(4)=0;%求为0
                    ju(4,n)=demand(n);
                    t=[t c];%加时间
                end
            end
            timer(4,n)=99999;%排除该点
        else
            n=n+1;%第几个配送中心
            m=demand(n);
            if need(yushu)>0
                if need(yushu)>m
                need(yushu)=need(yushu)-m;%供不应求
                demand(n)=0;%供为0
                juzhen(yushu,n)=m;
                t=[t c];%加时间
                else %供过应求
                    demand(n)=demand(n)-need(yushu);%供减少
                    juzhen(yushu,n)=need(yushu);
                    need(yushu)=0;%求为0
                    ju(4,n)=demand(n);
                    t=[t c];%加时间
                end
            end
            timer(yushu,n)=99999;%排除该点
        end
    end
end     