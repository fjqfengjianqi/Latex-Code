clc;clear;
[Spre] = xlsread('D:\应用数学选讲\A题\A1_pre.xls');
S = zeros(10,4);
for i = 1 : 10
    for j = 1 : 4
        S( i , j ) = Spre( j+(i-1)*4 , 3 );
    end
end
%S第一行为YM1的四个时长，依次为YM2……YM10
[n,m] = size(S); %n为行数，m为列数
Z = perms(1:n); %列出所有排列组合
n_all = length(Z); %记录所有排列组合
x = zeros( n_all , n ); %记录排列时间矩阵
xx = zeros( 1 , n_all );
Min_x = 10000 ; 
for i = 1 : n_all
    k = Z(i,:); %读取某一个排列
    x(i,1) = sum( S( k(1) , : ) ); %位于底端的初始值
    for j = 2 : length(k)
        y = zeros(1,4);
        %S(k(j),1)表示k排列下第j个疫苗的第一个生产时长
        y(2) = S(k(j),3)-S(k(j-1),4);
        y(3) = S(k(j),3)+S(k(j),2)-S(k(j-1),3)-S(k(j-1),4);
        y(4) = S(k(j),3)+S(k(j),2)+S(k(j),1)-S(k(j-1),2)-S(k(j-1),3)-S(k(j-1),4);
        x(i,j) = max(y)+S(k(j),4);
        xx(i) = sum( x(i,:) );
    end
end

%找出最小的1600个
clc;clear;
load("A2.mat");
n = 1600;
mins = zeros(1,n);
keys = zeros(1,n);
for i = 1 : n
    mins(i) = min(xx);
    keys(i) = min( find(xx == mins(i)) );
    xx(keys(i)) = 500;
end

save("A3_keys")