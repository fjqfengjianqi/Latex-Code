function df = P3Mid(fun,h,x0)
j = 1;
df = zeros( length(h) , 1 );
for i = h
    df(j) = ( fun(x0+i) - fun(x0-i) ) / (2*i) ; 
    j = j + 1;
end
end

