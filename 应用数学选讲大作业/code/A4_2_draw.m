clc;clear;clf;
load("A4_time.mat")
%S第一行为YM1的四个时长，依次为YM2……YM10
col = [0 1 0.5
    1 0 0
    0 0.74 1
    1 0.9 0.9
    1 1 0
    1 0 1
    0.67 0 1
    1 0.5 0
    0.24 0.57 0.5
    0.5 0.5 0.5];
mmin = min(days)
m = find(days == mmin);
for i = 1:length(m)
    Z(m(i),:)
end
%绘图部分 
for i = m(2)
    figure
    k = Z(i,:); %读取某一个排列
    j = 1;
    day = 0;
    ttl = tt;
    while j < 10
        d = floor( ttl(k(j)) / n_box(k(j)) );
        color0 = col(k(j),:);
        text(day+5 , 980 ,['YM',num2str(k(j))],'HorizontalAlignment',"center")
        for ii = 1 : d
            rectangle('Position',[day+ii-1 0 0.8 n_box(k(j))*max(S(k(j),:))],'FaceColor',color0)
        end
        rest = ttl(k(j))-d*n_box(k(j));
        rectangle('Position',[day+ii 0 0.8 rest*max(S(k(j),:))],'FaceColor',color0)
        [n,T] = count3(rest,k(j),k(j+1),S);
        if n ~= 0
            rectangle('Position',[day+ii rest*max(S(k(j),:)) 0.8 T-rest*max(S(k(j),:))],'FaceColor',col(k(j+1),:))
            day = day + d + 1;
        else
            day = day + d;
        end   
        ttl(k(j)) = 0;
        ttl(k(j+1)) = ttl(k(j+1)) - n;
        j = j + 1;
    end
    rr = floor( ttl(k(10)) / n_box(k(10)) );
    text(day+5 , 980 ,['YM',num2str(k(10))],'HorizontalAlignment',"center")
    for ii = 1:rr
        rectangle('Position',[day+ii-1 0 0.8 n_box(k(j))*max(S(k(j),:))],'FaceColor',col(k(j),:))
        ttl(k(j)) = ttl(k(j)) - n_box(k(j));
    end
    if ttl(k(j)) == 0
    else
    rectangle('Position',[day+rr 0 0.8 ttl(k(j))*max(S(k(j),:))],'FaceColor',col(k(j),:))
    end
    days(i) = day + ttl(k(10)) / n_box(k(10));
end