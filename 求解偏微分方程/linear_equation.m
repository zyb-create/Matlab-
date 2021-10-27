clc,clear;
syms a1 a2 x1 x2 r;
x=x1-a1*cos(r)-a2*sin(r);
y=x2-a1*sin(r)-a2*cos(r);
[a1,a2]=solve(x,y,a1,a2);
% a1=simplify(a1),a2=simplify(a2)
