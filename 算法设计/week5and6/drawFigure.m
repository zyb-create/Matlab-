function drawFigure(location,clusters,centers,k,m)
% figure;
% x=location(:,1);y=location(:,2);
% scatter(x,y,'filled');
grid on;
for i=1:k
   index=clusters==i; 
   xy=location(index,:);
   scatter(xy(:,1),xy(:,2),16);
   hold on;
end
% for i=1:size(x,1)
%     hold on;
%     text(x(i)+0.2,y(i),{i});%在图上显示文
% end
scatter(centers(:,1),centers(:,2),36,[0.6350 0.0780 0.1840],'filled');
axis([-10,210,-10,210]);
if m~=-1
    xlabel(['m=',num2str(m)]);
end
hold off;
end

