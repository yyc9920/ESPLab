clc;
clear;

t = linspace(0, 2*pi, 1000);
x = cos(t);
y = sin(t);

z1 = roots([1 -0.3])
p1 = roots([1 0.3 0.36 0.108])

figure(1)
plot(real(p1), imag(p1),'x',real(z1),imag(z1),'o', x,y,'-b');
grid on;
xlabel('Real(z)');
ylabel('Imag(z)');
axis([-1 1 -1 1]);


c_b = 1;
c_a = 1;

%z = 0
for i = 1 : 1 : length(z1)
    c_b = c_b*(0-z1(i));
end
for i = 1 : 1 : length(p1)
    c_a = c_a*(0-p1(i));
end
c0 = c_b/c_a;

syms z;
H_z = (z-0.3)/(z^3+0.3*z^2+0.36*z + 0.108)/z;
for i = 1 : 1 : length(p1)
    H = H_z*(z-p1(i));
    c = H(z==p1(i));
end