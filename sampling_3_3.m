clear;
clc;

[t, p]=my_impulse_train_function(-5, 5, 0.05, 4096);
x=20*pi*sinc((10*t));
y=x.*p;

subplot(211);
plot(t, y);

[f0, X] = myfun_SA(t, y);

subplot(212);
plot(f0, abs(X));