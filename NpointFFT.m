function [f_hat, Xk, N_mult] = NpointFFT(x)
%N이 2의 지수배가 아닐 경우 x의 길이를 조절해주는 알고리즘입니다.
N_factor = 1:1:10;
N_factor = 2.^N_factor;
N_factor_r = N_factor.';
z = 2^knnsearch(N_factor_r,length(x));
%N과 가장 가까운 2의 지수배 값을 z로 저장하고, z가 N보다 클 경우 
%x의 길이가 충분치 않으므로 남은 값들을 제로패딩 시켜줍니다.
if(z >= length(x))
    B = zeros(1,z-length(x));
    x = [x B];
else        %z가 N보다 작은 경우 남는 값을 잘라줍니다.
    x_k = zeros(1,z);
    for i=1:1:z
        x_k(i) = x(i);  %남는 값을 자르기 위해 x_k라는 새로운 행렬을 만들어줍니다.
    end
    x = x_k;            %자른 값을 다시 x로 반환합니다.
end
N = length(x);          %새롭게 만들어진 x의 길이를 N에 저장합니다.
q = log2(N);                %FFT는 log2(N)=>q단계이므로 q 변수를 만들어주고 log2(N)을 저장합니다.
f_hat = linspace(-0.5, 0.5-(1/N), N);   %f_hat은 -0.5~0.5 입니다.
N_mult = 0;                 %곱셈 연산량을 저장하는 변수입니다.
n = 0:1:N-1;                %FFT연산 입력의 인덱스를 조정하기 위해 인덱스를 저장할 n 벡터를 만듭니다.
n = bin2dec(fliplr(dec2bin(n)));    %10진수 인덱스를 2진수로 바꾼 후 좌우 반전시키고 그것을 다시 10진수로 변환하여 반환합니다.
%FFT 알고리즘에 대한 자세한 설명은 보고서에 있습니다.
for i=1:1:N/2
    Xk_t(1+2*(i-1)) = x(n(2*(i-1)+1)+1)+x(n(2*(i-1)+2)+1)*exp((-1i*2*pi/2)*0);
    Xk_t(2+2*(i-1)) = x(n(2*(i-1)+1)+1)-x(n(2*(i-1)+2)+1)*exp((-1i*2*pi/2)*0);
    N_mult = N_mult+1;
end
for j=2:1:q
    for i=1:1:N/2
        Xk(i+floor(i/(2^(j-1)+(1/N)))*2^(j-1)) = Xk_t(i+floor(i/(2^(j-1)+(1/N)))*2^(j-1)) + Xk_t(i+floor(i/(2^(j-1)+(1/N)))*2^(j-1)+2^(j-1))*exp((-1i*2*pi/(2^j))*mod(i-1, 2^(j-1)));
        Xk(i+floor(i/(2^(j-1)+(1/N)))*2^(j-1)+2^(j-1)) = Xk_t(i+floor(i/(2^(j-1)+(1/N)))*2^(j-1)) - Xk_t(i+floor(i/(2^(j-1)+(1/N)))*2^(j-1)+2^(j-1))*exp((-1i*2*pi/(2^j))*mod(i-1, 2^(j-1)));
        N_mult = N_mult+1;
    end
    Xk_t=Xk;
end
%만들어진 FFT 행렬을 좌우 반전해 완성해줍니다.
for k=1:1:N/2
    Xk(k) = Xk_t(k+(N/2));
    Xk(k+(N/2)) = Xk_t(k);
end