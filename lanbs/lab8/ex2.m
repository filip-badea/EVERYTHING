
s = load('notes_signal.mat');
fs = s.fs;
signal = s.notes_signal;

figure;
plot(signal);
title('Original signal');

figure;
fftsignal = fft(signal);
y = linspace(0,length(signal), length(signal));
frequency = fftsignal(1:length(signal)/2);
stem(abs(frequency));
title('Frequency spectrum of notes signal');


figure;
signal_ham = signal .* hamming(length(signal))';
plot(signal_ham);
title('Windowed signal');
 
figure;
plot(y, abs(fft(signal_ham)));
title('Hanning signal');