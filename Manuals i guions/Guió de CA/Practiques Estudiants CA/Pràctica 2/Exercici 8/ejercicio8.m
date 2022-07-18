%Respuesta experimental
G=[0.92 0.838 0.6 0.372 0.18 0.082 0.04]
F=-[0.53 0.68 0.9 1.25 1.6 1.88 2.5] %desfasamientos
X = real(G.*exp(j*F));
Y = imag(G.*exp(j*F));
%Respuesta teórica
K0 = 61;
Tau0 = 0.28;
Kt = 0.013;
Kp = 1;
Ts = 0.01;
%Grafica
Gc = tf(Kp*K0*Kt,[Tau0 1]);
Gd = c2d(Gc, Ts, 'zoh');
figure ()
nyquist(Gd);hold on, %resp experimental
plot(X,Y,'or'); %resp experimental
legend('teorico', 'experimental')