for b=0:90
    n=b+1;
    I(n)=0;
    for i=1:3255
        sinr=cos(data3(i,5)*pi/180)*sin(30.5286*pi/180)/cos(data3(i,3)*pi/180);
        %if sinr>1
        %    sinr=1;
        %end
        cosy=sin(30.5286*pi/180)*cos(b*pi/180)-cos(30.5286*pi/180)*(1-sinr^2)^0.5*sin(b)+(cos(30.5286*pi/180)*cos(b)+sin(30.5286*pi/180)*(1-sinr^2)^0.5*sin(b))*cos(data3(i,5)*pi/180)*cos(data3(i,6)*pi/180)+sinr*sin(b)*cos(data3(i,5)*pi/180)*sin(data3(i,6)*pi/180);
        io=24/pi*1353*(1+0.033*cos(360*n/365))*(cos(data3(i,5)*pi/180)*cos(30.5286*pi/180)*sin(data3(i,7))+data3(i,7)*sin(30.5286*pi/180)*sin(data3(i,5)*pi/180));
        t=io*cosy;
        if t>0;
            I(n)=I(n)+t;
        end
    end
    m=I(n);
    m;
end