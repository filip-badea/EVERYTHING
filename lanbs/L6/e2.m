f = 8000;
t = 1/f;
f1 = 3000;
ts = 1/fs;
xi = 0:ts:100*ts;
x = linspace(0, 1, f);
x1 = sin(2*pi*f1*xi);

figure;
stem(xi, x1);

N = 20;
%%k = f/N;
X = fft(x1, N);
%%xf = 0:k:f/2;
figure;
stem(abs(X));

x2 = fftshift(X);
figure;
stem(abs(x2));
%%stem(-3000:3000, abs(x2));