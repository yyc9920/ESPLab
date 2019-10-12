clear;
clc;

f0_hat = 0.1;

n = 0:1:49;
x = cos(2*pi*f0_hat*n);

[f_hat, Xk, N_mult] = NpointDFT(x);

subplot(211);
stem(n, x);

subplot(212);
stem(f_hat, abs(Xk));