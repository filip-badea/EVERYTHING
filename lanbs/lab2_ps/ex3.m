 t = [0, pi/6, pi/4, pi/3, pi/2]; 
 plot(exp(1i*t), 'ro'); 
 hold on;
 
 plot(exp(-1i*t), 'bo'); 
 hold on;
 
 res = (exp(1i*t)+exp(-1i*t))/2;
 
 plot(real(res), imag(res), 'go'); 
 