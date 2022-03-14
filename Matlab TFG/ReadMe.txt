En PlantaTFG.slx (PlantaTFG2020a.slx si feu servir la versió antiga de matlab, la planta utilitzada es veu a la línia 42-43 de l'script principal) podeu configurar el tipus i característiques de la consigna, la topologia del sistema, la variable de realimentació, i triar entre motor perfectament lineal o amb zona morta, tingueu en compte que si poseu el model amb zona morta el guany és 60, independentment del valor de K (Està fet aixi per a poder rapidament canviar models entre 60 amb zona morta i una K "linearitzada").

El fitxer amb l'script principal és Test_TFG.mlx
	
	L'apartat de Setup a l'inici borrarà les variables del workspace a cada execució, tingueu-ne cura si en voleu conservar cap.
	
	L'apartat de Variables carrega en el workspace les constants del sistema (K, Ktac, Kpot) a través de TFG_Preload.m. També configura el controlador del sistema (Kp, Ki, Kd). El text a entrada String és el prefix que portaran totes les gràfiques generades per aquesta simulació, està fet aixi perque la variable de realimentació i l'amplitud de la consigna es configura a simulink i no he trobat encara com fer que l'script ho llegeixi i configuri sol el prefix de text.
	
	L'apartat de Paràmetres calcula K i tau basant-se en dos respostes en llaç obert del sistema per a consignes de 2 i 3V, enmagatzemades a VelObert2V.mat i VelObert3v.mat respectivament.
	
	L'apartat de Teoria guarda al workspace la TF del sistema i en mostra els pols i zeros.
	
	L'apartat de simulació calcula resposta a un graó i en fa un gràfic 2D, que guarda automaticament en un .png (Si no voleu aquesta funcionalitat comenteu la línia 69, exportgraphics(...)). També genera un gràfic 3D com els que hem comentat, que el livescript mostrara com 2D, pero que si roteu manualment es tornara 3D.