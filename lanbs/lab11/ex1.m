N=256;
sig = zeros(1,N);
fs = N;

for i=1:N/2+1
   if i/N*fs < fs/16
    sig(i) = 1;
   end
end
sig(N/2+1:N) = wrev(sig(1:N/2));

figure(1);
plot(linspace(0,1,256),sig)
title('Ideal filter');

hk = ifftshift(ifft(sig));

for i=1:N
    if hk(i) == max(hk);
        maxelem = i;
    end
end
esantioane = hk(97:161);

figure(2);
stem(abs(esantioane));
title('Secventa');

figure(3);
fftsecventa = fft(esantioane);
plot(linspace(0,1,65),abs(fftsecventa))
title('fft pe secventa')


figure(4);
hk = esantioane .* blackman(65)';
black = fft(hk);
plot(linspace(0,1,65),abs(black))
title('Atunci cand inmultim cu blackman');

N = 64;
f = 3000;
fs = 64000;
ns = 1:N;
sig = sin(2*pi*f*ns/fs);
figure(5);
stem(sig);
hold on;
stem(conv(sig,hk));
title('The filter effects')

hk1 = hk;
hk2 = hk;
seq = [1:65];
hk1 = hk1 .* cos(2*pi*1/4 * seq);  %%fb este 1/4
hk2 = hk2 .* cos(2*pi*1/2*seq);  %%fb este 1/2
figure(6);
plot(linspace(0,1,65),abs(fft(hk1)));
title('Filtru trece-banda');

figure(10);
plot(linspace(0,1,65),abs(fft(hk2)));
title('Filtru trece-sus');

sin1 = sin(2*pi*0.1*ns);
sin2 = sin(2*pi*0.25*ns);
sin3 = sin(2*pi*0.4*ns);

figure(7);
stem(sin1);
hold on;
stem(conv(sin1,hk2));
title('conv sinusoida 0.1');

figure(8);
stem(sin2);
hold on;
stem(conv(sin2,hk2));
title('conv sinusoida 0.25');

figure(9);
stem(sin3);
hold on;
stem(conv(sin3,hk2));
title('conv sinusoida 0.4');

