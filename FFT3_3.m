%N=16일 때
n = 1:1:16;
x = 0.3*cos(2*pi*0.1*(n-1))+0.8*sin(2*pi*0.3*(n-1));

[f_hat, Xk, N_mult_d] = NpointDFT(x);
[f_hat, Xkf, N_mult_f] = NpointFFT(x);

Nmultd(1) = N_mult_d;   %DFT의 곱셈 연산량을 저장합니다.
Nmultf(1) = N_mult_f;   %FFT의 곱셈 연산량을 저장합니다.
%N=32일 때
n = 1:1:32;
x = 0.3*cos(2*pi*0.1*(n-1))+0.8*sin(2*pi*0.3*(n-1));

[f_hat, Xk, N_mult_d] = NpointDFT(x);
[f_hat, Xkf, N_mult_f] = NpointFFT(x);

Nmultd(2) = N_mult_d;
Nmultf(2) = N_mult_f;
%N=64일 때
n = 1:1:64;
x = 0.3*cos(2*pi*0.1*(n-1))+0.8*sin(2*pi*0.3*(n-1));

[f_hat, Xk, N_mult_d] = NpointDFT(x);
[f_hat, Xkf, N_mult_f] = NpointFFT(x);

Nmultd(3) = N_mult_d;
Nmultf(3) = N_mult_f;
%N=128일 때
n = 1:1:128;
x = 0.3*cos(2*pi*0.1*(n-1))+0.8*sin(2*pi*0.3*(n-1));

[f_hat, Xk, N_mult_d] = NpointDFT(x);
[f_hat, Xkf, N_mult_f] = NpointFFT(x);

Nmultd(4) = N_mult_d;
Nmultf(4) = N_mult_f;

subplot(211);
semilogy(16, Nmultd(1), 'bo-', 32, Nmultd(2), 'bo-', 64, Nmultd(3), 'bo-', 128, Nmultd(4), 'bo-');
hold on;
semilogy(16, Nmultf(1), 'g^-', 32, Nmultf(2), 'g^-', 64, Nmultf(3), 'g^-', 128, Nmultf(4), 'g^-');
ylim([10 10^5]);
grid on;
subplot(212);
plot(16, Nmultf(1)/Nmultd(1), 'ko-', 32, Nmultf(2)/Nmultd(2), 'ko-', 64, Nmultf(3)/Nmultd(3), 'ko-', 128, Nmultf(4)/Nmultd(4), 'ko-');
ylim([0.02 0.14]);
grid on;