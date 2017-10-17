cmax = 1024;
T=100;
A=3;
kvect = -cmax:cmax;
N = length(kvect);
ck = zeros(N,1);

h2=figure;

for j=1:N
    k = kvect(j);
    if mod(k,2) == 1
        ck(j) = (2*A) / (1i*pi*k);
    end
end

x=1:100;
s=zeros(1,100);
for t=1:T
    for j=1:N
        s(t) = s(t) + ck(j)*exp((1i*2*pi*kvect(j)*t)/T);
    end
end
plot(x,s,'g-')
ylim([-1-A 1+A]);
