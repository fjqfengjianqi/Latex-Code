clc;clear;
%均值，方差，最值，概率分布
[a,b,c] = xlsread('D:\应用数学选讲\A题\Attachment 1.xls'); %读取表格数据
% ymax = zeros(40,1); %最大值
% ymin = zeros(40,1); %最小值
% yavg = zeros(40,1); %平均值
% yvar = zeros(40,1); %方差

for i = 2 : 41
    A = str2num( cell2mat( c(i,3) ) );
%     ymax(i-1) = max( max(A) );
%     ymin(i-1) = min( min(A) );
%     yavg(i-1) = mean( mean(A) );
%     yvar(i-1) = std2(A);
    
    %绘图部分
    subplot(10,4,i-1)
    histogram(A,25) %绘制分布直方图-概率分布
    ym = ceil( (i-1)/4 );
    if mod(i-1,4) == 0
        cj = 4;
    else
        cj = mod(i-1,4);
    end
    title(['YM',num2str(ym),'CJ',num2str(cj)])
    
end

% %写入表格部分
% xlswrite('A1_pre',ymax,'sheet1','C2');
% xlswrite('A1_pre',ymin,'sheet1','D2');
% xlswrite('A1_pre',yavg,'sheet1','E2');
% xlswrite('A1_pre',yvar,'sheet1','F2');