clc,clear;
L = 1;
x = linspace(0,L,20);
% t=linspace(0,0.05,20);
t = [linspace(0,0.05,20), linspace(0.5,5,10)];

m = 0;
options = odeset('RelTol',1e-8,'AbsTol',1e-10);
sol = pdepe(m,@heatpde,@heatic,@heatbc,x,t,options);

colormap hot
imagesc(x,t,sol);
colorbar
xlabel('Distance x','interpreter','latex');
ylabel('Time t','interpreter','latex');
title('Heat Equation for $0 \le x \le 1$ and $0 \le t \le 5$','interpreter','latex');

function [c,f,s] = heatpde(x,t,u,dudx)  %一维偏微分方程
c = 1;
f = dudx;
s = 0;
end
function u0 = heatic(x)  %函数的初始条件
u0 = 0.5;
end
function [pl,ql,pr,qr] = heatbc(xl,ul,xr,ur,t)  %函数的边界条件
pl = ul;
ql = 0;
pr = ur - 1;
qr = 0;
end

