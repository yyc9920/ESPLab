clear;
clc;

sys = tf(300, [1 15 50 0]);
bode(sys), grid
wc = 7.07;
th = 60*pi/180;
beta = (1+sin(th))/(1-sin(th));
T1 = sqrt(beta)/wc;
lead1 = tf([T1 1], [T1/beta 1]);
sys3 = series(lead1, sys);
bode(sys3), grid
alpha = 10^(3.52/20);
T2 = 10*T1;
lag1 = tf([T2 1], [alpha*T2 1]);
sys4 = series(lag1, sys3);
bode(sys4), grid
figure(2)
f0 = feedback(sys, 1);
f3 = feedback(sys3, 1);
f4 = feedback(sys4, 1);
step(f0), grid;
hold on;
step(f3);
step(f4);