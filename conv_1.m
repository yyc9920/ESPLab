clear;
clc;

st_1 = 0;
et_1 = 15;
n1 = st_1:1:et_1;
x1 = cos(2*pi*0.1*n1);

st_2 = -5;
et_2 = 5;
n2 = st_2:1:et_2;
x2 = cos(2*pi*0.05*n2);

figure(1)
subplot(311);
stem(n1, x1, 'filled');
xlabel('n1');
ylabel('x1');
subplot(312);
stem(n2, x2, 'filled');
xlabel('n2');
ylabel('x2');

[y1, n3] = convolution(x1, x2, st_1, et_1, st_2, et_2);

subplot(313);
stem(n3, y1, 'filled');
xlabel('n3');
ylabel('y');