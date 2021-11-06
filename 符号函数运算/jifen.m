clc,clear;
syms r a x y(x);
f=cos(a*cos(r));
f=int(f,r,[0 2*pi]);
f=simplify(f);

