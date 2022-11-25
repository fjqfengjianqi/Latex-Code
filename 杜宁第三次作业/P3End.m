function df = P3End(fun,h,x0)
j = 1;
df = zeros( length(h) , 1 );
for i = h
    df(j) = ( -3*fun(x0) + 4*fun(x0+i) - fun(x0+2*i) ) / (2*i) ; 
    j = j + 1;
end
end

