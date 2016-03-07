function[l] = Clamped_spline(x,y,n,xx,a1,an)
  
  b = zeros(1,n);
  c = zeros(1,n);
  d = zeros(1,n);
  for i =1:n
      a(i)=y(i);
  end
  
  h = diff(x);
  H = zeros(n,1);
  for i =2:n-1
      H(i) = (3*(a(i+1)-a(i))/h(i))-(3*(a(i)-a(i-1))/h(i-1));
  end
  H(1) = ((a(2) - a(1))/h(1)) - a1;
  H(n) =  an-((a(n) - a(n-1))/h(n-1)) ;
  A = zeros(n);
  for i = 3:n
      p=i-1;
      q=i-2;
      r=(n)*(q-1) + p;
      A(r) = h(i-2);
      q=i-1;
      r=(n)*(q-1) + p;
      A(r) = 2*(h(i-2)+h(i-1));
      q=i;
      r=(n)*(q-1) + p;
      A(r) = h(i-1);
  end
  A(1) = 2*(h(1));
  A(n+1) = h(1);
  A((n-1)*n) = h(n-1);
  A(n*n) = 2*(h(n-1));
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
