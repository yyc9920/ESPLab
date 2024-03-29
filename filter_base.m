clear;
clc;

[z p k] = buttap(5);    % 5차 Butterworth 필터 전달함수의 zero와 pole.

% 원을 그리는 함수
t = linspace(0, 2*pi, 1000);
x = cos(t);
y = sin(t);

figure(1)
subplot(221);
plot(real(p), imag(p),'x',real(z),imag(z),'o', x,y,':b','MarkerSize',20);
grid on;
xlabel('Real(z)');
ylabel('Imag(z)');
axis([-1 1 -1 1]);

w = linspace(0,2,1000);
[b, a] = zp2tf(z,p,k);
h = freqs(b,a,w);       % 전달함수를 주파수 응답으로 변환해준다.

figure(2)
subplot(221);
plot(w, 10*log10(abs(h).^2));
grid on;
ylabel('10log10|H(w)|^2');
xlabel('Frequency w[rad/sec]');
axis([0 2 -40 5]);

[z p k] = cheb1ap(5, 10);   % 5차 체비셰프 타입 1 필터 전달함수의 zero와 pole.

figure(1)
subplot(222);
plot(real(p), imag(p),'x',real(z),imag(z),'o', x,y,':b','MarkerSize',20);
grid on;
xlabel('Real(z)');
ylabel('Imag(z)');
axis([-1 1 -1 1]);

w = linspace(0,2,1000);
[b, a] = zp2tf(z,p,k);
h = freqs(b,a,w);

figure(2)
subplot(222);
plot(w, 10*log10(abs(h).^2));
grid on;
ylabel('10log10|H(w)|^2');
xlabel('Frequency w[rad/sec]');
axis([0 2 -70 5]);

[z p k] = cheb2ap(5, 30);   % 5차 체비셰프 타입 2 필터 전달함수의 zero와 pole.

figure(1)
subplot(223);
plot(real(p), imag(p),'x',real(z),imag(z),'o', x,y,':b','MarkerSize',10);
grid on;
xlabel('Real(z)');
ylabel('Imag(z)');
axis([-1.5 1 -2 2]);

w = linspace(0,2,1000);
[b, a] = zp2tf(z,p,k);
h = freqs(b,a,w);

figure(2)
subplot(223);
plot(w, 10*log10(abs(h).^2));
grid on;
ylabel('10log10|H(w)|^2');
xlabel('Frequency w[rad/sec]');
axis([0 2 -70 5]);

[z p k] = ellipap(5, 10, 30);   % 5차 Elliptic 필터 전달함수의 zero와 pole.

figure(1)
subplot(224);
plot(real(p), imag(p),'x',real(z),imag(z),'o', x,y,':b','MarkerSize',10);
grid on;
xlabel('Real(z)');
ylabel('Imag(z)');
axis([-1 1 -1.5 1.5]);

w = linspace(0,2,1000);
[b, a] = zp2tf(z,p,k);
h = freqs(b,a,w);

figure(2)
subplot(224);
plot(w, 10*log10(abs(h).^2));
grid on;
ylabel('10log10|H(w)|^2');
xlabel('Frequency w[rad/sec]');
axis([0 2 -70 5]);
