Proceso Adivinanzas
    // 1.- Declarar variables
    Definir limInferior, limSuperior, numeroEscogido Como Entero;
    Definir intento, maxIntentos, intentosHechos, intentosRestantes Como Entero;
    Definir adivinado Como Logico;
    
    // 2.- Pedir l�mites
    Escribir "Ingrese n�mero m�nimo para adivinar TECH";
    Leer limInferior;
    Escribir "Ingrese n�mero m�ximo para adivinar";
    Leer limSuperior;
    
    // Revisar l�mites v�lidos
    Si limSuperior < limInferior Entonces
        Escribir "ERROR ==> El n�mero m�ximo no puede ser menor al m�nimo";
    SiNo
        // 3.- Pedir m�ximo de intentos
        Escribir "Ingrese cantidad m�xima de intentos";
        Leer maxIntentos;
        
        // 4.- Generar n�mero aleatorio
        numeroEscogido <- obtenerNumero(limInferior, limSuperior);
        
        // Inicializar variables del ciclo
        intentosHechos <- 0;
        adivinado <- Falso;
        
        // 5.- Ciclo principal con Mientras
        Mientras intentosHechos < maxIntentos Y NO adivinado Hacer
            intentosHechos <- intentosHechos + 1;
            Escribir "Intento: ", intentosHechos, " de ", maxIntentos, ": Ingrese su n�mero";
            Leer intento;
            
            // Validar entrada dentro de rango
            Si intento > limSuperior Entonces
                Escribir "Error ==> El n�mero no puede ser superior a ", limSuperior;
            FinSi
            Si intento < limInferior Entonces
                Escribir "Error ==> El n�mero no puede ser inferior a ", limInferior;
            FinSi
            
            // Calcular intentos restantes
            intentosRestantes <- maxIntentos - intentosHechos;
            
            // Comparar con el n�mero objetivo
            Si intento = numeroEscogido Entonces
                Escribir "�Felicidades! El n�mero era: ", numeroEscogido;
                adivinado <- Verdadero;
            Sino
                Si intento < numeroEscogido Entonces
                    Escribir "El n�mero es mayor. Te quedan ", intentosRestantes, " intentos";
                Sino
                    Escribir "El n�mero es menor. Te quedan ", intentosRestantes, " intentos";
                FinSi
            FinSi
        FinMientras
        
        // 6.- Mensaje si no adivin�
        Si NO adivinado Entonces
            Escribir "Lo siento, no adivinaste. El n�mero era: ", numeroEscogido;
        FinSi
    FinSi
FinProceso

SubProceso resultado <- obtenerNumero(min, max)
    Definir rango, random, resultado Como Entero;
    rango <- max - min + 1;
    random <- Azar(rango);
    resultado <- random + min;
FinSubProceso