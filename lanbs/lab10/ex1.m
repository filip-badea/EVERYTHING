x = [1,3,5,7,5,4,2];
h = [0.1,0.3,0.1];

N=length(x);
M=length(h);

seq = zeros(1,N-M+1);

for i=1:N-M+1
    seq(i) = x(i:i+M-1) * wrev(h)';
end
seq

N = 64;
f = 3000;
fs = 64000;
ns = 1:N;
sig = sin(2*pi*f*ns/fs);
figure;
plot(ns,sig);
title('Input');
h = [0.1,0.2,0.2,0.2,0.1];
M = 5;
conv_sig = zeros(1,N-M+1);
for i=1:N-M+1
   conv_sig(i) = sig(i:i+M-1) * wrev(h)';
end
figure;
stem(1:60,conv_sig);
title('Convolutia');

figure;
stem(conv(sig, h));
title('Conv funcction1');

x = [0,0,0,0,1,0,0,0,0];
N=9;
res3 = zeros(1,N-M+1);
for i=1:N-M+1
   res3(i) = x(i:i+M-1) * wrev(h)';
end
figure;
stem(1:N-M+1,res3);
title('Convolutie2');

res3
h

figure;
stem(conv(x, h));
title('Conv funcction2');

