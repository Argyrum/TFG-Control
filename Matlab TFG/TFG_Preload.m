%Variables
tau = 0.255;
K = 50; % Resposta OP 2V 45 | OP 3V 50
trueK = 61; % rad/s / Vin -> 60,6~61,7
Kpot = 1.688; % Vpot = -0.04006 + 1.688*angle (angle =/= roda, desplaçat tal que angle 0 a roda 247.5)
Ktac = 0.01338; % Vtac = -0.04619 + 0.01338*w
Vds = 0.4617; % Dead zone (pos) high Empíric: w:(0 -> >0) 0.65V, w:(<0 -> 0) 0.6V | Regressió: 0.4617V
Vdi = -0.5354; % Dead zone (pos) low Empíric: w:(0 -> <0) 0.65V, w:(<0 -> 0) 0.6V | Regressió: -0.5354V