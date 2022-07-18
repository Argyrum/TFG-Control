kp=1;
k0=61;
tau0=0.28;
motor=tf(k0,[tau0 1]);
kt=0.013;
ts=0.01;
aoc=series(kt*kp,motor);
aod=c2d(aoc,ts,'zoh');

figure,
nyquist(aoc), hold on, nyquist(aod)
legend('Sistema Continuo', 'Sistema Discreto')