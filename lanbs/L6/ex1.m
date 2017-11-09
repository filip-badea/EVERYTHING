frecventa= [1, 2, 10, 20, 100];
pondere = [0.2, 0.2, 0.2, 0.2, 0.2];
medie = 0.2 * ones(128);
N = 128;
t = linspace(0, 1, N);


for i=1:length(frecventa)
    s=sin(2*pi*frecventa(i)*t);
    y = zeros(1,N);
    for j=5:(N-4)
        y(j) = pondere * s(j: j+4)';        
    end
    h = figure;
    plot(t, s, 'r');
    hold on;
    plot(t, y, 'b');
    ylim([-1.5, 1.5]);
end