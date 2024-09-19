# Laboratório de Sinais e Sistemas de Tempo Discreto

# EXEMPLO 1 - Trace os seguintes sinais discretos no tempo
# a) xa  = (-0.5)^n
# b) xb  = (2)^-n
# c) xc  = (-2)^n

n = 0:5;
#xa = (-0.5).^n;
xa=@(n) (-0.5).^n;
xb = (2).^(-n);
xc = (-2).^(n);
figure(1)
subplot(3,1,1);
#stem(n,xa);
stem(n,xa(n));
ylabel('xa[n]')
subplot(3,1,2);
stem(n,xb);
ylabel('xb[n]')
subplot(3,1,3);
stem(n,xc);
ylabel('xc[n]')

