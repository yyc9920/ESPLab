clear;
clc;

[z p k] = buttap(7);
[b, a] = zp2tf(z,p,k);

[bt, at] = lp2lp(b, a, 300*2*pi);   % LPF

[numd, dend] = bilinear(bt, at, 3000);

n = 0:1:499;
x = cos(2*pi*(100/3000)*n) + cos(2*pi*(500/3000)*n);

y = filter(numd, dend, x);

n1 = 0:1:600;
Hd = freqz(numd, dend, n1/3000*2*pi);

t = 0:1/3000:500/3000;
[f0, X] = myfun_SA(t, x);
[f1, X1] = myfun_SA(t, y);

subplot(321);
plot(n/3000, x);
grid on;
axis([0 0.1 -2 2]);
ylabel('x(t)');
xlabel('t[sec]');

subplot(322);
plot(f0, abs(X), 'ko-');
grid on;
axis([0 600 0 0.08]);
ylabel('|X(f)|');
xlabel('Frequency f[Hz]');

subplot(324);
plot(n1, abs(Hd));
grid on;
axis([0 600 0 1]);
ylabel('Frequency Response,|Hd(f)|');
xlabel('Frequency f[Hz]');

subplot(325);
plot(n/3000, y);
grid on;
axis([0 0.1 -1.5 1.5]);
ylabel('y(t)');
xlabel('t[sec]');

subplot(326);
plot(f1, abs(X1), 'ko-');
grid on;
axis([0 600 0 0.08]);
ylabel('|Y(f)|');
xlabel('Frequency f[Hz]');
