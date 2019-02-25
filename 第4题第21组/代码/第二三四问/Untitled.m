clc
clear
data = xlsread('data1.xlsx',1);
% time = data(:,1);
h = data(:,2);
sita = data(:,3);
[n, r]= size(h);

beta0 = 42 / 180 * pi;
gamab = beta0;
H = 1.8;
i = 1.8 / 18;
w = 18;

m = 0;
x = 0;
y = 0;
z = 0;
ff = 0;
k = 0;
t = 0;
    for alpha = 5:5:85
        for D = 1:1:20
            k = (w - D) / (H* cos(alpha / 180 *pi) + 1);
            k = floor(k);
            s = 0;
            for i = 1:n
                sin_alpha = sin(h(i) / 180 * pi);
                cos_gama = sin(sita(i) / 180 * pi);
                d  = (H * sin(alpha) + i * H * cos(alpha)) * sin(sita(i) / 180 * pi - beta0) / (tan(h(i) / 180 * pi) - i * sin(sita(i) / 180 * pi - beta0));
                if d > D
                    break
                end
                a = [-sqrt(1-sin_alpha^2)*cos_gama  -sqrt(1-sin_alpha^2)*sqrt(1-cos_gama^2) -sin_alpha];
                b = [-sin(alpha / 180 * pi)*cos(gamab) -sin(alpha / 180 * pi)*sin(gamab)   -cos(alpha / 180 * pi)];
                c = sum(a.*b)/ norm(a)/norm(b);
                s = s + c;
            end
            if  s>0
                if i == n
                    if k * s > m 
                        m = k * s;
                        ff = s;
                        t = gamab;
                        x = k;
                        y = D;
                        z  = alpha;
                    end
                end
            end 
        end
    end