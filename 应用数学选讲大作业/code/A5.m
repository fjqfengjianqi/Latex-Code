clc;clear;
load('A1_all_result.mat','S');
W = 100*[42
    54
    50
    43
    42
    45
    48
    51
    46
    48];% dollar
tt = [1000
    500
    600
    1000
    1200
    1600
    1800
    800
    600
    900];%箱数
ma = max(S')';
ratio = W./ma;
% b = bar(ratio)
% xlabel('YM')
% ylabel('性价比')
% set(gca,'ylim',[0,350],'ytick',[0:50:350]); %纵坐标数值为0到1600，每隔200显示刻度
% set(gca, 'Ygrid','on'); %纵坐标刻度显示网格
% xtips1 = b.XEndPoints;
% ytips1 = b.YEndPoints; %获取 Bar 对象的 XEndPoints 和 YEndPoints 属性
% labels1 = string(b.YData); %获取条形末端的坐标
% text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
%     'VerticalAlignment','bottom')
% %将这些坐标传递给 text 函数，并指定垂直和水平对齐方式，让值显示在条形末端上方居中处

r = zeros(10,2);%第一列是位置，第二列是性价比大小
for i = 1:10
    r(i,2) = max(ratio);
    r(i,1) = find(ratio == r(i,2));
    ratio(r(i,1)) = 0;
end
n_box = zeros(1,10);%一天最多生产多少箱
for i = 1 : 10
    n_box(i) = floor( 960 / max( S(i,:) ) );
end
k = r(:,1); %读取某一个排列
j = 1;
day = 0;
ttl = tt;
while j < 10
    k(j);
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
%67天，剩余33天生产YM7
money = 0;
for i = 1:5
    k(i)
    tt(k(i))*W(k(i))
    money = money + tt(k(i))*W(k(i));
end
33*n_box(k(6))*W(k(6))
money = money + 33*n_box(k(6))*W(k(6))