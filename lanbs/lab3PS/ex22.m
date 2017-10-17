cmax = 50;
kvect = -cmax:cmax;
N = length(kvect);
coef = zeros(N,1);

h2=figure;

for j=1:N
    k = kvect(j);
    if mod(k,2) == 1
        coef(j) = (2*A) / (1i*pi*k);
    end
end

stem(kvect, abs(coef));