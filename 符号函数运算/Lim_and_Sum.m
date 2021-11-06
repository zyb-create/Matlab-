clc,clear;
syms x a n;
y=1/(x*(log(x)^2))-1/(x-1)^2;
f1=limit(y,x,1,'right');  %求极限
f=a*n^3+(a-1)*n^2;
f2=symsum(f,n,0,50);  %求和

f3=sin(a*x);
dfx=diff(f3,x);  %对x求导
dfa=diff(f3,a);  %对a求导
f4=x*log(1+x);
int1=int(f3,x); %对x积分
int2=int(f4,x,0,1); %求[0,1]区间上的积分

% Dy=diff(y,x);
% d=(Dy+3*x*y==x*exp(-x^2));
% f5=dsolve(d,x);
f5=dsolve('Dy+3*x*y=x*exp(-x^2)','x'); %求对变量x的通解
% f6=dsolve('x*Dy+2*y-exp(x)=0','y(1)=2*exp(1)','x'); %求一阶微分方程的特解
% f7=dsolve('D2y+2*Dy+exp(x)=0','x'); %求二阶微分方程的通解
% clc;