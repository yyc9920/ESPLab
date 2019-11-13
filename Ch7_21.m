clear;
clc;

%a
% sys = tf(3*[1 1], [1 -3 0]);
% nyquist(sys), grid
% xlim([-2 2]);
% ylim([-5 5]);

%b
sys = tf(3*[1 1], [1 -3 0]);
nyquist(sys), grid
xlim([-2 2]);
ylim([-5 5]);