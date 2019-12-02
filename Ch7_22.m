clear;
clc;

sys = tf(2280, [1 55 250 0]);
bode(sys), grid;
% 만들고자 하는 뒤짐 보상기의 위상 여유->10^해당 크기[dB]/원하는 정상상태 속도 오차(%)
alpha = 10^(-8.29/11);
% 만들고자 하는 뒤짐 보상기의 위상 여유->10/해당 주파수 값(rad/s)
T = 10/69.2;

lag = tf([T 1], [alpha*T 1]);

sys2 = series(lag, sys);
hold on;
bode(sys2);
