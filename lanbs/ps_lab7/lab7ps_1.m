N = 128;
A = 1;
fs = 128;
Ts = 1/fs;
K = N;
figure;
t = linspace(0, 1, N);
load('noisy_signal.mat');
plot(t,noisy_signal);
title('noise signal');

ys = fft(noisy_signal);
%figure;
%stem(t,abs(ys), '-r');
%title('FFT signal');

%figure;
%xffs = linspace(0,(N/2)-1,N/2);
%stem(xffs,abs(ys(1:N/2)),'-g');

s = noisy_signal;

DFT = zeros(128);

for i = 1:N
   for k = 1:K
        DFT(i) = DFT(i) + s(k) * exp((-1i * 2 * pi * (i-1) * (k-1)) / K);
   end
end

figure;
plot(t, DFT);
title('DFT signal');


IDFT = zeros(128);

for i = 1:N
   for k = 1:K
        IDFT(i) = IDFT(i) + DFT(k) * exp((1i * 2 * pi * (i-1) * (k-1)) / K);
   end
   IDFT(i) = IDFT(i) / K;
end




figure;
plot(t, IDFT);
title('IDFT signal');



S = fft(s);
figure;
plot(t, S);
title('DFT function');


Si = ifft(fft(s));

figure;
plot(t, Si);
title('IDFT function')



sgn_pw = compute_power([DFT(1:10), zeros(1, length(DFT)-19), DFT(end-8:end)], length(DFT));
noise_pw = compute_power([zeros(1, 10), DFT(11:end-9), zeros(1, 9)], length(DFT));

snr = sgn_pw/noise_pw

figure;
sgn  = zeros(1,N);
sgn(1:10) = DFT(1:10);
sgn(end-8:end)=DFT(end-8:end);
plot(t, ifft(sgn));

