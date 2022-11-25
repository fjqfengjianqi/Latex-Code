clc;clear;clf;
[Spre] = xlsread('D:\应用数学选讲\A题\A1_pre.xls');%3为均值，4为方差
SS = zeros(40,1);
for i = 1 : 40
    SS(i) = norminv(0.9,Spre(i,3),Spre(i,4));
end
S = zeros(10,4);
for i = 1 : 10
    for j = 1 : 4
        S( i , j ) = SS( j+(i-1)*4 , 1 );
    end
end
n_box = zeros(1,10);%一天最多生产多少箱
for i = 1 : 10
    n_box(i) = floor( 960 / max( S(i,:) ) );
end
tt = [1000 500 600 1000 1200 1600 1800 800 600 900];
%S第一行为YM1的四个时长，依次为YM2……YM10
[n,m] = size(S); %n为行数，m为列数
Z = perms(1:n); %列出所有排列组合
n_all = length(Z); %记录所有排列组合
days = zeros( n_all , 1 );
Rand = round( rand(1,1000)*3628800 );
for i = 1 : n_all
    k = Z(i,:); %读取某一个排列
    j = 1;
    day = 0;
    ttl = tt;
    while j < 10
        d = floor( ttl(k(j)) / n_box(k(j)) );
        n = count3(ttl(k(j))-d*n_box(k(j)),k(j),k(j+1),S);
        ttl(k(j)) = 0;
        ttl(k(j+1)) = ttl(k(j+1)) - n;
        if n ~= 0
            day = day + d + 1;
        else
            day = day + d;
        end
        j = j + 1;
    end
    days(i) = day + ttl(k(10)) / n_box(k(10));
end
min(days)
mmin = find( days == min(days) )

save("A4_time.mat")