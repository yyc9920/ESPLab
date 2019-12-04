clear;
clc;
G = tf(12, [2 1 0]);
bode(G);
hold on

th = 50*pi/180;
a = (1-sin(th))/(1+sin(th));
10*log10(a);
T = 1/4.03/sqrt(a);
lead = tf([T 1],[T*a 1]);
G1 = series(lead, G);

bode(G1), grid;
