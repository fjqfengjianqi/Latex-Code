function y0 = hermite(xx,ff,dff,p,s)
%Piecewise Hermite interpolatory polynomial
format long
%Part1 : Input the points
x = xx; %numbers
f = ff; %values
df = dff; %diff

%Part2 : Calculate the Matrix
n = length( x );
Q = zeros( 2*n , 2*n );
z = zeros( 1 , 2*n );
for i = 1 : n
    z( 2 * i - 1 ) = x( i );
    z( 2 * i ) = x( i );
    Q( 2 * i - 1 , 1 ) = f( i );
    Q( 2 * i , 1 ) = f( i );
    Q( 2 * i - 1, 2 ) = df( i );
    if i ~= 1
        Q( 2 * (i-1) , 2) = ( Q(2*i-1,1)-Q(2*(i-1),1) )/( x(i)-x(i-1) );
    end
end
for j = 3 : 2*n
    for i = 1 : 2*n+1-j
        Q(i,j)=( Q(i+1,j-1)-Q(i,j-1) )/( z(i+j-1)-z(i) );
    end
end

%Part3 : Draw the polynomial
t = linspace(x(1),x(n),p);
t = s ;
y0 = zeros( 1 , length(t) );
for m = 1 : length(t)
    p = f(1);
    g = 1;
    for k = 2 : 2*n
    g = g * ( t(m) - z(k-1) );
    p = p + Q(1,k) * g;
    end
    y0(m) = p ;
end
end

