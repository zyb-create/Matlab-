% clc,clear;
% load location.txt;
threshold=1e-4;
n=size(location,1);
k=5;
% [clusters,centers]=fuzzy(5,k,n,location,threshold);
% figure;
for i=2:3:5
    for m=i:i+2
        subplot(2,3,m-1);
        [clusters,centers]=fuzzy(m,k,n,location,threshold);
        drawFigure(location,clusters,centers,k,m);
        
    end
end

% figure;
% x=location(:,1);y=location(:,2);
% scatter(x,y,'filled');
% grid on;
% for i=1:size(x,1)
%     hold on;
%     text(x(i)+0.2,y(i),{i});%在图上显示文
% end
% scatter(centers(:,1),centers(:,2),'filled','r');
% % for i=1:size(centers,1)
% %     hold on;
% %     text(centers(i,1)+0.2,centers(i,2),{i});%在图上显示文
% % end
% axis([-1,210,-1,210]);
% hold off;

function u=randomU(k,n)
u=zeros(k,n);
for i=1:k
    x=randi([1 n+100],1,n);
    u(i,:)=x./sum(x);
end
end

function index=minIndex(dis,k)
index=1;
d=dis(1);
for i=2:k
    if d>dis(i)
        index=i;
        d=dis(i);
    end
end
end

function [c,dis]=calcClusters(k,n,u,m,location)
% c=zeros(k,2);
dis=zeros(k,n);
mu=zeros(k,1);
u=u.^m;
c=u*location;
for i=1:k
    mu(i)=sum(u(i,:));
    
end
c=c./mu;
for i=1:k
    dis(i,:)=sqrt((location(:,1)-c(i,1)).^2+(location(:,2)-c(i,2)).^2);
end
% u,c,dis
end

function [u,jtemp]=calcU(dis,k,n,m,it)
u=zeros(k,n);
m=2/(m-1);
for i=1:k
    for j=1:n
        s=(dis(i,j)*(dis(:,j).^(-1))).^m;
        u(i,j)= 1/sum(s);
    end
end
% for i=1:k
%     u(i,:)=u(i,:)./sum(u(i,:));
% end
jtemp=max(max(u));
jtemp=jtemp^it;
% sum(u(1,:))%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

function [clusters,centers]=fuzzy(m,k,n,location,th)  %m不能等于1
clusters=zeros(n,1);
u=randomU(k,n);
J=-1;
jtemp=0;
it=1;
while abs(jtemp-J)>th
    J=jtemp;
    [centers,dis]=calcClusters(k,n,u,m,location);
    [u,jtemp]=calcU(dis,k,n,m,it);
    it=it+1;
end
for i=1:n   
   clusters(i)=minIndex(dis(:,i),k); 
end
end