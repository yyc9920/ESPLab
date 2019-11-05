n = 1:1:128;
x = 0.3*cos(2*pi*0.1*(n-1))+0.8*sin(2*pi*0.3*(n-1));

[f_hat, Xk, N_mult] = NpointDFT(x);

subplot(211);
stem(n, x, 'filled');
xlim([1 length(n)]);
subplot(212);
plot(f_hat, abs(Xk), 'ko ');
hold on;

[f_hat, Xkf, N_mult] = NpointFFT(x);
plot(f_hat, abs(Xkf), 'rx--');
legend('DFT', 'FFT');