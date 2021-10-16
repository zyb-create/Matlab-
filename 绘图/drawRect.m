clc,clear;
load t.txt;
rectangle('Position',[0,0,12,12]);
hold on;

for i=1:5
   hold on;
   drawT(t(i,1),t(i,2),2);
   
end
axis([-1,13,-1,13]);
scatter(t(:,1),t(:,2),'filled','r');
grid on;
% scatter(xy(6:size(xy,1),1),6:size(xy,1),16,'filled','k');
hold off;


function drawT(x,y,r)
a=ones(1,2);
% a(1,1)=x;
% a(1,2)=y;
k=1;
for i=-r/2:r:r/2
    for j=-r/2:r:r/2
        a(k,1)= x+i;
        a(k,2)=y+j;
        k=k+1;
    end
end
scatter(a(:,1),a(:,2),16,'filled','k');
plot(a(:,1),a(:,2),'-');
axis equal;
end

