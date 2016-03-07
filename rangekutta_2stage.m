function [u] = rangekutta_2stage(a,b,h,k,y0,c2)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
w2 = 1/(2*c2);
w1 = 1-w2;
a21 = c2;
N = 1+ ((b-a)/h);
x = linspace(a,b,N);
u = ones(3,N);
x1(1) = y0;
err(1) = 0;
[m,z] = ode45(k,x,y0);
for i = 2:N
    k1 = h*k(x(i-1),x1(i-1));
    k2 = h*k(x(i-1)+c2*h,x1(i-1) + a21*k1);
    x1(i) = x1(i-1) + w1*k1 + w2*k2;
    err(i) = abs(x1(i) - z(i));
end
u([1],:) = x1;
u([2],:) = err;
u([3],:) = x;
end

