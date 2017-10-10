tm = 0.005;
t = 0 : tm / 1000 : tm;
f1 = 1600;
f2 = 1800;

sin1 = sin(2 * pi * f1 * t);
sin2 = sin(2 * pi * f2 * t);

plot(t, sin1);
hold on;

plot(t, sin2);
hold on;

%plot(t, sin1+sin2);
%hold on;
