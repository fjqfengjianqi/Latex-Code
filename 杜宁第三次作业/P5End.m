function df = P5End(fun,h,x0)
df = zeros( length(h) , 1 );
j = 1;
for i = h
    df(j) = ( -25*fun(x0) + 48*fun(x0+i) - 36*fun(x0+2*i) + 16*fun(x0+3*i) - 3*fun(x0+4*i) ) / (12*i) ; 
    j = j + 1;
end
end

