clc,clear;

% f=[-4,-3];
% A=[2 1;1 1;];
% b=[10;8];
% lb=[0;0];
% ub=[+Inf;7];
% [x,Q]=linprog(f,A,b,[],[],lb,ub);

% f=[1,2];
% A=[-1 -1;-2 -5;];
% b=[-1;-10];
% lb=[0;0];
% x=linprog(f,A,b);

% z=@(x)-x(1)+x(2);
% lb=[0;-Inf];
% ub=[+Inf;+Inf];
% [x,y]=fmincon(z,rand(2,1),[],[],[],[],lb,ub,@fun);
% function [g,h]=fun(x)
% if x(2)<0
%     g=x(1)^2+x(2)^2-2;
% else
%     g=x(1)^2+x(2)^2-4;
% end
% 
% h=[];
% end

x=0:0.01:2;
y=sqrt(4-x.^2);
plot(x,y,'-');
hold on;
x=0:0.01:sqrt(2)+0.01;
y=-sqrt(2-x.^2);
plot(x,y,'-');
hold on;
plot([sqrt(2);2],[0;0],'-');
hold on;
plot([0;0],[-sqrt(2);2],'-');
x=-1:0.01:3;
y=x-2;
plot(x,y,'-');
hold on;
axis equal;
axis([-1.1 3.1 -3.1 3.1]);
