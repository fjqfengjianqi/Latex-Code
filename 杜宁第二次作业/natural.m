function y = natural(xx,ff,p)
%Natural Cubic Spline interpolatory polynomial
%Part1 : Input the numbers and the values
x = xx; %points
f = ff; %values
n = length(x);

%Part2 : Calculate the a,b,c,d
for i = 1 : n-1
    h(i) = x(i+1) - x(i);
end
for i = 2 : n-1
    a(i) = 3*( f(i+1) - f(i) )/h(i) - 3*( f(i) - f(i-1) )/h(i-1);
end
l = ones(1,n);
u = zeros(1,n);
z = zeros(1,n);
for i = 2 : n-1
    l(i) = 2*( x(i+1)-x(i-1) ) - h(i-1) * u(i-1);
    u(i) = h(i)/l(i);
    z(i) = (a(i)-h(i-1)*z(i-1))/l(i);
end
c = zeros(1,n);
b = zeros(1,n);
d = zeros(1,n);
for j = n-1:-1:1
    c(j) = z(j) - u(j)*c(j+1);
    b(j) = ( f(j+1)-f(j) )/h(j) - h(j)*( c(j+1)+2*c(j) )/3;
    d(j) = ( c(j+1)-c(j) )/(3*h(j));
end

%Part3 : Output the polynomial
t = linspace(x(1),x(n),p);
y = [f(1)];
for i = 1:n-1
    s = t(t<=x(i+1) & t>x(i));
    y0 = f(i) + b(i)*( s-x(i) ) + c(i)*( s-x(i) ).^2 + d(i)*( s-x(i) ).^3;
    y = [y,y0];
end
end

