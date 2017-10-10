N = 200;
T = 100;
x = 1:N;

r = ramp(N);

u = ones(1, N);

rd =  [zeros(1,T), r(1:N-T)];
ud =  T * [zeros(1,T), u(1:N-T)];

s = r - rd - ud;



plot(x, r, 'b-');
hold on;

plot(x, -rd, 'r-');
hold on;

plot(x, -ud, 'g-');
hold on;
%figure
plot(x, s, 'k-', 'LineWidth', 2);
hold on;