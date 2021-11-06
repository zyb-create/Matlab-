clc,clear;
n=10;
T=179;
thr=0:0.01:T/n;
r=zeros(max(size(thr)),1);
x=zeros(max(size(thr)),1);
y=zeros(max(size(thr)),1);
for j=1:10
    for i=0:0.01:T/n
%         r(1+round(i*100))=calcS(n,j,2,i);
        r=calcS(n,j,2,i);
        k=1+round(i*100);
        x(k)=r*cos(n*j/180*pi); 
        y(k)=r*sin(n*j/180*pi);
    end
    plot(x,y,'-');
%     th=thr*n;
%     plot(th,r,'-');
    hold on;
end

% xlabel('度数');
axis([-1 2 0 2.5]);

figure(2);

T=360;
the=0:0.01:T;
for j=1:10
    r=1/j*sin(the/180*pi);
    x=r.*cos(the/180*pi);
    y=r.*sin(the/180*pi);
    plot(x,y,'-');
%     plot(the,r,'-');
    hold on;
end

% xlabel('度数');
axis([-0.7 0.7 -0.1 1.1]);

