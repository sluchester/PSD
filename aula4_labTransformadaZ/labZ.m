% Laboratorio de Transformada Z

pkg load signal;

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

% k) Determine a expressão da resposta do sistema ao sinal de entrada.
[r p k]=residuez(b,a)
syms z
iztrans(4/(1-z^-1)-3/(1-0.5*z^-1)^2-1/(1-0.25*z^-1))

% l) Identifique a componente homogênea e a componente particular na expressão da resposta do sistema.

% resposta no pdf

% m) Identifique a componente transitória e a componente estacionária na expressão da resposta do sistema.

% resposta no pdf

% n) Represente a resposta do sistema ao sinal de entrada
n=0:10;
x=4-(3*(n+1)).*(0.5).^n-(0.25).^n;
figure(8);stem(n,x,'filled'); grid on;

% o) Represente a resposta do sistema ao sinal de entrada utilizando a função filter(b, a, x)
n=0:10;
x=1-0.25.^(n); 
b=[1];
a=[1 -1 0.25]; 
y=filter(b,a,x);
figure(9);stem(n,y,'filled'); grid on;

% p) Admita agora as condições iniciais não nulas. Determine o sinal xCI[n] que, colocado na entrada do 
% sistema com condições iniciais nulas, provoca uma resposta equivalente à existência das condições 
% iniciais.

% maior parte da resolução está no pdf
y=[1 1];
xic=filtic(b,a,y)

% q) Determine e TZ da resposta do sistema às condições iniciais

% resolução no pdf

% r) Determine a expressão da resposta do sistema às condições iniciais.
b=[0.75 -0.25]; 
a=[1 -1 0.25];
[r p k]=residuez(b,a)
syms z
iztrans(0.5/(1-0.5*z^-1)+0.25/(1-0.5*z^-1)^2)

% s) Determine a resposta completa do sistema admitindo condições iniciais não nulas.

% resolução no pdf

% t) Represente a resposta do sistema ao sinal de entrada, admitindo condições iniciais não nulas.
n=0:10;
x=4-(2.75*n+2.25).*0.5.^n-0.25.^n
figure(10);stem(n,x,'filled'); grid on;

% u) Represente a resposta do sistema ao sinal de entrada utilizando a função filter(b, a, x, xic)
n=0:10; 
x=1-0.25.^(n); 
b=[1];
a=[1 -1 0.25]; 
y=filter(b,a,x,xic);
figure(11);stem(n,y,'filled'); grid on;