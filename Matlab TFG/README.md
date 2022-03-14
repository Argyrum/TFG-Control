## Simulacions i Anàlisis
En *PlantaTFG.slx* ( *PlantaTFG2020a.slx* si feu servir la versió antiga de matlab, la planta utilitzada es veu a la secció Simulació:"Tractament de dades" de l'script principal):

-Podeu triar entre motor perfectament lineal o amb zona morta, tingueu en compte que si poseu el model amb zona morta el guany és trueK en comptes de K (Està fet aixi per a poder rapidament canviar models entre trueK amb zona morta i una K "linearitzada").

El fitxer amb l'script principal és *Test_TFG.mlx*
	
- L'apartat de Setup a l'inici borrarà les variables del workspace a cada execució, tingueu-ne cura si en voleu conservar cap.
	
- L'apartat de Variables carrega en el workspace les constants del sistema (K, Ktac, Kpot) a través de TFG_Preload.m. Dins TFG_Preload hi ha anotats diferents valors de cada paràmetre en base al mètode utilitzat per a trobar-los.

- També configura el controlador PID del sistema (Kp, Ki, Kd), el tipus d'entrada, la seva amplitud i offset. També permet configurar el tipus de realimentació.
	
- L'apartat de Paràmetres calcula K i tau basant-se en dos respostes en llaç obert del sistema per a consignes de 2 i 3V, enmagatzemades a VelObert2V.mat i VelObert3v.mat respectivament.
	
- L'apartat de Teoria calcula Kxn per assignació de pols i en calcula la resposta a un graó per ambdues realimentacions.
	
- L'apartat de simulació calcula resposta a un graó i en fa un gràfic 2D, que guarda automàticament en un .png (Si no voleu aquesta funcionalitat comenteu la línia exportgraphics(...)). També genera un gràfic 3D com els que hem comentat, que el livescript mostrara com 2D, pero que si roteu manualment es tornarà 3D.
