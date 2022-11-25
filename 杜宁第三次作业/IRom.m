function RR = IRom(fun,a,b,n)
R = zeros(2,n);
h = b-a;
R(1,1) = h*( fun(a) + fun(b) ) / 2;
RR = zeros(n,n);
RR(1) = R(1,1);
for i = 2 : n
    sum = 0;
    for k = 1 : 2^(i-2)
        sum = sum + fun(a+(k-0.5)*h);
    end
    R(2,1) = ( R(1,1) + h*sum ) / 2;
    for j = 2 : i
        R(2,j) = R(2,j-1) + ( R(2,j-1)-R(1,j-1) ) / ( 4^(j-1) - 1 );
    end
    h = h / 2;
    R(1,1:i) = R(2,1:i);
    RR(i,1:i) = R(2,1:i);
end
end

