clear;
clc;

A = [1 0 ; 1 1];
B0 = [1 ; 1];
B1 = [0 ; 1];
h = 1;
Q = [1 0; 1 1];
R = 1;
N = [0; 0];
B = B0+expm(-A)*B1;
[K, S, e] = lqr(A,B,Q,R,N);

t = 0:0.01:10;
C= [1 1];

for i=1:1:1000
    x(i) = C*expm((A-B*K)*t(i))*[1;0];
end
plot(x);
