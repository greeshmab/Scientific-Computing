function [u] = Adams_Moulton(a,b,h,k,y0)
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
    ynew =  x1(i) + h*k(x(i),x1(i));
    x1(i+1) = x1(i) + h*(9*k(x(i+1),ynew) + 19*k(x(i),x1(i)) - 5*k(x(i-1),x1(i-1))  + k(x(i-2),x1(i-2)) )/24;
    err(i+1) = abs(x1(i+1) - z(i+1));
end
u([1],:) = x1;
u([2],:) = err;
u([3],:) = x;
end

