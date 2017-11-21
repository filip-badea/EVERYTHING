clear;
close all;

s = load('notes_signal_long.mat');
fs = s.fs;
signal = s.notes_signal;

y = linspace(0, 500, length(signal));

figure;
plot(signal);
title('Original signal');

figure;
stem(y, abs(fftshift(fft(signal))));
title('Dft');

figure;
signal_ham = signal .* hamming(length(signal))';
plot(signal_ham);
title('Windowed signal');


y2 = linspace(0, 500, length(signal)/2);
figure;
semnal = (fft(signal_ham));
semnal2 = semnal(1:length(semnal)/2);
stem(y2, abs(semnal2));
title('FFt of hanning signal');


sound(abs(signal));

