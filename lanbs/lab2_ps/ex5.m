N = 20;
y = zeros(1,N);
x = 60 * ones(1,N);
e = zeros(1,N);
f = zeros(1,N);
y(1) = 7;
for i=1:N-1
    e(i) = x(i) - y(i)
  if (e(i) > 10) y(i+1) = y(i) + 10;
  elseif(e(i) > 0) y(i+1) = y(i) + 1;
  elseif(e(i) == 0) y(i+1) = y(i);
  end
end
plot(y,'b-');
hold on;
plot(e,'r-');

