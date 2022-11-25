clc;clear;
load("A1_all_result.mat");

%构造一个加和的时长，即阶梯函数
SS = S;
for i = 2:4
    SS(:,i) = SS(:,i-1) + SS(:,i);
end

%绘制阶梯图像
t = key;
k = Z(t,:)%第t个类型的情况，对应了x(t,:)
figure    
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
%从上到下，每一个代表YM1到YM2
color0 = col(k(1),:) ;
rectangle('Position',[0 0 1 SS(k(1),1)],'FaceColor',color0,'EdgeColor','b','LineWidth',1)
text( 0.5 , SS(k(1),1)/2 ,['YM',num2str(k(1)),'CJ1'],'HorizontalAlignment',"center")

for i = 2 : 4
    rectangle('Position',[(i-1) SS(k(1),i-1) 1 S(k(1),i)],'FaceColor',color0,'EdgeColor','b','LineWidth',1)
    text( i-0.5 , SS(k(1),i-1)+S(k(1),i)/2 ,['YM',num2str(k(1)),'CJ',num2str(i)],'HorizontalAlignment',"center")
end

xt = SS(k(1),4);

for j = 2 : length(k)
    xt = xt + x(t,j);
    color = col(k(j),:) ;
    
    rectangle('Position',[3 xt-S(k(j),4) 1 S(k(j),4)],'FaceColor',color,'EdgeColor','b','LineWidth',1)
    text( 3.5 , xt-S(k(j),4)+S(k(j),4)/2 ,['YM',num2str(k(j)),'CJ4'],'HorizontalAlignment',"center")
    
    rectangle('Position',[2 xt-S(k(j),3)-S(k(j),4) 1 S(k(j),3)],'FaceColor',color,'EdgeColor','b','LineWidth',1)
    text( 2.5 , xt-S(k(j),3)-S(k(j),4)+S(k(j),3)/2 ,['YM',num2str(k(j)),'CJ3'],'HorizontalAlignment',"center")
    
    rectangle('Position',[1 xt-S(k(j),2)-S(k(j),3)-S(k(j),4) 1 S(k(j),2)],'FaceColor',color,'EdgeColor','b','LineWidth',1)
    text( 1.5 , xt-S(k(j),2)-S(k(j),3)-S(k(j),4)+S(k(j),2)/2 ,['YM',num2str(k(j)),'CJ2'],'HorizontalAlignment',"center")
    
    rectangle('Position',[0 xt-S(k(j),1)-S(k(j),2)-S(k(j),3)-S(k(j),4) 1 S(k(j),1)],'FaceColor',color,'EdgeColor','b','LineWidth',1)
    text( 0.5 , xt-S(k(j),1)-S(k(j),2)-S(k(j),3)-S(k(j),4)+S(k(j),1)/2 ,['YM',num2str(k(j)),'CJ1'],'HorizontalAlignment',"center")
    
end
text( 3.5 , xt-S(k(length(k)),4)+S(k(length(k)),4)+10 ,['total:',num2str( y(t,10) )],'HorizontalAlignment',"center")