%Variables
tau = 0.255;
K = 50; % Resposta OP 2V 45 | OP 3V 50 | w/Vin 61
Kpot = 1.688; % Vpot = -0.04006 + 1.688*angle (angle =/= roda, desplaçat tal que angle 0 a roda 247.5)
Ktac = 0.01338; % Vtac = -0.04619 + 0.01338*w
Vds = 0.4; % Dead zone (pos) high
Vdi = -0.3; % Dead zone (pos) low
% deadzone motor start (vel) 0.8V simmetrical