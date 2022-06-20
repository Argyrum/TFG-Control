K0 = 61;
tau0 = 0.28;
Kt = 0.013;
Kp = 1;
Ts = 0.01;

Gc = tf(Kp*K0*Kt,[Tau0 1]);
Gd = c2d(Gc, Ts, 'zoh');
figure ()

 kp=1 ; nyquist(kp*Gd);hold on;
 kp=5 ; nyquist(kp*Gd);hold on;
 kp=50 ; nyquist(kp*Gd);hold on;
 kp=64 ; nyquist(kp*Gd);hold on;
 kp=75 ; nyquist(kp*Gd);hold on;

 nyquist(Gd)

