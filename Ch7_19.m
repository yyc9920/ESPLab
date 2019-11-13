clear;
clc;

a = 1:0.1:1.5;
for i=1:1:length(a)
    G = tf([a(i) 2], [1 0 0]);
    bode(G);
    grid on;
    hold on;
    xlim([1.5 2]);
end
legend('1.0', '1.1', '1.2', '1.3', '1.4', '1.5');