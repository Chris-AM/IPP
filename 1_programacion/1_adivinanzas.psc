Proceso juegoAdivinanzas
	Definir limiteMinimo, limiteMaximo, numeroCreado, numerosIngresados Como Entero;
	Definir numeroIngresado, maxIntentos, intentosRestantes, turnos Como Entero;
	Definir isAdivinado Como Logico;
	
	// Establecer l�mites
	Escribir "**** Bienvenido al juego de Adivinazas ****";
	Escribir "Ingrese n�nero m�nimo para adivinar";
	Leer limiteMinimo;
	Escribir "Ingrese n�mero m�ximo para adivinar";
	Leer limiteMaximo;
	
	// revisar que el limite inferior no sea mayor al superior
	si limiteMaximo < limiteMinimo Entonces
		Escribir "ERROR ==> El n�mero m�ximo no puede ser menos al m�nimo";
	SiNo
		// Pedir n�mero m�ximo de intentos
		Escribir "Ingrese cantidad m�xima de intentos";
		Leer maxIntentos;
		
		Dimensionar numerosIngresados[maxIntentos];
		intentosRestantes <- maxIntentos;
		
		Escribir "Adivina el n�mero entre: ", limiteMinimo, " y: ", limiteMaximo;
		
		numeroCreado <- obtenerNumero(limiteMinimo, limiteMaximo);
		
		turnos <- 1;
		
		isAdivinado <- Falso;
		
		// Actualizacion Para => Repetir
		Repetir
			Escribir "Ingresa que n�mero crees que es el correcto. Tienes: ", intentosRestantes " intentos Restantes";
			Leer numeroIngresado;
			Si revisionDuplicados(numerosIngresados, turnos, numeroIngresado) Entonces
				Escribir "El n�mero ya fue ingresado, has usado estos intentos: ";
				listarNumeros(numerosIngresados, turnos);
			SiNo
				numerosIngresados[turnos] <- numeroIngresado;
				Escribir "N�mero ingresado: ", numeroIngresado, " es...";
				// Revision si n�mero ingresado es v�lido entre el rango de n�meros
				Si numeroIngresado > limiteMaximo Entonces
					Escribir "Error ===> El n�mero ingresado no puede ser superior al numero m�ximo a adivinar";
				SiNo
					si numeroIngresado < limiteMinimo Entonces
						Escribir "Error ===> El n�mero ingresado no puede ser inferior al numero m�nimo a adivinar";
					SiNo
						si numeroIngresado < numeroCreado Entonces
							Escribir "Incorrecto! El n�mero es mayor. Te quedan ", intentosRestantes, " intentos";
						FinSi
						si numeroIngresado > numeroCreado Entonces
							Escribir "Incorrecto! El n�mero es menor. Te quedan ", intentosRestantes, " intentos";
						FinSi
						si numeroIngresado == numeroCreado Entonces
							Escribir "Correcto! Adivinaste el n�mero";
							isAdivinado <- Verdadero;
						FinSi
						intentosRestantes <- intentosRestantes -1;
						turnos = turnos +1;
					FinSi
				FinSi
			FinSi
		Hasta Que intentosRestantes == 0 o isAdivinado == Verdadero
		si isAdivinado == Verdadero Entonces
			Escribir "Ganaste en : ", turnos -1, " intentos.";
		SiNo
			Escribir  "Perdiste, el n�mero era:", numeroCreado;
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

Funcion listarNumeros (listaDeNumeros, turnos)
	Definir iteracion Como Entero;
	Escribir Sin Saltar " [";
	Para iteracion <- 1 Hasta turnos -1 Hacer
		Escribir Sin Saltar " ", listaDeNumeros[iteracion];
	FinPara
	Escribir " ]";
FinFuncion

Funcion duplicado <- revisionDuplicados (listaDeNumeros, turnos, nuevo)
	Definir iteracion Como Entero;
	Definir duplicado Como Logico;
	duplicado <- Falso;
	si turnos > 1 Entonces
		para iteracion <- 1 Hasta turnos -1 Hacer
			si nuevo == listaDeNumeros[iteracion] Entonces
				duplicado <- Verdadero;
			FinSi
		FinPara
	FinSi
FinFuncion