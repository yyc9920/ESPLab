clc;
clear;

[z1, p1] = zp2tf(-5, [-1+2i -1-2i], 1);
[z2, p2] = zp2tf(-5, [2i -2i], 1);
[z3, p3] = zp2tf(-5, [1+2i 1-2i], 1);

syms t;
h1 = 0;
h2 = 0;
h3 = 0;
[r1,p1,k1] = residue(z1,p1);
[r2,p2,k2] = residue(z2,p2);
[r3,p3,k3] = residue(z3,p3);

for i = 1: 1: length(r1)
    h1 = h1 + r1(i).*exp(p1(i)*t);
end

subplot(311)
ezplot(h1,[0, 10]);
grid on;
ylim([-0.5 1.6]);

for i = 1: 1: length(r2)
    h2 = h2 + r2(i).*exp(p2(i)*t);
end

subplot(312)
ezplot(h2,[0, 10]);
grid on;
ylim([-4 4]);

for i = 1: 1: length(r3)
    h3 = h3 + r3(i).*exp(p3(i)*t);
end

subplot(313)
ezplot(h3,[0, 10]);
grid on;
ylim([-5 10]*(10^4));