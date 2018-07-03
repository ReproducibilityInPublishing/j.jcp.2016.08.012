%constant gradient of squared slowness
function y=ksq(x)
s0=2.0;
a=-0.4;
x0=[0,4];
e1=[1,0];

ksq = (s0^2) + dot((2*a*e1),(x-x0));