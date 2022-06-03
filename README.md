# TFG Control

Anàlisi de la planta de pràctiques de DS i CA.

[Memòria a Overleaf](https://www.overleaf.com/read/zktdpqjvkxcc) (Només lectura)

## Tests i Punts pendents d'aprofundir-hi
### Dinàmica de Sistemes
1. [x] Mirar pràctiques de DS
	
2. [x] Mirar descompensació de Masses
	- [x] Tornar a mirar amb el controlador i la planta alimentats en sèrie
	
3. [x] Mirar zona morta del motor
	
4. [x] Buscar els paràmetres empíricament
	- [x] Tacòmetre
	- [x] Potenciòmetre
	- [x] Motor
	
5. [x] Analitzar la qualitat del ADC de l'arduino
	
6. [ ] Comparar amb els dispositius antics
	- [ ] Planta nova vs antiga
	- [ ] Arduino vs targeta d'adquisició
	
7. [x] Identificar el filtre
	- [x] Bode empíric
	- [x] Teòric a partir del model elèctric
	
8. [x] Identificar el derivador
	- [x] Bode empíric
	- [x] Teòric a partir del model elèctric
	
9. [ ] Mirar el model de la planta utilitzat a l'app
	
11. [ ] Buscar solució a la zona morta
	- ~~Control PWM en software~~
	- ~~Histerèsis / SMC~~
	- Control PWM en hardware (Veure més a baix)
		- 11.2 [x] Triar xip
		- 11.3 [ ] Dissenyar circuit
		- 11.4 [ ] Verificar
	
12. [ ] Buscar solució al derivador

### Control Automàtic
1. [x] Identificar problemes en les pràctiques de CA
	- Mateixos problemes que en CA (Incumplimente de les condicions d'estabilitat, zona morta i no compliment de l'assignació de pols)

## Problemes base:

1. DS | Soroll excessiu en Kd
2. DS | Les condicions d’estabilitat teòriques no sempre quadren
3. DS | Control de posició (Tipus 1) amb consignes de >= 3V amb controlador P per a Kp baixos (1~2)
	- Error no nul, aixo no passava amb les plaques antigues i les targetes d’adquisició

## Problemes addicionals:

1. DS | En els moviments sobtats (Per exm: Canvi de posició objectiu) les masses del motor i del controlador es descompensen.
2. DS | Control de posició (constant) amb consigna 2V amb controlador P, si es destorba manualment, presenta histeresi en tots dos sentits (0,5V per sobre i 0,35V per sota)
3. DS | (Cal aprofundir-hi) El filtre introdueix un desfasament
4. DS | Nota: El guany del derivador és molt petit a la zona de treball, possible motiu del soroll desproporcionat
4. DS | Els BJT del sistema (TIP 121, 126) no són adients per al control PWM, tenen característiques pobres a f>10. (BJT -> IGBT?)

## Idees per al control PWM
#### Senyal analògic a PWM amb control de direcció
- Mòdul Fet: [Analog to PWM (Amazon ~24€)](www.amazon.es/dp/B07WFBCNWM)
- Xip: ATtiny (o un atmega328p mateix)
- Tot discret
	- Comparador + generador de senyal triangular (1 positiu i 1 negatiu)-> PWM
	- Circuit de potència L298N / Mosfets / IGBT (H-Bridge)

#### Senyal PWM de control a PWM de potència amb control de direcció
- Mòdul Fet: [L298N DC motor control module (Amazon ~8€)](www.amazon.es/dp/B07DK6Q8F9)
- Xip: L298N (O un més simple i barat)
- Tot discret:
	- Comparador + generador de senyal triangular (sempre positiu)-> PWM
	- Diode ideal (OpAmp) -> Pin de direcció del L298N

```
Entrada> ----- |Comparador+Senyal| -------------\				+12V -----\
			\----- |Buffer| ------- |Interruptor bidireccional| ------- |Mosfets| ---- <Motor
			   +12V --/\-- -12V 					-12V -----/
```