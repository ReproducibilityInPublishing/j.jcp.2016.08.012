format longg
X=[3.71e-03,
   1.85e-03,
   9.22e-04,
   4.60e-04,
   2.30e-04,
   1.15e-04];

Y=[9.42e-04, 
   4.69e-04, 
   2.34e-04, 
   1.17e-04, 
   5.83e-05, 
   2.92e-05];

M=[3.71e-03, 1.85e-03, 9.22e-04, 4.60e-04, 2.30e-04, 1.15e-04;
   9.42e-04, 4.69e-04, 2.34e-04, 1.17e-04, 5.83e-05, 2.92e-05];

s0=2.0;
a=-0.4;
x0=[0,4];
e1=[1,0];

ksq = @(x) sqrt((s0^2) + dot((2*a*e1),(x-x0)));
k= @(x) ((1/s0)+dot((a*e1),(x-x0)))^(-1)

res=[];
%Arr=arrayfun(@ksq,X)
for elem=1:length(X)
	temp=ksq(X(elem));
	res(end+1)=temp;
end

X=[1:4]
Y=[1:8]
[x,y]=meshgrid(X,Y)
res
%surf(x,y,res)

%random online example
x=1:0.1:4
y=1:0.1:4
[X,Y]=meshgrid(x,y)
Z=sin(X).^2+cos(Y).^2
surf(X,Y,Z)
view(2)
