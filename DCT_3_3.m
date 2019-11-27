clear;
clc;
row = 256;
col = 256;
Z = myfun_LoadImage('lena.raw', row, col);
Z_dct = dct2(Z);
m1 = max(Z_dct);
m2 = max(m1);
Zd = (Z_dct/m2)*255;
Zdx = (Z_dct/m2)*255;
Ao = length(find(Z));
% A = find(abs(Zd)<0.01);
% for i=1:1:length(A)
%     Zd(A(i)) = 0;
% end
for i=1:1:256
    for j=1:1:256
        if abs(Zd(i, j))<0.01
            Zd(i, j)=0;
        end
    end
end
A1 = length(find(Zd));
Z_idct = idct2(Zd/255*m2);
Z_idct = uint8(Z_idct);
%RMSE
for i=1:1:256
    for j=1:1:256
        s(i, j) = abs(Z(i, j) - Z_idct(i, j))^2;
    end
end
RMSE1 = sqrt((2^(-16))*sum(sum(s)));
figure(1);
subplot(221);
imshow(Z_idct);
figure(2);
subplot(221);
imshow(Zd);

Zd = (Z_dct/m2)*255;
A = find(abs(Zd)<0.1);
for i=1:1:length(A)
    Zd(A(i)) = 0;
end
A2 = length(find(Zd));
Z_idct = idct2(Zd/255*m2);
Z_idct = uint8(Z_idct);
%RMSE
for i=1:1:256
    for j=1:1:256
        s(i, j) = abs(Z(i, j) - Z_idct(i, j))^2;
    end
end
RMSE2 = sqrt((2^(-16))*sum(sum(s)));
figure(1);
subplot(222);
imshow(Z_idct);
figure(2);
subplot(222);
imshow(Zd);

Zd = (Z_dct/m2)*255;
A = find(abs(Zd)<0.25);
for i=1:1:length(A)
    Zd(A(i)) = 0;
end
A3 = length(find(Zd));
Z_idct = idct2(Zd/255*m2);
Z_idct = uint8(Z_idct);
%RMSE
for i=1:1:256
    for j=1:1:256
        s(i, j) = abs(Z(i, j) - Z_idct(i, j))^2;
    end
end
RMSE3 = sqrt((2^(-16))*sum(sum(s)));
figure(1);
subplot(223);
imshow(Z_idct);
figure(2);
subplot(223);
imshow(Zd);

Zd = (Z_dct/m2)*255;
% A = find(abs(Zd)<0.5);
% for i=1:1:length(A)
%     Zd(A(i)) = 0;
% end
for i=1:1:256
    for j=1:1:256
        if abs(Zd(i, j))<0.5
            Zd(i, j)=0;
        end
    end
end
A4 = length(find(Zd));
Z_idct = idct2(Zd/255*m2);
Z_idct = uint8(Z_idct);
%RMSE
for i=1:1:256
    for j=1:1:256
        s(i, j) = abs(Z(i, j) - Z_idct(i, j))^2;
    end
end
RMSE4 = sqrt((2^(-16))*sum(sum(s)));
figure(1);
subplot(224);
imshow(Z_idct);
figure(2);
subplot(224);
imshow(Zd);

Zd = (Z_dct/m2)*255;
A = find(abs(Zd)<0.001);
for i=1:1:length(A)
    Zd(A(i)) = 0;
end
A0 = length(find(Zd));
Z_idct = idct2(Zd/255*m2);
Z_idct = uint8(Z_idct);
%RMSE
for i=1:1:256
    for j=1:1:256
        s(i, j) = abs(Z(i, j) - Z_idct(i, j))^2;
    end
end
RMSE0 = sqrt((2^(-16))*sum(sum(s)));

Zd = (Z_dct/m2)*255;
A = find(abs(Zd)<0.05);
for i=1:1:length(A)
    Zd(A(i)) = 0;
end
A01 = length(find(Zd));
Z_idct = idct2(Zd/255*m2);
Z_idct = uint8(Z_idct);
%RMSE
for i=1:1:256
    for j=1:1:256
        s(i, j) = abs(Z(i, j) - Z_idct(i, j))^2;
    end
end
RMSE01 = sqrt((2^(-16))*sum(sum(s)));

figure(3)
subplot(211);
semilogy(0.001, A0/Ao, 'ro-', 0.01, A1/Ao, 'ro-', 0.05, A01/Ao, 'ro-', 0.1, A2/Ao, 'ro-', 0.25, A3/Ao, 'ro-', 0.5, A4/Ao, 'ro-');
% ylim([10^(-3) 1]);
subplot(212);
plot(0.001, RMSE0, 'bo-', 0.01, RMSE1, 'bo-', 0.05, RMSE01, 'bo-', 0.1, RMSE2, 'bo-', 0.25, RMSE3, 'bo-', 0.5, RMSE4, 'bo-');