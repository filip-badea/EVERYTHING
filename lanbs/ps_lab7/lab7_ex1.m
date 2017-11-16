N = 128;
A = 1;
fs = 128;
Ts = 1/fs;

figure;
t = linspace(0, 1, N);
load('noisy_signal.mat');
plot(t,noisy_signal);
title('noise signal');

ys = fft(noisy_signal);
figure;
stem(t,abs(ys), '-r');
title('FFT signal');

%figure;
xffs = linspace(0,(N/2)-1,N/2);
%stem(xffs,abs(ys(1:N/2)),'-g');

zs = fftshift(ys);
figure;
stem(t,abs(zs),'-g');
title('FFT Shift')

yy = ys;

for i = 1 : N
  if(i > 10 && i < 120 )
    yy(i) = 0;
  end
end
%%stem(t,abs(yy), '-b');

signal = 0;
for i = 1 : N
  signal = signal + (yy(i) * yy(i));
end
signal = signal / 19;

noise = 0;
for i = 1 : N
  noise = noise + (ys(i) * ys(i));
end
noise = noise / N;

snr = signal/noise;
real(snr)

figure;
plot(t,ifft(ys), '-g');

        
            