clear;
clc;

n = 0:1:49;

x = zeros(1, 50);

x(1) = 1;

[f_hat, Xk, N_mult] = NpointDFT(x);

n1 = 0:1:1023;

x1 = zeros(1, length(n1));

for i=1:1:max(find(n1<1))
    x1(i) = 1;
end

[f0, X] = myfun_SA(n1, x1);

subplot(421);
stem(n, x);

subplot(422);
plot(f0, abs(X));
xlim([-0.5 0.5]);
hold on;

plot(f_hat, abs(Xk), 'ro ');

n = 0:1:49;

x = zeros(1, 50);

for i=1:1:10
    x(i) = 1;
end

[f_hat, Xk, N_mult] = NpointDFT(x);

n1 = 0:1:1023;

x1 = zeros(1, length(n1));

for i=1:1:max(find(n1<10))
    x1(i) = 1;
end

[f0, X] = myfun_SA(n1, x1);

subplot(423);
stem(n, x);

subplot(424);
plot(f0, abs(X));
xlim([-0.5 0.5]);
hold on;

plot(f_hat, abs(Xk), 'ro ');

n = 0:1:49;

x = zeros(1, 50);

for i=1:1:30
    x(i) = 1;
end

[f_hat, Xk, N_mult] = NpointDFT(x);

n1 = 0:1:1023;

x1 = zeros(1, length(n1));

for i=1:1:max(find(n1<30))
    x1(i) = 1;
end

[f0, X] = myfun_SA(n1, x1);

subplot(425);
stem(n, x);

subplot(426);
plot(f0, abs(X));
hold on;

plot(f_hat, abs(Xk), 'ro ');

n = 0:1:49;

x = zeros(1, 50);

for i=1:1:50
    x(i) = 1;
end

[f_hat, Xk, N_mult] = NpointDFT(x);

n1 = 0:1:1023;

x1 = zeros(1, length(n1));

for i=1:1:max(find(n1<50))
    x1(i) = 1;
end

[f0, X] = myfun_SA(n1, x1);

subplot(427);
stem(n, x);

subplot(428);
plot(f0, abs(X));
xlim([-0.5 0.5]);
hold on;

plot(f_hat, abs(Xk), 'ro ');