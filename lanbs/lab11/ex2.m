Bl = fir1(64,0.2,'low');
Bb = fir1(64,[0.2,0.4],'band');
Bh = fir1(64,0.6,'high');
A = zeros(1,length(Bl));

ns = 1:64;
sin1 = sin(2*pi*0.1*ns);
sin2 = sin(2*pi*0.25*ns);
sin3 = sin(2*pi*0.7*ns);




fvtool(Bb, 1);
title('Filtru banda');

fvtool(Bl, 1);
title('Filtru trece-jos');

%%figure(3);
fvtool(Bh, 1);
title('Filtru trece-sus');


figure(3);
stem(sin3);
hold on;

Y1 = filter(Bh,1,sin1);
stem(Y1);
title('Filtru low 1');


