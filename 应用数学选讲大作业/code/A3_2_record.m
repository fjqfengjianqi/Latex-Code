clc;clear;
load("A3_keys.mat",'keys');
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
ii = 0;
for i = keys
    ii = ii+1;
    k = Z(i,:); %读取某一个排列
    a2(ii).key = i ;
    a2(ii).order = k ;
    x(i,1) = sum( S( k(1) , : ) ); %位于底端的初始值
    band = zeros(1,10);
    key_j = ones(1,10);
    band(1) = S( k(1) , 1 );
    for j = 2 : length(k)
        y = zeros(1,4);
        %S(k(j),1)表示k排列下第j个疫苗的第一个生产时长
        y(3) = S(k(j),3)-S(k(j-1),4);
        y(2) = S(k(j),3)+S(k(j),2)-S(k(j-1),3)-S(k(j-1),4);
        y(1) = S(k(j),3)+S(k(j),2)+S(k(j),1)-S(k(j-1),2)-S(k(j-1),3)-S(k(j-1),4);
        yy = y(1:3);
        yy = yy(yy>0);
        ba = max(y)*ones(1,length(yy))-yy ;
        ba = ba(ba>0);
        bandd = min(ba);
            if isempty(bandd)
            ba = y(y<0);
            bandd = -max(ba);
        end
        band(j) = bandd;
        key_j(j) = find(y == max(y));
        x(i,j) = max(y)+S(k(j),4);
        xx(i) = sum( x(i,:) );
    end
    a2(ii).keyj = key_j;
    a2(ii).band = band;
    a2(ii).sumband = sum(band);
    a2(ii).sum = xx(i);
end

save("A3prob.mat")