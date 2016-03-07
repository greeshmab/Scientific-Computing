function [u] = fivePtCentral_deriv(ind,x,f)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
h = x(ind + 1) - x(ind);
u = f(ind -2 ) -8*f(ind - 1) + 8*f(ind + 1) - f(ind +2);
u = u/h;
u = u/12;
end
