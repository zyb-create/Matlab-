clc,clear;
% K=50;
% N=100;
threshold=1e-4;
% dis=zeros(K,N);
% k=5; n=25;  %两个???初始化的条件
% centers=zeros(k,2);
% [location,dis]=random_initXY(n,k);
% clusters=random_clusters(k,n);
%%%%%%%%%%
load location.txt;
% load clusters.txt;
k=5; n=size(location,1);  %两个???初始化的条件
clusters=random_clusters(k,n);
%%%%%%%%%%

[clusters,centers]=kmeans_with_singlelink(threshold,k,n,clusters,location);
drawFigure(location,clusters,centers,k,-1);


function [l,d]=random_initXY(n,k)
d=zeros(k,n);
l=zeros(n,2);
inq=zeros(n,n);
for i=1:n
%    l(i,:)=20*rand(1,2); 
   xy=randi([1 20],1,2);
   x=xy(1);y=xy(2);
   while inq(x,y)
       xy=randi([1 20],1,2);
       x=xy(1);y=xy(2);
   end
   inq(x,y)=1;
   l(i,:)=[x,y];
end
for i=1:n-1
   for j=i+1:n
       dis=sqrt((l(i,1)-l(j,1))^2+(l(i,2)-l(j,2))^2);
       d(i,j)=dis;d(j,i)=dis;
   end
end
end

function c=random_clusters(k,n)
index=randi([1 k],1,n);
i=1;
while 1
   while size(find(index==i),1)==0
       index=randi([1 k],1,n);
       i=0;
       break;
   end
   i=i+1;
   if (i==k+1) 
       break;
   end
end
% for i=1:n
%     index=randi()
% end
c=index;
end

function [index,d]=minIndex(dis,k)
index=1;
d=dis(1);
for i=2:k
    if d>dis(i)
        index=i;
        d=dis(i);
    end
end
end

function c=calcCenters(clusters,location,k,n)
c=zeros(k,2);
p=zeros(k,1);
for i=1:n
    c(clusters(i),:)=c(clusters(i),:)+location(i,:); 
    p(clusters(i))=p(clusters(i))+1;
end
% c=c./p(:,1);
for i=1:k
    if p(i)==0
%        c(i,:)=[0,0];
       c(i,:)=randi([1 20],1,2);
        continue;
    end
    c(i,:)=c(i,:)./p(i);
end
% p
end

function [index,d]=calcClusters(centers,location,k,n)
index=zeros(n,1);
d=zeros(n,1);
for i=1:n
   dis=sqrt((centers(:,1)-location(i,1)).^2+(centers(:,2)-location(i,2)).^2);
   [j,d(i)]=minIndex(dis,k);
   index(i)=j;
end
end

function [index,centers]=kmeans_with_singlelink(th,k,n,clusters,location)
J=-1;
jtemp=0;
% temp=0;
while abs(jtemp-J)>th
    J=jtemp;
    centers=calcCenters(clusters,location,k,n);
    [clusters,dmin]=calcClusters(centers,location,k,n);
    jtemp=sum(dmin);
%     temp=temp+1;
%     jtemp,centers
end
index=clusters;
end