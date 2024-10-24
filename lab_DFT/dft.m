clear all; close all; clc;

pkg load signal;

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
% Considere a sequência... Seja a DFT de 6 pontos de ... Encontre a sequência finita cuja DFT de 6 pontos é .
N=6;
k=0:N-1;
n=0:N-1;
x=[4 3 2 1 0 0];

figure(5)
subplot(2,1,1);
stem(n,x)
title('Sinal x[n]');

X=fft(x);
Y=exp(j*2*pi*4*k/6).*X;
y=ifft(Y);
subplot(2,1,2);
stem(n,abs(y));
title('Sinal y[n]');

% EXEMPLO 7
% Seja a sequência ... A DFT de 5 pontos de é computada e a sequência resultante é elevada ao quadrado: 
N=5;
n=0:N-1;
x=[2 1 0 1 0 ];

figure(6)
subplot(3,1,1);
stem(n,x);
title('Sinal x[n]');

X=fft(x);
Y=X.^2;
y=ifft(Y);
subplot(3,1,2);
stem(n,y);
title('Sinal y[n] pela DFT');

subplot(3,1,3);
stem(n,cconv(x,x,5));
title('Sinal y[n] pela convolução');

% EXEMPLO 8
N=5;
n=0:N-1;
x=[1 3 3 2 0];
h=[1 1 1 1 0];

figure(7)
subplot(4,1,1);
stem(n,x)
title('Sinal x[n]');

subplot(4,1,2);
stem(n,h)
title('Sinal h[n]');

X=fft(x);
H=fft(h);
Y=X.*H;
y=ifft(Y);
subplot(4,1,3);
stem(n,y);
title('Sinal y[n] obtido pela DFT');

subplot(4,1,4);
stem(n,cconv(x,h,5));
title('Sinal y[n] obtido pela convolução');

% EXEMPLO 9
% Encontre a DFT inversa de , onde é a DFT de 10 pontos da sequência 
N=10;
n=0:N-1;
x=[1 1 1 1 1 1 0 0 0 0];

figure(8)
subplot(2,1,1);
stem(n,x);
title('Sinal x[n]');

X=fft(x);
Y=X.*conj(X);
y=ifft(Y);
subplot(2,1,2);
stem(n,y);
title('Sinal y[n]');

% EXEMPLO 10
% Suponha que o sinal , amostrado a é corrompido por uma pequena quantidade de ruíıdo. Esse sinal é gerado pelos seguintes comandos:
amplitude_1 = 5; 
freq_1 = 5; 
amplitude_2 = 2; 
freq_2 = 50; 
Fs = 1000; 
time = 0:1/Fs:(1-1/Fs); 
sine_1 = amplitude_1*sin(2*pi*freq_1.*time); 
sine_2 = amplitude_2*sin(2*pi*freq_2.*time); 
noise = randn(1,length(time));
x_clean = sine_1 + sine_2; 
x_noisy = x_clean + noise; 
figure(9); 
plot(time,x_clean);

figure(10); 
plot(time,x_noisy);

XC = fft(x_clean); 
L=length(XC);
XC = abs(2*XC/L);
XC=fftshift(XC);
freq = Fs*(-(L/2):(L/2)-1)/L; 
plot(freq,XC)
axis([-100 100 -1 6])

XN = fft(x_noisy); 
XN = abs(2*XN/L);
XN=fftshift(XN);
freq = Fs*(-(L/2):(L/2)-1)/L; 
plot(freq,XN)
axis([-100 100 -1 6])

N=10;
b = ones(1,N); 
y = filter(b,N,x_noisy); 
Y = fft(y); 
Y = abs(2*Y/L);
Y=fftshift(Y);
freq = Fs*(-(L/2):(L/2)-1)/L; 
plot(freq,Y)
axis([-100 100 -1 6])
