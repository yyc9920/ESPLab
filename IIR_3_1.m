clear;
clc;

% 원을 그리는 함수
t = linspace(0, 2*pi, 1000);
x = cos(t);
y = sin(t);

num = 1;
den = [1 2 2 1];
[numd, dend] = bilinear(num, den, 5);
[numd1, dend1] = bilinear(num, den, 10);
[z, p, k] = tf2zp(num, den);
[z1, p1, k1] = tf2zp(numd, dend);
[z2, p2, k2] = tf2zp(numd1, dend1);

figure(1)
subplot(221);
plot(real(p), imag(p),'x',real(z),imag(z),'o', x,y,':b','MarkerSize',20);
grid on;
xlabel('Real(z)');
ylabel('Imag(z)');

figure(1)
subplot(223);
plot(real(p1), imag(p1),'x',real(z1),imag(z1),'o', x,y,':b','MarkerSize',20);
grid on;
xlabel('Real(z)');
ylabel('Imag(z)');

figure(1)
subplot(224);
plot(real(p2), imag(p2),'x',real(z2),imag(z2),'o', x,y,':b','MarkerSize',20);
grid on;
xlabel('Real(z)');
ylabel('Imag(z)');

w = linspace(0,2,1000);
h = freqs(num,den,w);
h1 = freqz(numd,dend,w/5);
h2 = freqz(numd1,dend1,w/10);

figure(2)
subplot(211);
plot(w, abs(h), 'b');
grid on;
hold on;
ylabel('|H(w)|');
xlabel('Frequency w[rad/sec]');
axis([0 2 0 1.4]);

plot(w, abs(h1), 'g');
axis([0 2 0 1.4]);

plot(w, abs(h2), 'r');
axis([0 2 0 1.4]);
legend('Analog Butterworth Filter', 'Digital Butterworth Filter, fs=5Hz', 'Digital Butterworth Filter, fs=10Hz');

subplot(212);
plot(w, abs(h), 'b');
grid on;
hold on;
ylabel('|H(w)|');
xlabel('Frequency w[rad/sec]');
axis([0.9 1.1 0.6 0.8]);

plot(w, abs(h1), 'g');
axis([0.9 1.1 0.6 0.8]);

plot(w,abs(h2), 'r');
axis([0.9 1.1 0.6 0.8]);
legend('Analog Butterworth Filter', 'Digital Butterworth Filter, fs=5Hz', 'Digital Butterworth Filter, fs=10Hz');

figure(3)
[h, t] = impz(numd1, dend1);
[r,p,k] = residue(numd1, dend1);
y = filter(numd1, dend1, h1);
subplot(311);
stem(t,h, 'filled'), grid;
axis([0 50 0 0.05]);
subplot(312);
stem(t,h, 'filled'), grid;
axis([0 100 -0.02 0.06]);
subplot(313);
stem(t,h, 'filled'), grid;
axis([0 150 -0.02 0.06]);