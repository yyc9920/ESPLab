n = 1:1:64;
x = cos(2*pi*0.1*(n-1));

[f_hat, Xk, N_mult] = NpointDFT(x);

subplot(221);
stem(n, x, 'filled');
xlim([1 64]);
subplot(222);
stem(f_hat, abs(Xk), 'filled');

[f_hat, Xkf, N_mult] = NpointFFT(x);

subplot(223);
stem(n, x, 'filled');
xlim([1 64]);
subplot(224);
stem(f_hat, abs(Xkf), 'filled');