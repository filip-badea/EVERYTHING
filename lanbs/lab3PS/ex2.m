T=100;
A=3;
x=1:T;
s=ones(1,T);
s=-A*s;
s(1:50)=A;
c=zeros(1,T);

h1=figure;
hold on
ylim([-1-A 1+A]);
plot(x,s,'r-')