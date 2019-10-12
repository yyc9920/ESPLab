function [t, p]=my_impulse_train_function(t1, t2, Ts, N)
                                 
t=linspace(t1, t2, N);      %t1 과 t2를 N만큼 나눠준 것을 t에 저장한다.                    
p=zeros(1, length(t));      %t와 같은 길이만큼 제로패딩 시킨 것을 p에 저장한다.                     

for    tt=t1 : Ts : t2-(Ts/N)   %t1에서 t2까지 Ts만큼 증가시키며
    x = (t-tt).';               %knnsearch 함수의 사용을 위해 t와 tt의 거리를 열벡터로 변환
      z = knnsearch(x,0);       %t와 tt와 가장 가까운 값이 있는 인덱스 값을 찾는다.                   
       p(z)= 1;             %각각의 인덱스의 값을 1로 바꾸준다.
end

% Idx = knnsearch(X,Y)는 
% Y의 각 점에 대해 X에서 최근접이웃을 찾은 후 
% Idx 열 벡터로 최근접이웃의 인덱스를 반환합니다. 
% Idx의 행 개수는 Y와 같습니다. (지금 경우에선 스칼라값이므로 z도 스칼라값으로 반환됨)