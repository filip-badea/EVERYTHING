close all;
clear all;
fs = 8000;
f1 = 3000;
ts = 1/fs;
xi = 0:ts:100*ts;
x1 = sin(2*pi*f1*xi);
 
figure
stem(xi, x1);
 
N = 100;
k = fs/N;
X1 = fft(x1, N);
xf = 0:k:fs/2 - fs/N;
xf2 = 0:k:fs -fs /N;
xf3 = -fs/2 : k : fs/2 -fs/N;
figure
stem(xf2, abs(X1), 'b');

figure
X2 = fftshift(X1);
stem(xf3, abs(X2), 'g');