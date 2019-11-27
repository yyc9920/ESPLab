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
st_3 = 0;
et_3 = 10;
n3 = st_3:1:et_3;
x3 = (-1).^n3;

figure(1)
subplot(411);
stem(n1, x1, 'filled');
subplot(412);
stem(n2, x2, 'filled');
subplot(413);
stem(n3, x3, 'filled');

st_4 = st_1 + st_2;
et_4 = et_1 + et_2;
st_5 = st_2 + st_3;
et_5 = et_2 + et_3;
y1 = convolution(x1, x2, st_1, et_1, st_2, et_2);
y2 = convolution(x2, x3, st_2, et_2, st_3, et_3);
[y3, n4] = convolution(y1, x3, st_4, et_4, st_3, et_3);
[y4, n5] = convolution(x1, y2, st_1, et_1, st_5, et_5);

subplot(414);
stem(n4, y3, 'b-*');
hold on;
stem(n5, y4, 'r--s');
legend('(x1*x2)*x3', 'x1*(x2*x3)');