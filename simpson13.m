function [ out ] = simpson13( f,a,b,n )

x=linspace(a,b,n);
y=f(x);
h=(b-a)/n;
x_=linspace(a,b,n/2);
y_=f(x_);

s=sum(y*4);
s=s-f(a)-f(b);
s=s-2*sum(y_);
s=s*h/3;

out=s;



end
