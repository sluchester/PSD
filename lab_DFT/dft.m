clear all; close all; clc;

% EXEMPLO 1
% usando a definição, calcular a DFT de .....

x = [4 3 2 1];
N = length(x);
X = zeros(1,N);
for k = 0:N-1
    for n = 0:N-1
        X(k+1) = X(k+1) + x(n+1)*exp(-j*2*pi*n*k/N);
    end
end

X1= X

%usando a fft
X2=fft(x)

% EXEMPLO 2
% Calcular a DFT de ...
N=5;
n=0:N-1;
x=[1 0 0 0 0];

figure(1); hold on; grid on;
subplot(3,1,1);
stem(n,x)
title('Sinal x[n] - impulso');

k=0:N-1;
X=fft(x);
subplot(3,1,2);
stem(k,abs(X))
title('Magnitude da DFT');

subplot(3,1,3);
stem(k,angle(X))
title('Fase da DFT');

% EXEMPLO 3
% Calcular a DFT de ....
N=50;
n=0:N-1;
x=ones(1,N);

figure(2)
subplot(3,1,1);
stem(n,x)
title('Sinal x[n] - constante');

k=0:N-1;
X=fft(x,N);
subplot(3,1,2);
stem(k,abs(X))
title('Magnitude da DFT');

subplot(3,1,3);
stem(k,angle(X))
title('Fase da DFT');

% EXEMPLO 4
% Calcular a DFT de 5 pontos de .....
N=5;
n=0:N-1;
x=[1 1 1 0 0];

figure(3)
subplot(3,1,1);
stem(n,x)
title('Sinal x[n]');

k=0:N-1;
X=fft(x,N);
subplot(3,1,2);
stem(k,abs(X))
title('Magnitude da DFT');

subplot(3,1,3);
stem(k,angle(X))
title('Fase da DFT');

% EXEMPLO 5
% Calcular a DFT de 10 pontos de ...
N=10;
n=0:N-1;
x=[1 1 1 1 1 -1 -1 -1 -1 -1];

figure(4)
subplot(3,1,1);
stem(n,x)
title('Sinal x[n]');

k=0:N-1;
X=fft(x);
subplot(3,1,2);
stem(k,abs(X))
title('Magnitude da DFT');

subplot(3,1,3);
stem(k,angle(X))
title('Fase da DFT');

% EXEMPLO 6
% Considere a sequência 