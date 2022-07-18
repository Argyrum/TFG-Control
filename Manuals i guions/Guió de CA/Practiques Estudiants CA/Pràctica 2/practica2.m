Kp=1;
K0=61;
tau0=0.28;
motor=tf(K0,[tau0 1]);
Kt=0.013;
aoc=Kp*motor*Kt;
Ts=0.01;
aod=c2d(aoc, Ts, 'zoh');

%respuesta experimental
M=[0.85 0.764 0.591 0.38 0.1736 0.0968 0.04]; %datos medidos
phi = -[0.33 0.55 0.88 1.131 1.508 2.2 2.5132]; %datos medidos
X = real(M.*exp(j*phi));
Y = imag(M.*exp(j*phi));
figure()
%nyquist(aoc), hold on
bode(aod), hold on
%bode(aod*2)
plot(X,Y,'or')
