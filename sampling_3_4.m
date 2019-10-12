clear;
clc;

[t, p]=my_impulse_train_function(-5, 5, 1/20, 4096);
x=20*pi*sinc(10*t); 
y=x.*p;

[f0, X1] = myfun_SA(t, p);
[f1, X2] = myfun_SA(t, x);
[f2, X3] = myfun_SA(t, y);

subplot(321);
plot(t, p);
xlim([-1 1]);
ylim([0 1.2]);
xlabel('t[sec]');
ylabel('p(t)');
grid on;

subplot(322);
plot(f0, abs(X1));
xlim([-30 30]);
ylim([0 0.28]);
xlabel('f[Hz]');
ylabel('|P(f)|');
grid on;

subplot(323);
plot(t, x);
xlim([-1 1]);
ylim([-20 80]);
xlabel('t[sec]');
ylabel('x(t)');
grid on;

subplot(324);
plot(f1, abs(X2));
xlim([-30 30]);
ylim([0 8]);
xlabel('f[Hz]');
ylabel('|X(f)|');
grid on;

subplot(325);
plot(t, y);
xlim([-1 1]);
ylim([-20 80]);
xlabel('t[sec]');
ylabel('y(t)');
grid on;

subplot(326);
plot(f2, abs(X3));
xlim([-30 30]);
xlabel('f[Hz]');
ylabel('|Y(f)|');
grid on;