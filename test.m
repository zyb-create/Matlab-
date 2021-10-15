clc,clear;
load xy.txt;
load center.txt;

x=xy(:,1);
y=xy(:,2);

scatter(x,y,'filled');
% scatter2(apf(:,2),apf(:,3),apf(:,1), 'filled');
% hold on;
% plot(x,y,'-');
grid on;
for i=1:size(x,1)
    hold on;
    text(x(i)+0.2,y(i),{i});%在图上显示文
end
for i=1:size(center,1)
    hold on;
    scatter(x(center(i)),y(center(i)),'filled','r');
%     text(x(i)+0.2,y(i),{i});%在图上显示文
end
axis([-0.5,20.5,-0.5,20.5]);