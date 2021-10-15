function f=fun(x,t)

pi=3.1415926;
a1=1;
a2=1;
b1=1;
b2=1;
k1=1;
k2=1;

a=2 * sqrt(t/pi) * exp(-k1*k1/(4*t));
b=k1*erfc(k1/(2*sqrt(t)));
c=2*sqrt(t/pi)*exp(-k2*k2/(4*t));
d=k2*erfc(k2/(2*sqrt(t)));
e=1;
f=(exp(-a1*t)-exp(-b1*t))/(b1-a1);
g=(exp(-a2*t)-exp(-b2*t))/(b2-a2);

T=0;
A=0;
B=0;
C=0;


for i=0:50
    A=A+a-b;
end

for i=0:50
    B=B+c-d;
end

C=e*(f-g);

T=A+B+C;

f=T;

end

