%clear();

A1 = 1;
A2 = 0.5;
fs = 8000;
f1 = 1000;
f2 = 2000;
N = 8;
ts = 1/fs;
s = zeros(N);
s1 = zeros(N);
s2 = zeros(N);
t = linspace(0, 1, N);
t_dft = linspace(0, 1000, fs);

% 1
for n = 1:N
    s1(n) = A1 * sin(2 * pi * f1 * (n - 1) * ts);
    s2(n) = A2 * sin(2 * pi * f2 * (n - 1) * ts);
    s(n) = s1(n) + s2(n);
end

figure;
plot(t, s1, 'blue');
hold on;
plot(t, s2, 'black');
hold on;
plot(t, s, 'red');
hold off;


% 2
figure;
s_fft = fft(s);
dft_y = linspace(0, 8000,length(s_fft));
stem(dft_y, abs(s_fft));
title('Spectru frecventa ex 2');

% 3
figure;
s2_fft = fft(s2);
stem(dft_y, abs(s2_fft))
title('Spectru frecventa eliminand prima sinusoida');

% 4
f4 = 2500;
s4 = zeros(N);
for n = 1:N
    s4(n) = A2 * sin(2 * pi * f4 * (n - 1) * ts);
end

figure;
s4_fft = fft(s4);
stem(dft_y, abs(s4_fft))
title('Spectru pentru frecventa 2500');

% 5
s5 = zeros(64);
t5 = linspace(0, 1, 64);
for n = 1:N
    s5(n) = A2 * sin(2 * pi * f4 * (n - 1) * ts);
end

figure;
s5_fft = fft(s5);
dft_y5 = linspace(0, 7000, length(s5_fft));
stem(dft_y5, abs(s5_fft))
title('Spectru pt K=64 si f=2500');

% 6
s6 = zeros(64);
t6 = linspace(0, 1, 64);

for n = 1:N
    s6(n) = A2 * sin(2 * pi * f2 * (n - 1) * ts);
end

figure;
s6_fft = fft(s6);
stem(dft_y5, abs(s6_fft))
title('Spectru pentru K=64 si f=2000');