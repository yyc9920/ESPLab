clear;
clc;

[z p k] = buttap(7);
[b, a] = zp2tf(z,p,k);

[bt, at] = lp2bp(b, a, 6000/2, 2000);   % BPF
[bt1, at1] = lp2hp(b, a, 4000);         % HPF

[numd, dend] = bilinear(bt, at, 8000);
[numd1, dend1] = bilinear(bt1, at1, 8000);

w = linspace(0,5500,1000);
ht = freqs(bt,at,w);
ht1 = freqs(bt1,at1,w);
hn = freqz(numd, dend, w/8000);
hn1 = freqz(numd1, dend1, w/8000);

plot(w, abs(ht), 'b','LineWidth',3);
grid on;
hold on;
ylabel('|H(w)|');
xlabel('Frequency, f[Hz]');

plot(w, abs(hn), 'g','LineWidth',3);

plot(w, abs(ht1), 'r','LineWidth',3);

plot(w, abs(hn1), 'c','LineWidth',3);
axis([1500 5500 0 1.4]);

legend('Analog BPF', 'Digital BPF', 'Analog HPF', 'Digital HPF');