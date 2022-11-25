function y1 = phermite(xx,ff,dff,p)
%Piecewise Hermite interpolatory polynomial
format long
%Part1 : Input the points
x = xx; %numbers
f = ff; %values
df = dff; %diff
n = length(x);

%Part2 : Piecewise Hermite
t = linspace(x(1),x(n),p);
y = [f(1)];
for i = 1:n-1
    s = t(t<=x(i+1) & t>x(i));
    y0 = hermite( [x(i),x(i+1)] , [f(i),f(i+1)] , [df(i),df(i+1)] , 0 , s );
    y = [y,y0];
end
y1 = y ;
end

