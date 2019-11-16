clc;
clear;

z1 = -5
p1 = [sqrt(2)/4 + (sqrt(2)/4)*1i sqrt(2)/4 - (sqrt(2)/4)*1i];
[b1, a1] = zp2tf(z1, p1, 1);

z2 = -5
p2 = [sqrt(2)/2 + (sqrt(2)/2)*1i sqrt(2)/2 - (sqrt(2)/2)*1i];
[b2, a2] = zp2tf(z2, p2, 1);

z3 = -5
p3 = [sqrt(2)*1.5/2 + (sqrt(2)*1.5/2)*1i sqrt(2)*1.5/2 - (sqrt(2)*1.5/2)*1i];
[b3, a3] = zp2tf(z3, p3, 1);
% 그림의 각 시스템의 pole과 zero로부터 전달함수의 계수를 구함

figure(1)
plot(real(p1), imag(p1),'xr',real(z1),imag(z1),'ob','MarkerSize',20);
grid on;
hold on;
plot(real(p2), imag(p2),'xr',real(z2),imag(z2),'ok','MarkerSize',20);
plot(real(p3), imag(p3),'xr',real(z3),imag(z3),'og','MarkerSize',20);
xlabel('Real(z)');
ylabel('Imag(z)');
axis([-6 6 -5 5]);

[r1,p1,k1] = residue(b1,a1);

t = 0:1:20;
x1 = zeros(1, 21);
for i = 1:1:length(r1)
        for k=1:1:20
            x1(k+1) = x1(k+1) + r1(i)*p1(i)^t(k);
        end
end
n = 0:1:20;

figure(2)
subplot(311);
stem(n, x1);
grid on;

[r2,p2,k2] = residue(b2,a2);

t = 0:1:20;
x1 = zeros(1, 21);
for i = 1:1:length(r2)
        for k=1:1:20
            x1(k+1) = x1(k+1) + r2(i)*p2(i)^t(k);
        end
end
n = 0:1:20;

figure(2)
subplot(312);
stem(n, x1);
grid on;

[r3,p3,k3] = residue(b3,a3);

t = 0:1:20;
x1 = zeros(1, 21);
for i = 1:1:length(r1)
        for k=1:1:20
            x1(k+1) = x1(k+1) + r3(i)*p3(i)^t(k);
        end
end
n = 0:1:20;

figure(2)
subplot(313);
stem(n, x1);
grid on;