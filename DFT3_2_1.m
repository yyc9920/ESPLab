clear;
clc;

n = 0:1:49;
x = cos(2*pi*0.1*n) + 0.5*cos(2*pi*0.2*n) + 0.1*cos(2*pi*0.3*n);

[f_hat, Xk, N_mult] = NpointDFT(x);

subplot(211);
stem(n, x);

subplot(212);
stem(f_hat, abs(Xk));