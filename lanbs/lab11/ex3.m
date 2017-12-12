[B,A] = butter(64,[0.2,0.4],'stop');
fvtool(B,A)
title('Filtru bandstop');

[Blow,Alow] = butter(64,0.2,'low');
fvtool(Blow,Alow)
title('Filtru low');

[Bhigh,Ahigh] = butter(64,0.6,'high');
fvtool(Bhigh,Ahigh)
title('Filtru high');

ns = 1:64;
sin1 = sin(2*pi*0.1*ns);
sin2 = sin(2*pi*0.25*ns);
sin3 = sin(2*pi*0.7*ns);

figure;
stem(sin1);
Y1 = filter(Blow,Alow,sin1);
hold on;
stem(Y1);
title('Filter low sinusoid 1');

figure;
stem(sin3);
Y1 = filter(Bhigh,Ahigh,sin1);
hold on;
stem(Y1);
title('Filter high sinusoid 3');
