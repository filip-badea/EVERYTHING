%input=[0:0.01:1];
%values1=sin(2*pi*1*input);
%values2=sin(2*pi*2*input);
%values3=values1+values2;
%figure
%plot(input,values1,'y');
%figure
%plot(input,values2,'r');
%figure
%plot(input,values3,'b');
matrix1=rand(5000);
matrix2=rand(5000);
matrix3=zeros(5000);

disp('inmultire j-i');
tic
for j=1:5000
    for i=1:5000
        matrix3=matrix2(i,j)*matrix1(i,j);
    end
end
toc

disp('inmultire i-j');

tic
for i=1:5000
    for j=1:5000
        matrix3=matrix2(i,j)*matrix1(i,j);
    end
end
toc

disp('inmultire .*');
tic
matrix3=matrix2.*matrix1;
toc

        

