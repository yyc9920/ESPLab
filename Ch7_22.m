clear;
clc;

sys = tf(2280, [1 55 250 0]);
bode(sys), grid;
alpha = 10^(2.5/11);
T = 10/4.85;
lag = tf([T 1], [alpha*T 1]);

sys2 = series(lag, sys);
hold on;
bode(sys2);
