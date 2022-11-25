function [n_2,Tmax] = count3(rest,a11,a22,S)
n1 = rest;
a1 = a11;
a2 = a22;
T_a1 = n1*max( S(a1,:) );
if 960-T_a1 > 0
    n2 = floor( (960-T_a1) / max(S(a2,:)) )+2;    
%part1
y = zeros(1,4);
%S(k(j),1)表示k排列下第j个疫苗的第一个生产时长
y(3) = S(a1,3)-S(a1,4);
y(2) = S(a1,3)+S(a1,2)-S(a1,3)-S(a1,4);
y(1) = S(a1,3)+S(a1,2)+S(a1,1)-S(a1,2)-S(a1,3)-S(a1,4);
x1 = max(y)+S(a1,4);

t_a1 = x1*(n1-1)+S(a1,4);

%part2
yy = zeros(1,4);
%S(k(j),1)表示k排列下第j个疫苗的第一个生产时长
yy(3) = S(a2,3)-S(a1,4);
yy(2) = S(a2,3)+S(a2,2)-S(a1,3)-S(a1,4);
yy(1) = S(a2,3)+S(a2,2)+S(a2,1)-S(a1,2)-S(a1,3)-S(a1,4);
x2 = max(yy)+S(a2,4);

t_com = x2;

%part3
yyy = zeros(1,4);
%S(k(j),1)表示k排列下第j个疫苗的第一个生产时长
yyy(3) = S(a2,3)-S(a2,4);
yyy(2) = S(a2,3)+S(a2,2)-S(a2,3)-S(a2,4);
yyy(1) = S(a2,3)+S(a2,2)+S(a2,1)-S(a2,2)-S(a2,3)-S(a2,4);
x3 = max(yyy)+S(a2,4);
T = 1000*ones(1,4);
while max(T) > 960
    T(4) = t_a1 + t_com + x3*(n2 - 1);
    T(3) = T(4) + S(a1,3) - S(a2,4);
    T(2) = T(3) + S(a1,2) - S(a2,3);
    T(1) = T(2) + S(a1,1) - S(a2,2);
    n2 = n2 - 1;
end
Tmax = max(T);
n_2 = n2 + 1;
else
    n_2 = 0;
end
end