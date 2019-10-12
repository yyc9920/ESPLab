clear;
clc;

[t, p]=my_impulse_train_function(-5, 5, 0.05, 40960);
x=20*pi*sinc((20*pi*t)/(2*pi)); 

subplot(211);
plot(t, x);

[f0, X] = myfun_SA(t, x);

subplot(212);
plot(f0, abs(X));
xlim([-7 7]);