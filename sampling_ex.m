clear;
clc;

[t, p]=my_impulse_train_function(-5, 5, 0.05, 9999999);

stem(t, p);

find(p)