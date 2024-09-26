% Laboratorio de Transformada Z

% a) Determine a expressão da função de transferência do sistema.
% desenvolvido no próprio pdf

% b) Represente o sistema no plano-z. Verifique se o sistema é estável.
b=[1];
a=[1 -1 0.25];
zplane(b,a);

% c) Determine a expressão da resposta impulsiva do sistema.
[r p k]=residuez(b,a);
syms z
iztrans(1/(1-0.5*z^-1)^2)

% d) Represente a resposta impulsiva do sistema. Podemos fazer a representação da resposta impulsiva
% recorrendo à função impz(b, a, n)
impz(b,a,20);

% e) Determine a expressão da resposta em frequência do sistema.
% resolvida no pdf

% f) Represente graficamente a resposta em frequência do sistema.
w=0:pi/100:pi;
[H w]=freqz(b,a,w);
figure(3);plot(w,abs(H));grid on
axis([min(w) max(w) 0 max(abs(H))])
figure(4);plot(w,angle(H));grid on
axis([min(w) max(w) -pi/2 pi/2])

% g) Represente o sinal de entrada
n=0:20;
x=(1-0.25.^(n));
figure(5);
stem(n,x,'filled'); grid on

% h) Calcule a TZ do sinal de entrada
syms n
X= simplify(ztrans(1-0.25^n))

% i) Represente o sinal de entrada no plano-z
b=[0 0.75];
a=poly([1 0.25]);
zplane(b,a)

% j) Admitindo as condições iniciais nulas, determine a TZ da resposta do sistema ao sinal de entrada
b=[0 0.75];
a=poly([0.5 0.5 1 0.25]);
zplane(b,a)

