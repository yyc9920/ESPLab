clear;
clc;

[z p k] = buttap(7);
[b, a] = zp2tf(z,p,k);

t = linspace(0, 2*pi, 1000);
x = cos(t);
y = sin(t);
% 원을 그리는 함수

figure(1)
plot(real(p), imag(p),'x',real(z),imag(z),'o', x,y,':b','MarkerSize',20);
grid on;
xlabel('Real(z)');
ylabel('Imag(z)');
axis([-1 1 -1 1]);

w = linspace(0,2,1000);
[b, a] = zp2tf(z,p,k);
h = freqs(b,a,w);

figure(2)
plot(w, 10*log10(abs(h).^2));
grid on;
ylabel('10log10|H(w)|^2');
xlabel('Frequency w[rad/sec]');
axis([0 2 -40 5]);

w = linspace(0, 5000, 5001);
[bt, at] = lp2lp(b, a, 300);
H = freqs(bt, at, w);

figure(3)
plot(10*log10(abs(H).^2));
grid on;
hold on;

w = linspace(0, 5000, 5001);
[bt, at] = lp2bp(b, a, 1300/2, 700);
H = freqs(bt, at, w);

plot(10*log10(abs(H).^2));

w = linspace(0, 5000, 5001);
[bt, at] = lp2bp(b, a, 3000/2, 1000);
H = freqs(bt, at, w);

plot(10*log10(abs(H).^2));

w = linspace(0, 5000, 5001);
[bt, at] = lp2bp(b, a, 6000/2, 2000);
H = freqs(bt, at, w);

plot(10*log10(abs(H).^2));

w = linspace(0, 5000, 5001);
[bt, at] = lp2hp(b, a, 4000);
H = freqs(bt, at, w);

plot(10*log10(abs(H).^2));
axis([0 5000 -30 10]);
legend('Filter1, LPF', 'Filter2, BPF', 'Filter3, BPF', 'Filter4, BPF', 'Filter5, HPF');