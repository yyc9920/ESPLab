clear;
clc;

[t, p]=my_impulse_train_function(-5, 5, 1/10, 4096);
x=20*pi*sinc(10*t); 
y=x.*p;

[f0, X1] = myfun_SA(t, p);
[f1, X2] = myfun_SA(t, x);
[f2, X3] = myfun_SA(t, y);

fc = 8;
[z, p, k] = buttap(5);
[num, den] = zp2tf(z, p, k);
[num, den] = lp2lp(num, den, 2*pi*fc);
[num_d, den_d] = bilinear(num, den, 1/abs(t(2)-t(1)));

y_1 = filter(num_d, den_d, y);

figure(2);
plot(t, y_1);

[f2, X3_1] = myfun_SA(t, y_1);

figure(1);
subplot(221);
plot(t, y);
ylim([-20 80]);
xlim([-1 1]);
xlabel('t[sec]');
ylabel('Before reconstruction y(t)');
grid on;

subplot(222);
plot(t, y_1);
xlim([-1 1]);
xlabel('t[sec]');
ylabel('After reconstruction y(t)');
grid on;

subplot(223);
plot(f2, abs(X3));
xlim([-30 30]);
xlabel('f[Hz]');
ylabel('Before reconstruction |Y(f)|');
grid on;

subplot(224);
plot(f2, abs(X3_1));
xlim([-30 30]);
xlabel('f[Hz]');
ylabel('After reconstruction |Y(f)|');
grid on;