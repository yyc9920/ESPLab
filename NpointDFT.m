function [f_hat, Xk, N_mult] = NpointDFT(x)
N = length(x);
n = 0:1:N-1;
N_mult = N^2;
[f_hat, Xk] = myfun_SA(n, x);