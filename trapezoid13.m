function [ out ] = trapezoid13( f,a,b,n )
% trapozoid 1/3 on interval [a,b] of function f using n intervals

x=linspace(a,b,n);
y=f(x);
out=sum(y)*2;
out=out-f(a)-f(b);
out=out*(b-a)/(2*n);

end
