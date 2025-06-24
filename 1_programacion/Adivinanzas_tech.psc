Proceso Adivinanzas
    // 1.- Declarar variables
    Definir limInferior, limSuperior, numeroEscogido Como Entero;
    Definir intento, maxIntentos, intentosHechos, intentosRestantes Como Entero;
    Definir adivinado Como Logico;
    
    // 2.- Pedir límites
    Escribir "Ingrese número mínimo para adivinar TECH";
    Leer limInferior;
    Escribir "Ingrese número máximo para adivinar";
    Leer limSuperior;
    
    // Revisar límites válidos
    Si limSuperior < limInferior Entonces
        Escribir "ERROR ==> El número máximo no puede ser menor al mínimo";
    SiNo
        // 3.- Pedir máximo de intentos
        Escribir "Ingrese cantidad máxima de intentos";
        Leer maxIntentos;
        
        // 4.- Generar número aleatorio
        numeroEscogido <- obtenerNumero(limInferior, limSuperior);
        
        // Inicializar variables del ciclo
        intentosHechos <- 0;
        adivinado <- Falso;
        
        // 5.- Ciclo principal con Mientras
        Mientras intentosHechos < maxIntentos Y NO adivinado Hacer
            intentosHechos <- intentosHechos + 1;
            Escribir "Intento: ", intentosHechos, " de ", maxIntentos, ": Ingrese su número";
            Leer intento;
            
            // Validar entrada dentro de rango
            Si intento > limSuperior Entonces
                Escribir "Error ==> El número no puede ser superior a ", limSuperior;
            FinSi
            Si intento < limInferior Entonces
                Escribir "Error ==> El número no puede ser inferior a ", limInferior;
            FinSi
            
            // Calcular intentos restantes
            intentosRestantes <- maxIntentos - intentosHechos;
            
            // Comparar con el número objetivo
            Si intento = numeroEscogido Entonces
                Escribir "¡Felicidades! El número era: ", numeroEscogido;
                adivinado <- Verdadero;
            Sino
                Si intento < numeroEscogido Entonces
                    Escribir "El número es mayor. Te quedan ", intentosRestantes, " intentos";
                Sino
                    Escribir "El número es menor. Te quedan ", intentosRestantes, " intentos";
                FinSi
            FinSi
        FinMientras
        
        // 6.- Mensaje si no adivinó
        Si NO adivinado Entonces
            Escribir "Lo siento, no adivinaste. El número era: ", numeroEscogido;
        FinSi
    FinSi
FinProceso

SubProceso resultado <- obtenerNumero(min, max)
    Definir rango, random, resultado Como Entero;
    rango <- max - min + 1;
    random <- Azar(rango);
    resultado <- random + min;
FinSubProceso