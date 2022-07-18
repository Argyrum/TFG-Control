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
	
6. [x] Comparar amb els dispositius antics
	- [x] Planta nova vs antiga
	- [ ] Arduino vs targeta d'adquisició
	
7. [x] Identificar el filtre
	- [x] Bode empíric
	- [x] Teòric a partir del model elèctric
	
8. [x] Identificar el derivador
	- [x] Bode empíric
	- [x] Teòric a partir del model elèctric
	
10. [x] Buscar solució a la zona morta
	[ ] ~~Control PWM en software~~
	[ ] ~~Histerèsis / SMC~~
	[x] Control PWM en hardware (Veure més a baix)

11. [x] Dissenyar driver en modulació PWM
	- 11.2 [x] Triar xip
	- 11.3 [x] Dissenyar circuit
	- 11.4 [x] Verificar -> (No funciona)

12. [ ] Buscar una solució alternativa (En un futur)

13. [ ] Buscar solució al derivador (En un futur)

14. [ ] Determinar causa de les variacions de tau (En un futur)

### Control Automàtic
1. [x] Identificar problemes en les pràctiques de CA
	- Mateixos problemes que en CA (Incumplimente de les condicions d'estabilitat, zona morta i no compliment de l'assignació de pols)
	
2. Solució compartida amb DS

## Problemes base:

1. DS | Soroll excessiu en Kd
2. DS | Les condicions d’estabilitat teòriques no sempre quadren
3. DS | Control de posició (Tipus 1) amb consignes de >= 3V amb controlador P per a Kp baixos (1~2)
	- Error no nul, aixo no passava amb les plaques antigues i les targetes d’adquisició

## Problemes addicionals:

1. DS | En els moviments sobtats (Per exm: Canvi de posició objectiu) les masses del motor i del controlador es descompensen. - Arreglat
2. DS/CA | Control de posició (constant) amb consigna 2V amb controlador P, si es destorba manualment, presenta histeresi asimètrica (~0,5V per sobre i ~0,35V per sota)
3. DS | El filtre introdueix un desfasament - Negligible
4. DS/CA | Els transistors del sistema (TIP 121, 126) no són adients per al control PWM, tenen característiques pobres a f>10. Possible sobrecalentament.
5. DS/CA | La tau calculada no és constant, varia directament proporciona a l'amplitud de la consigna i segons el punt de càlcul essent les taus caluclades a partir de 95% sempre majors que les de 63%.
