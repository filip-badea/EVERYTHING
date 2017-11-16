S = load('noisy_sound');
s = S.noisy_sound;
fs = S.fs;
fi = 500;
N = length(s);

%sound(s);

figure;
plot(s);

y = fft(s);
yy = y;

figure;

stem(abs(y));

sgn = zeros(1, N);

sgn(1:500) = yy(1:500);
sgn(end-499:end) = yy(end-499:end);

figure;
plot(real(ifft(fftshift(sgn))));
sound(real(ifft(sgn)));