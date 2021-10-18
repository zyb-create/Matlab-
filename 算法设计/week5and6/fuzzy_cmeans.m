clc,clear;
load location.txt;
threshold=1e-4;
n=size(location,1);
k=5;
% [clusters,centers]=fuzzy(5,k,n,location,threshold);
% figure;
% [clusters,centers]=fuzzy(4,k,n,location,threshold);
% drawFigure(location,clusters,centers,k,4);
for i=2:3:5
    for m=i:i+2
        subplot(2,3,m-1);
        [clusters,centers]=fuzzy(m,k,n,location,threshold);
        drawFigure(location,clusters,centers,k,m);
        
    end
end
% for i=3:3
%     for m=i:i+1
%         subplot(1,2,m-2);
%         [clusters,centers]=fuzzy(m,k,n,location,threshold);
%         drawFigure(location,clusters,centers,k,m);
%         
%     end
% end

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
    clusters(i)=find(u(:,i)==max(u(:,i)));
%    clusters(i)=minIndex(dis(:,i),k); 
end
end