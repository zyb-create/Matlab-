n=100;
L=5;
x=L/n;

X=zeros(100,1);

for i=1:n
    X(i)=fun(x*i,0.5);
end

Y=x:x:x*100;
plot(Y,X,'*');