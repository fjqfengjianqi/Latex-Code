function [Ii,ni] = IGua(fun,a,b)
%Guasian Quadrature on Arbitrary Intervals
%  setup the gauss data
iI = 1;
ni = zeros(3,1);
Ii = zeros(3,1);
for n = 2:4
    if n == 2
        s = [-1 1]/sqrt(3);
        A = [1 1];
    elseif n == 3
        s = [-sqrt(3/5) 0 sqrt(3/5)];
        A = [5 8 5]/9;
    elseif n == 4
        s = [   -sqrt((15+2*sqrt(30))/35),  -sqrt((15-2*sqrt(30))/35), ...
            sqrt((15-2*sqrt(30))/35),   sqrt((15+2*sqrt(30))/35)];
        A = [  (90-5*sqrt(30))/180,    (90+5*sqrt(30))/180,...
            (90+5*sqrt(30))/180,    (90-5*sqrt(30))/180];
    end
    ni(iI) = n;
    xx = ( a+b+(b-a)*s ) / 2;
    I_sum = 0;
    for i = 1 : n
        I_sum = I_sum + A(i).*fun(xx(i));
    end
    Ii(iI) = I_sum*(b-a)/2;
    iI = iI+1;
end
end

