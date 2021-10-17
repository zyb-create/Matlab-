clc,clear;
n=309;
k=5;
location=random_initXY(n,k,[1 200]);
scatter(location(:,1),location(:,2),16);
axis([-10,210,-10,210]);
%%%%%%%%%%%%%%%%向文件中写数据
% fid=fopen('location.txt','wt');
% fprintf(fid,'%d %d\n',location');
% fclose(fid);

function l=random_initXY(n,k,range)
l=zeros(n,2);
inq=zeros(n,n);
t=1;
for i=1:k
    [x,y]=rd(inq,range);    
    inq(x,y)=1;
    l(t,:)=[x,y];
    t=t+1;
    num=floor(n/k);
    for j=1:num-1
        [x1,y1]=rd(inq,range); 
        while sqrt((x-x1)^2+(y-y1)^2)>15
            [x1,y1]=rd(inq,range); 
        end
        inq(x1,y1)=1;
        l(t,:)=[x1,y1];
        t=t+1;
    end
    
end
for i=1:n-k*floor(n/k)
    [x,y]=rd(inq,range);
    inq(x,y)=1;
    l(t,:)=[x,y];
    t=t+1;
end
end

function [x,y]=rd(inq,range)
xy=randi(range,1,2);
x=xy(1);y=xy(2);
while inq(x,y)
    xy=randi(range,1,2);
    x=xy(1);y=xy(2);
end
% inq(x,y)=1;
end