w = logspace(-2, 2, 50);
mag = 20 * log10(abs(1./(1+1i*w)));
ph = -atan2(w, 1)*180/pi;
figure(2)
subplot(211), semilogx(w, mag), grid
subplot(212), semilogx(w, ph), grid