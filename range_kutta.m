function [u] = range_kutta(a,b,h,f,y0,c0)
n=1+((b-a)/h);
x1(1)=y0;
er(1)=0;
x=linspace(a,b,n);
u=ones(3,n);
z=ode45(f,x,y0);
w2=1/(2*c0);
w1=1-w2;
a21=c0;
for i=2:n
    k1(i)=f(x(i-1),x1(i-1));
    k2(i)=f(x(i-1)+(c0*h),x1(i-1)+a21*k(i));
    x1(i)=x1(i-1)+h*(w1.*k1(i) + w2.*k2(i));
    er(i)=abs(x1(i)-z(i));
end
u([1],:)=x1;
u([2],:)=er;
u([3],:)=x;



end
