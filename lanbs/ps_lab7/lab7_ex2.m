clear all;
close all;

S = load('noisy_sound.mat');
s = S.noisy_sound;
fs = S.fs;
fi = 500;
N = length(s);

%sound(s);
figure;
plot(s);

k = fi * N/fs;
y = fft(s);
yy = y;

signal = 0;
for i = 1 : N
  if(i> 250 && i < N - 249)
    yy(i) = 0;
  end
end

for i = 1 : N
    signal = signal + (yy(i) * yy(i));
end
signal = signal / k;

noise = 0;
for i = 1 : N
    if(i > 1500 && i < 7500)
        noise = noise + (y(i) * y(i));
    end
end
noise = noise / N

snr = signal / noise


sgn = zeros(1,N);
sgn(1:1500) = y(1:1500);
sgn(end-1499 : end) = y(end-1499 : end);

plot(1:N, sgn);
sound(abs(ifft(sgn)));


