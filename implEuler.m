function [u] = implEuler(a,b,h,k,y0)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
N = 1+ ((b-a)/h);
x = linspace(a,b,N);
u = ones(3,N);
x1(1) = y0;
err(1) = 0;
[m,z] = ode45(k,x,y0);
MAX_IT = 20;
TOL = 0.00000001;
for i = 2:N
    ynew = x1(i-1) + h*k(x(i-1),x1(i-1));
    for j = 1:MAX_IT
       x1(i) = x1(i-1) + h*k(x(i),ynew);
      if abs(ynew - x1(i)) < TOL
          break;
      else
            ynew = x1(i);
      end
    end
    err(i) = abs(x1(i) - z(i));
end
u([1],:) = x1;
u([2],:) = err;
u([3],:) = x;
end
