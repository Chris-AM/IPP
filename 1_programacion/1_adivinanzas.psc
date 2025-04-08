Proceso Adivinanzas
	// Consignas:
	// 1.- Obtener (declarar) numero min, max y max de intentos
	Definir limInferior, limSuperior, numeroEscogido Como Entero;
	Definir intento, maxIntentos, iteracion Como Entero;
	
	//2.- Pedir l�mites
	Escribir "Ingrese n�nero m�nimo para adivinar";
	Leer  limInferior;
	Escribir  "Ingrese n�mero m�ximo para adivinar";
	Leer limSuperior;
	
	// revisar que el limite inferior no sea mayor al superior
	si limSuperior < limInferior Entonces
		Escribir "ERROR ==> El n�mero m�ximo no puede ser menos al m�nimo";
	SiNo
		// 3.- Pedir n�mero m�ximo de intentos
		Escribir "Ingrese cantidad m�xima de intentos";
		Leer maxIntentos;
		//4.- Generar n�mero aleatoreo
		numeroEscogido <- obtenerNumero(limInferior, limSuperior);
		// Generar iteracion para crear maximo de intentos
		Para iteracion <- 1 Hasta maxIntentos Con Paso 1 Hacer
			Escribir  "Intento: ", iteracion, " de " , maxIntentos, ": Ingrese su n�mero";
			Leer intento;
			
			Si intento = numeroEscogido Entonces
				Escribir "Felicidades, el n�mero era: ", intento;
				iteracion <- maxIntentos +1;
			SiNo
				Si intento < numeroEscogido Entonces
					Escribir "El n�mero es mayor.";
				Sino
					Escribir "El n�mero es menor.";
				FinSi
			FinSi
		FinPara
		// Si no lo adivin�
		Si intento <> numeroEscogido Entonces
			Escribir "Lo siento, no adivinaste. El n�mero era: ", numeroEscogido;
		FinSi
	FinSi
FinProceso

SubProceso resultado <- obtenerNumero ( min, max )
	Definir rango, num, resultado Como Entero;
	Definir random Como Real;
	
    rango <- max - min + 1;
    random <- Azar(rango) ;
    resultado <- random + min;
FinSubProceso