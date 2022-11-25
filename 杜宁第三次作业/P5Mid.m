function df = P5Mid(fun,h,x0)
df = zeros( length(h) , 1 );
j = 1;
for i = h
    df(j) = ( fun(x0-2*i) - 8*fun(x0-i) + 8*fun(x0+i) - fun(x0+2*i) ) / (12*i) ; 
    j = j + 1;
end
end

