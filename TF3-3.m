clc;
clear;

t = linspace(0, 2*pi, 1000);
x = cos(t);
y = sin(t);

z1 = roots([1 -0.3]);
p1 = roots([1 0.3 0.36 0.108]);

figure(1)
plot(real(p1), imag(p1),'x',real(z1),imag(z1),'o', x,y,'-b');
grid on;
xlabel('Real(z)');
ylabel('Imag(z)');
axis([-1 1 -1 1]);

[r1,p1,k1] = residue([1 -0.3],[1 0.3 0.36 0.108]);

t = 1:1:20;
x1 = 0;
for i = 1:1:length(r1)
    if i == 1
        imp = 1;
    else
        imp = 0;
    end
    x1 = x1 + imp +  r1(i).*p1(i).^t;
end

stem(abs(x1));
grid on;
