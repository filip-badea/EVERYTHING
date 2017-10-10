m = load('voice.mat');
mat = m.y';
N = length(mat);
Delay = 500;
mat_d = [double(zeros(1, Delay)), mat(1:N - Delay)];

sound(mat+mat_d);
%sound(mat);
%sound(mat_d);