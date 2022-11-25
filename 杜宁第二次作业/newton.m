function y0 = newton(xx,ff,p)
format long
% Part1 : Input the numbers and the values
x = xx; %numbers
f = ff; %values

%Part2 : Calculate the Divided differences
n = length(x);
A = [ x , f , zeros(n,n-1) ];
for j = 3 : (n+1)
    for i = 1 : n+2-j
        A(i,j) = ( A(i+1,j-1) - A(i,j-1) ) / (A(i+j-2,1)-A(i,1));
    end
end

%Part3 : Calculate the Polynomial
%Draw the function
t = linspace(x(1),x(n),p);
y0 = zeros( 1 , length(t) );
for m = 1 : length(t)
    p = f(1);
    g = 1;
    for k = 1 : n-1
    g = g * ( t(m) - x(k) );
    p = p + A(1,k+2) * g;
    end
    y0(m) = p ;
end
end

