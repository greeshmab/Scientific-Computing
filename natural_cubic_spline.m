function[l] = natural_cubic_spline(x,y,n,xx)

b = zeros(1,n);
c = zeros(1,n);
d = zeros(1,n);
for i =1:n
    a(i)=y(i);
end

h = diff(x);
H = zeros(n-2,1);
for i =1:n-2
    H(i) = (3*(a(i+2)-a(i+1))/h(i+1))-(3*(a(i+1)-a(i))/h(i));
end
A = zeros(n-2);
for i = 3:n-2
    p=i-1;
    q=i-2;
    r=(n-2)*(q-1) + p;
    A(r) = h(i-1);
    q=i-1;
    r=(n-2)*(q-1) + p;
    A(r) = 2*(h(i-1)+h(i));
    q=i;
    r=(n-2)*(q-1) + p;
    A(r) = h(i);
end
A(1) = 2*(h(1) + h(2));
A(n-1) = h(2);
A((n-2)*(n-3)) = h(n-2);
A((n-2)*(n-2)) = 2*(h(n-2)+h(n-1));
c = (A^-1)*H;
c = transpose(c);
c = [0 c 0];
for i = 1:n-1
    b(i) = ((a(i+1) - a(i))/h(i)) - ((2*c(i) + c(i+1))*h(i)/3);
end
b(n) = b(n-1) + h(n-1)*(c(n-1) + c(n));
for i = 1:n-1
    d(i) = (c(i+1)-c(i))/(h(i)*3);
end
i=1;
while x(i) < xx,
    i = i+1;
end

l = a(i) + b(i)*(xx - x(i)) + c(i)*(xx - x(i))*(xx - x(i)) + d(i)*(xx - x(i))*(xx - x(i))*(xx - x(i));

end
