function [u] = explEuler(a,b,h,k,y0)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
N = 1+ ((b-a)/h);
x = linspace(a,b,N);
u = ones(3,N);
x1(1) = y0;
err(1) = 0;
z = ode45(k,x,y0);
for i = 2:N
    x1(i) = x1(i-1) + h*k(x(i-1),x1(i-1));
    err(i) = abs(x1(i) - z(i));
end
u([1],:) = x1;
u([2],:) = err;
u([3],:) = x;

subplot(1,2,1)
hold on
grid on

plot(u([3],:),u([1],:),'--rs','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',10)
% ylim([0,3])
xlim([a,b])
xlabel('t')
title('soln graph')


subplot(1,2,2)
hold on
grid on

plot(u([3],:),u([2],:),'--rs','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','b',...
                'MarkerSize',10)  
% ylim([0,3])
xlim([a,b])
xlabel('t')
title('error')
soln = u([1],:)
error = u([2],:)
N = (b-a)/h;


end
