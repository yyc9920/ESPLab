function [f_hat, Xk, N_mult] = NpointDFT(x)
N = length(x);              %식 5를 이용한 DFT 계산을 위해 x의 길이를 N에 저장합니다.
N_to_Sum = 0 : 1:(N-1);     %시그마 계산을 위해 0~N-1까지의 정수가 저장된 벡터를 만듭니다.
Xk = zeros(1,N);            %Xk를 길이 N만큼 0으로 채웁니다.
Xk_t = zeros(1,N);          %Xk를 반씩 잘라 앞뒤를 바꿔주기 위해 임시 저장하는 Xk를 만듭니다.
N_mult = 0;                 %곱하는 횟수를 알기 위해 N_mult 변수를 지정합니다.
%식 5를 매트랩으로 구현
for k=1:1:N
    for n=1:1:N
        Xk_t(k)=Xk_t(k) + x(n)*exp(-1i*2*pi*(N_to_Sum(k)/N)*N_to_Sum(n));
        N_mult = N_mult + 1; %곱셈 횟수를 셈합니다.
    end
end

%앞뒤를 반씩 잘라 바꿔줍니다.
for k=1:1:N/2
    Xk(k) = Xk_t(k+(N/2));
    Xk(k+(N/2)) = Xk_t(k);
end
%f_hat을 -0.5에서 0.5-(1/N)까지 N등분 합니다.
f_hat = linspace(-0.5, 0.5-(1/N), N);
% n = 0:1:N-1;
% N_mult = N^2;
% [f_hat, Xk] = myfun_SA(n, x);
