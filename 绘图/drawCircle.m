clc,clear;
load xy.txt;
rectangle('Position',[0,0,20,10]);
hold on;
scatter(xy(1:5,1),xy(1:5,2),'filled','r');
scatter(xy(6:size(xy,1),1),xy(6:size(xy,1),2),16,'filled','k');
for i=1:5
   hold on;
   drawC(2,xy(i,1),xy(i,2),i);
   
end
axis([-1,21,-1,11]);
grid on;
% scatter(xy(6:size(xy,1),1),6:size(xy,1),16,'filled','k');
hold off;

% r = 5;%半径
% a = 0;%横坐标
% b = 2;%纵坐标    
% para = [a-r, b-r, 2*r, 2*r];
% rectangle('Position', para, 'Curvature', [1 1]);

function drawC(r,x,y,k)
if k==1
    theta=0;
elseif k==2
    theta=1.5*pi:pi/40:2*pi;
    
elseif k==3
    theta=1*pi:pi/40:1.5*pi;
elseif k==4
    theta=0.5*pi:pi/40:1*pi;
else
    theta=0:pi/40:0.5*pi;
end
a=x+r*cos(theta);
b=y+r*sin(theta);
plot(a,b,'-');
axis equal;
if k~=1
    theta=theta([5,10,15]);
    a=x+r*cos(theta);
    b=y+r*sin(theta);
    scatter(a,b,16,'filled','k');
end

end

% x = linspace(0,10,1000);
% y = sin(x);
% plot(x,y)
% hold on
% p = plot(x(1),y(1),'o','MarkerFaceColor','red');
% hold off
% axis manual
% for k = 2:length(x)
%     p.XData = x(k);
%     p.YData = y(k);
%     drawnow
% end

% theta = linspace(-pi,pi);
% xc = cos(theta);
% yc = -sin(theta);
% plot(xc,yc);
% axis equal
% xt = [-1 0 1 -1];
% yt = [0 0 0 0];
% hold on
% t = area(xt,yt); % initial flat triangle
% hold off
% for j = 1:length(theta)-10
%     xt(2) = xc(j); % determine new vertex value
%     yt(2) = yc(j);
%     t.XData = xt; % update data properties
%     t.YData = yt;
%     drawnow limitrate % display updates
% end