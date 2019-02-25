 load('C:\Users\lrw\Desktop\data.mat') 
 Isc=1353;
 wei=30.5286*pi/180;
 dong=114.3556;
 s=(23.45*sin(2*pi*(284+n)/365))*pi/180;%赤纬角
for a=0:90
    m=a+1;
    a=a*pi/180;
    I(m)=0;
    we=acos(-tan(wei-a)*tan(s));%带斜面
    wo=acos(-tan(wei)*tan(s));%水平面
    we=min(we,wo);
    I0=24/pi*Isc*(1+0.033)*cos((360*n/365))*(cos(wei)*cos(s)*sin(wo)+pi*wo*sin(wei)*sin(s)/180);
    Tstart=12*(1-wo/15);
    Tend=12*(1+we/15);
    for i=1:14001
        if data1(i,1)>=Tstart&&data1(i,1)<=Tend
            b=data1(i,3);
            h=data1(i,2);
            t=data1(i,1)+4*(120-dong);%太阳时
            w=(15*pi/180)*(t-12);%时角
            y=asin(cos(s)*sin(wei)/cos(h));
            cosy=(sin(wei)*cos(b)-cos(wei)*cos(y)*sin(a))+(cos(wei)*cos(a)+sin(wei)*cos(y)*sin(a))*cos(s)*cos(w)+sin(y)*sin(a)*sin(w);
            I(m)=I(m)+I0*cosy;
        end
    end
end


    