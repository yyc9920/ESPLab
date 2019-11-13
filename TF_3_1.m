% clear;
% clc;
% 
% a = roots([1 5]);
% real_a = real(a);
% imag_a = imag(a);
% b = roots([1 2 5]);
% real_b = real(b);
% imag_b = imag(b);
% 
% [r, p, k] = residue([1 5], [1 2 5]);
% t = 0:0.001:10;
% ht = r(1)*exp(p(1)*t)+r(2)*exp(p(2)*t);
% 
% w = -4:0.001:4;
% Hw = (1i*w + 5)/(-w.^2 + 2i*w + 5);
% 
% subplot(311);
% plot(real_a, imag_a, 'ko', real_b, imag_b, 'kx', 'MarkerSize',20);
% 
% subplot(312);
% plot(t, ht);
% 
% subplot(313);
% ezplot(abs(Hw),[-4, 4]);

clc;
clear;


z = roots([1 5]);
p = roots([1 2 5]);

figure(1)
plot(real(p), imag(p),'x',real(z),imag(z),'o','MarkerSize',20);
grid on;
axis([-6 0 -2.5 2.5]);
xlabel('Real(s)');
ylabel('Imag(s)');

syms t;
[r,p,k] = residue([1 5],[1 2 5]);
h = 0;
for i = 1: 1: length(r)
    h = h + r(i).*exp(p(i)*t);
end
 
figure(2)
ezplot(h,[0, 10]);
grid on;
ylim([-0.4 1.6]);

% omega = -pi : pi/100 : 4*pi;
% omega = 2*pi*f;
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
% plot(omega ,H_omega);
ezplot(abs(H_omega),[-4, 4]);
grid on;
ylabel('|H(w)|');
xlabel('Frequency w[rad/sec]');