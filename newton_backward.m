% Newton’s backward difference interpolation %


function[u] = newton_backward(f,n,p)
    u = f(n+1);
    for i = 1:n,
        a=1;
        for j = 0:(i-1),
            a = (p+j)*a;
        end
        a = a/FACTORIAL(i);
        u = u + a*(delta_back(f,i,n+1));
    end
end
