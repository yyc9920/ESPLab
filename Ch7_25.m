G = tf(12, [2 1 0]);

% 원하는 앞섬 보상기의 위상 이득보다 조금 더 여유를 두어 설정.
th = 50*pi/180;
a = (1-sin(th))/(1+sin(th));
10*log10(a);
% 10*log10(a)의 값[dB]에 대한 주파수(rad/s)=x를 보데선도 크기 측에서 구함. T=1/x/sqrt(a);
T = 1/4.03/sqrt(a);
lead = tf([T 1],[T*a 1]);
G1 = series(lead, G);

bode(G1), grid;
