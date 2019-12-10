clear;
clc;
t = linspace(0, 15, 165375);
[y, fs] = audioread('Audio_Pop01_15sec.wav');
[f0, X] = myfun_SA(t, y);

subplot(211);
plot(y);
grid on;

subplot(212);
plot(f0, abs(X));
grid on;
axis([0 5000 0 0.015]);

% sound(y, fs);

% 정보 손실 방지를 위해 필요한 최소한의 표본화 주파수 => 0~5000Hz까지 표현하니 최소 fs = 100000이상이어야 한다.)
[numd_Ch1, dend_Ch1] = butter(7, 500*2/(3500*pi), 'low');
[numd_Ch2, dend_Ch2] = butter(6, [500*2/(3500*pi) 1500*2/(3500*pi)], 'bandpass');
[numd_Ch3, dend_Ch3] = butter(6, [1500*2/(3500*pi),2500*2/(3500*pi)], 'bandpass');
[numd_Ch4, dend_Ch4] = butter(6, [2500*2/(3500*pi),3500*2/(3500*pi)], 'bandpass');
[numd_Ch5, dend_Ch5] = butter(10, 3500*2/(3500*pi), 'high');

[z1, p1, k1] = tf2zp(numd_Ch1, dend_Ch1);
[z2, p2, k2] = tf2zp(numd_Ch2, dend_Ch2);
[z3, p3, k3] = tf2zp(numd_Ch3, dend_Ch3);
[z4, p4, k4] = tf2zp(numd_Ch4, dend_Ch4);
[z5, p5, k5] = tf2zp(numd_Ch5, dend_Ch5);

t = linspace(0, 2*pi, 1000);
x1 = cos(t);
y1 = sin(t);

figure(2)
subplot(321);
plot(real(p1), imag(p1),'x',real(z1),imag(z1),'o', x1,y1,':b','MarkerSize',10);
grid on;
xlabel('Real(z)');
ylabel('Imag(z)');
axis([-1.2 1.2 -1.2 1.2]);
subplot(322);
plot(real(p2), imag(p2),'x',real(z2),imag(z2),'o', x1,y1,':b','MarkerSize',10);
grid on;
xlabel('Real(z)');
ylabel('Imag(z)');
axis([-1.2 1.2 -1.2 1.2]);
subplot(323);
plot(real(p3), imag(p3),'x',real(z3),imag(z3),'o', x1,y1,':b','MarkerSize',10);
grid on;
xlabel('Real(z)');
ylabel('Imag(z)');
axis([-1.2 1.2 -1.2 1.2]);
subplot(324);
plot(real(p4), imag(p4),'x',real(z4),imag(z4),'o', x1,y1,':b','MarkerSize',10);
grid on;
xlabel('Real(z)');
ylabel('Imag(z)');
axis([-1.2 1.2 -1.2 1.2]);
subplot(325);
plot(real(p5), imag(p5),'x',real(z5),imag(z5),'o', x1,y1,':b','MarkerSize',10);
grid on;
xlabel('Real(z)');
ylabel('Imag(z)');
axis([-1.2 1.2 -1.2 1.2]);

f = linspace(0,5000,100000);
Hd_Ch1 = freqz(numd_Ch1, dend_Ch1, (f*2*pi)./(3500*pi));
Hd_Ch2 = freqz(numd_Ch2, dend_Ch2, (f*2*pi)./(3500*pi));
Hd_Ch3 = freqz(numd_Ch3, dend_Ch3, (f*2*pi)./(3500*pi));
Hd_Ch4 = freqz(numd_Ch4, dend_Ch4, (f*2*pi)./(3500*pi));
Hd_Ch5 = freqz(numd_Ch5, dend_Ch5, (f*2*pi)./(3500*pi));

figure(3)
hold on;
plot(f, abs(Hd_Ch1),'LineWidth',3);
plot(f, abs(Hd_Ch2),'LineWidth',3);
plot(f, abs(Hd_Ch3),'LineWidth',3);
plot(f, abs(Hd_Ch4),'LineWidth',3);
plot(f, abs(Hd_Ch5),'LineWidth',3);
grid on;
axis([0 5000 0 1.4]);
legend('Channel 1 filter', 'Channel 2 filter', 'Channel 3 filter', 'Channel 4 filter', 'Channel 5 filter');

y1 = filter(numd_Ch1, dend_Ch1, y);
y2 = filter(numd_Ch2, dend_Ch2, y);
y3 = filter(numd_Ch3, dend_Ch3, y);
y4 = filter(numd_Ch4, dend_Ch4, y);
y5 = filter(numd_Ch5, dend_Ch5, y);

t = linspace(0, 15, 165375);
[f1, X1] = myfun_SA(t, y1);
[f2, X2] = myfun_SA(t, y2);
[f3, X3] = myfun_SA(t, y3);
[f4, X4] = myfun_SA(t, y4);
[f5, X5] = myfun_SA(t, y5);

figure(4)
subplot(521);
plot(t, y1);
subplot(522);
plot(f1, abs(X1));
xlim([0 5000]);

subplot(523);
plot(t, y2);
subplot(524);
plot(f2, abs(X2));
xlim([0 5000]);

subplot(525);
plot(t, y3);
ylim([-0.05 0.05]);
subplot(526);
plot(f3, abs(X3));
xlim([0 5000]);

subplot(527);
plot(t, y4);
subplot(528);
plot(f4, abs(X4));
xlim([0 5000]);

subplot(529);
plot(t, y5);
subplot(5,2,10);
plot(f5, abs(X5));
xlim([0 5000]);

% sound(y1, fs);
% sound(y2, fs);
% sound(y3, fs);
% sound(y4, fs);
% sound(y5, fs);

c1 = 1;
c2 = 5;
c3 = 4;
c4 = 2;
c5 = 1;

y0 = c1*y1 + c2*y2 + c3*y3 + c4*y4 + c5*y5;
c0 = sqrt(sum(y.^2)/sum(y0.^2));

y_mix = c0*y0;
y_n = 1*y_mix;
[f_n, X_n] = myfun_SA(t, y_n);
sound(y_n, fs);

figure(5)
subplot(211);
plot(t, y, 'r');
hold on;
plot(t, y_n, 'k');
axis([0 15 -0.2 0.2]);
subplot(212);
plot(f0, abs(X), 'r');
hold on;
grid on;
plot(f_n, abs(X_n), 'k');
axis([0 5000 0 0.015]);
