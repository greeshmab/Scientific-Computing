function [u] = Adams_Bash(a,b,h,k,y0)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
N = 1+ ((b-a)/h);
x = linspace(a,b,N);
u = ones(3,N);
x1(1) = y0;
err(1) = 0;
[m,z] = ode45(k,x,y0);
for i = 1:2
    x1(i+1) = z(i+1);
    err(i+1) = abs(x1(i+1) - z(i+1));
end
for i = 3:N-1
    x1(i+1) = x1(i) + h*(23*k(x(i),x1(i)) - 16*k(x(i-1),x1(i-1))  + 5*k(x(i-2),x1(i-2)) )/12;
    err(i+1) = abs(x1(i+1) - z(i+1));
end
u([1],:) = x1;
u([2],:) = err;
u([3],:) = x;
end
