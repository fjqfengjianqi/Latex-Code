function xi = ISim(fun,a,b,n)
%Composite Simpson's Rule
h = (b-a) / n;
x0 = fun(a) + fun(b);
x1 = 0;
x2 = 0;
xi = zeros(1,n-1);
for i = 1 : n-1
    x = a + i*h;
    if mod(i,2) == 0
        x2 = x2 + fun(x);
    else
        x1 = x1 + fun(x);
    end
    xi(i) = h*( x0 + 2*x2 + 4*x1 ) / 3 ;
end
end

