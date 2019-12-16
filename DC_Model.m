clear;
clc;
R = 2;
L = 0.008;
J = 31*10^(-6);
B= 62*10^(-6);
Kt = 0.54;
Ke = 0.54;
A = [0 1 0; 0 -(B/J) Kt/J; 0 -(Ke/L) -(R/L)];
B1 = [0; 0; 1/L];
C = [1 0 0];
Q = eye(3, 3);
N = [0; 0; 0];
Ki = R*1571;
Kp = L*1571;
Ka = 1/(3*Kp);
Kps = J*157/Kt;
Kis = J*157^2/(5*Kt);
Kas = 1/Kps;
a = 1;
Kps_1 = (1-a)*Kps;

posKp = 30;
posKd = 1;
posKi = 0;
posKa = 0;
posMaxVel = 100;

[K, S, e] = lqr(A, B1, Q, 1);

A_Feedback = A-(B*K);