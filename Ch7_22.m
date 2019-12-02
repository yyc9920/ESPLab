clear;
clc;

sys = tf(610, [1 55 250 0]);
bode(sys), grid;
alpha = 10^(-5.4/11);
T = 10/3.66;
lag = tf([T 1], [alpha*T 1]);

sys2 = series(lag, sys);
hold on;
bode(sys2);