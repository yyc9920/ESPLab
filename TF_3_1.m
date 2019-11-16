clc;
clear;

z = roots([1 5]);
p = roots([1 2 5]);

figure(1)
plot(real(p), imag(p),'x',real(z),imag(z),'o','MarkerSize',20);
% 복소평면상에 영점(o)과 극점(x) 값을 표시
grid on;
axis([-6 0 -2.5 2.5]);
xlabel('Real(s)');
ylabel('Imag(s)');

syms t;
[r,p,k] = residue([1 5],[1 2 5]);
% 전달함수의 부분분수의 계수들을 구한다.
h = 0;
for i = 1: 1: length(r)
    h = h + r(i).*exp(p(i)*t);
end
 
figure(2)
ezplot(h,[0, 10]);
% ezplot(fun,[xmin,xmax]) -> xmin < x < xmax에 fun(x) 표현식을 플로팅합니다.
grid on;
ylim([-0.4 1.6]);

syms omega;
H_omega_b = 1;
for i = 1 : 1 : length(z)
    H_omega_b = H_omega_b.*(j*omega - z(i));
end
H_omega_a = 1;
for i = 1 : 1 : length(p)
    H_omega_a = H_omega_a.*(j*omega - p(i));
end

H_omega = H_omega_b./H_omega_a;

figure(3)
ezplot(abs(H_omega),[-4, 4]);
grid on;
ylabel('|H(w)|');
xlabel('Frequency w[rad/sec]');