function [ out ] = simpson38( f,a,b,n )

x=linspace(a,b,n);
y=f(x);
x_=linspace(a,b,n/3);
y_=f(x_);
h=(b-a)/n;

out=sum(y*3);
out=out-sum(y_);
out=out-f(a)-f(b);
out=out*3*h/8;


end
