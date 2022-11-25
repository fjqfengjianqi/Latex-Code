clc;clear;
load("A3prob.mat");
y0 = zeros(1,50);
x0 = linspace(0.01,0.09,50);
yy = zeros(50,1600);
for j = 1:1600
        fun = 1;
        for i = 1:10
            ii = a2(j).order(i);
            jj = a2(j).keyj(i);
            ij = (ii-1).*4+jj;
            fun = fun*1/( (2*pi)^0.5*a(ij,4) );
            o(i) = 2*a(ij,4)^2;
        end
         fun1 = @(t) -fun/exp(t(1)^2/o(1)+t(2)^2/o(2)+t(3)^2/o(3)+t(4)^2/o(4)+
         t(5)^2/o(5)+t(6)^2/o(6)+t(7)^2/o(7)+t(8)^2/o(8)+t(9)^2/o(9)+t(10)^2/o(10));
    for i = 1:50
        w = a2(j).sum-a2(1).sum*(1-x0(i));
        band = a2(j).band;
        o = zeros(1,10);
        [x,y] = fmincon(fun1,zeros(10,1),[],[],ones(1,10),w,zeros(10,1),band');
        yy(i,j) = -y;
    end
end
%%绘图部分
% [xk jkey] = find( yy == max(yy) )
% a2(jkey)
% yy(jkey)
% plot(1:1600,yy)
y0 = max(yy')';
plot(x0,y0)
xlabel('缩短时间比例');
ylabel('概率');