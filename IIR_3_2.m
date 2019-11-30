clear;
clc;

[z p k] = buttap(7);
[b, a] = zp2tf(z,p,k);

[bt, at] = lp2bp(b, a, 3000*2*pi, 2000*2*pi);   % BPF
[bt1, at1] = lp2hp(b, a, 4000*2*pi);         % HPF

[numd, dend] = bilinear(bt, at, 50000);
[numd1, dend1] = bilinear(bt1, at1, 50000);

f = linspace(0,5500,110000);
w = f*2*pi;
ht = freqs(bt,at,w);
ht1 = freqs(bt1,at1,w);
hn = freqz(numd, dend, w./50000);
hn1 = freqz(numd1, dend1, w./50000);

plot(f, abs(ht), 'b','LineWidth',3);
grid on;
hold on;
ylabel('|H(f)|');
xlabel('Frequency, f[Hz]');

plot(f, abs(hn), 'g','LineWidth',3);

plot(f, abs(ht1), 'r','LineWidth',3);

plot(f, abs(hn1), 'c','LineWidth',3);
axis([1500 5500 0 1.4]);

legend('Analog BPF', 'Digital BPF', 'Analog HPF', 'Digital HPF');
