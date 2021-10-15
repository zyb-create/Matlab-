clc,clear;
A=[0 1 2 3 4 20];
% B=1:20;

for i=1:6
B(i)=sum((A-A(i)).^2);
end
% sqrt(B)

% sum(B)