N=256;
sig = zeros(1,N);
fs = 4000;

for i=1:N
   if i/N*fs < fs/16
    sig(i) = 1;
   end
end
sig(N/2+1:N) = wrev(sig(1:N/2));

figure;
plot(linspace(0,1,256),sig)
title('Ideal filter');

hk = ifftshift(ifft(sig));

for i=1:N
    if hk(i) == max(hk);
        maxelem = i;
    end
end
maxelem;
129 - 32;
129 + 32;
esantioane = hk(97:161);

figure;
stem(abs(esantioane));
title('Secventa');

figure;
fftsecventa = fft(esantioane);
plot(linspace(0,1,65),abs(fftsecventa))
title('fft pe secventa')


figure;
hk = esantioane .* blackman(65)';
black = fft(hk);
plot(linspace(0,1,65),abs(black))
title('Secventa * blackman');

N = 64;
f = 3000;
fs = 64000;
ns = 1:N;
sig = sin(2*pi*f*ns/fs);
figure;
stem(sig);
hold on;
stem(conv(sig,hk));
title('The filter effects');