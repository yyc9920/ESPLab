clear;
clc;

[z p k] = buttap(7);
[b, a] = zp2tf(z,p,k);

[bt, at] = lp2lp(b, a, 300);   % LPF

[numd, dend] = bilinear(bt, at, 500);

n = 0:1:499;
x = cos(2*pi*(100/3000)*n) + cos(2*pi*(500/3000)*n);

n1 = 0:1:3000;
y = filter(numd, dend, x);

n1 = 0:1:600;
Hd = freqz(numd, dend, n1/500);

t = 0:1/3000:500/3000;
[f0, X] = myfun_SA(t, x);
[f1, X1] = myfun_SA(t, y);

subplot(321);
plot(n/3000, x);
grid on;
axis([0 0.1 -2 2]);

subplot(322);
plot(f0, abs(X), 'ko-');
grid on;
axis([0 600 0 0.08]);

subplot(324);
plot(n1, abs(Hd));
grid on;
axis([0 600 0 1]);

subplot(325);
plot(n/3000, y);
grid on;
axis([0 0.1 -1.5 1.5]);

subplot(326);
plot(f1, abs(X1), 'ko-');
grid on;
axis([0 600 0 0.08]);