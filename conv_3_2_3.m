clear;
clc;

st_1 = 0;
et_1 = 15;
n1 = st_1:1:et_1;
x1 = cos(2*pi*0.1*n1);

st_2 = 0;
et_2 = 5;
n2 = st_2:1:et_2;
x2 = (0.5).^n2;

figure(1)
subplot(311);
stem(n1, x1, 'filled');

subplot(312);
stem(n2, x2, 'filled');

[y1, n3] = convolution(x1, x2, st_1, et_1, st_2, et_2);
subplot(313);
stem(n3, y1, 'filled');

for i=1:1:5
	x1 = circshift(x1, -1);
	x1(length(x1)) = 0;
end

figure(2)
subplot(311);
stem(n1, x1, 'r-*');
subplot(312);
stem(n2, x2, 'filled');

[y1, n3] = convolution(x1, x2, st_1, et_1, st_2, et_2);
subplot(313);
stem(n3, y1, 'filled');