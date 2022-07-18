K0 = 61;
tau0 = 0.28;
Kt = 0.013;
Kp = 1;
Ts = 0.01;

Gc = tf(Kp*K0*Kt,[tau0 1]);
Gd = c2d(Gc, Ts, 'zoh');
Gw = d2c(Gd,'Tustin');
figure ()

 kp=1 ; bode(kp*Gw);hold on;
 kp=5 ; bode(kp*Gw);hold on;
 kp=50 ; bode(kp*Gw);hold on;
 kp=64 ; bode(kp*Gw);hold on;
 kp=75 ; bode(kp*Gw);hold on;

 margin(Gw)
