clc;
clear;

t = linspace(0, 2*pi, 1000);
x = cos(t);
y = sin(t);
% 원을 그리는 함수

z1 = roots([1 -0.3]);
p1 = roots([1 0.3 0.36 0.108]);

figure(1)
plot(real(p1), imag(p1),'x',real(z1),imag(z1),'o', x,y,'-b','MarkerSize',20);
grid on;
xlabel('Real(z)');
ylabel('Imag(z)');
axis([-1 1 -1 1]);

[r1,p1,k1] = residue([1 -0.3],[1 0.3 0.36 0.108 0]);
% Z역변환을 하기 위해 분모항에 차수를 하나 더함

t = 0:1:20;
x1 = zeros(1, 21);  % 0~20까지의 수를 표현하기 위해 21개의 항이 있는 제로 열벡터 선언
for i = 1:1:length(r1)
        for k=1:1:20
            x1(k) = x1(k) + r1(i)*p1(i)^t(k);
        end
end
n = 0:1:20;

figure(2)
stem(n, x1);
grid on;

syms omega;
H_omega_b = 1;
for i = 1 : 1 : length(z1)
    H_omega_b = H_omega_b.*(exp(j*omega) - z1(i));
end
H_omega_a = 1;
for i = 1 : 1 : length(p1)
    H_omega_a = H_omega_a.*(exp(j*omega) - p1(i));
end

H_omega = H_omega_b./H_omega_a;

figure(3)
ezplot(abs(H_omega),[-3.1, 3.1]);
grid on;
ylabel('|H(w)|');
xlabel('Frequency w[rad/sec]');