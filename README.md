# TFG Control

Anàlisi de la planta de pràctiques de DS i CA.

[Memòria a Overleaf](https://www.overleaf.com/read/yvxmjhnzsfbc) (Només lectura)

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
	
10. [ ] Identificar els pols del sistema real
	- Freq. pròpia
	- Sobrepuig
	- Temps d'establiment (Envolvent 98% VF)

### Control Automàtic
1. [ ] Identificar problemes en les pràctiques de CA
	- Preguntar al professor de laboratori

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
