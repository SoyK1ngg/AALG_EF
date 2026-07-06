Algoritmo Planificador_ProgramacionDinamica
    Definir n, i, j, k, encontrado Como Entero
    Definir aux Como Real
    Definir mejorOpcion Como Real
	
    Escribir "Cantidad de tareas:"
    Leer n
	
    Dimension inicio[n+1]
    Dimension finTarea[n+1]
    Dimension beneficio[n+1]
    Dimension dp[n+1]
	
    Para i <- 1 Hasta n
        Escribir "Hora de inicio de la tarea ", i, ":"
        Leer inicio[i]
        Escribir "Hora de fin de la tarea ", i, ":"
        Leer finTarea[i]
        Escribir "Beneficio de la tarea ", i, ":"
        Leer beneficio[i]
    FinPara
	
    Para i <- 1 Hasta n - 1
        Para j <- 1 Hasta n - i
            Si finTarea[j] > finTarea[j+1] Entonces
                aux <- finTarea[j]
                finTarea[j] <- finTarea[j+1]
                finTarea[j+1] <- aux
				
                aux <- inicio[j]
                inicio[j] <- inicio[j+1]
                inicio[j+1] <- aux
				
                aux <- beneficio[j]
                beneficio[j] <- beneficio[j+1]
                beneficio[j+1] <- aux
            FinSi
        FinPara
    FinPara
	
    dp[0] <- 0
	
    Para i <- 1 Hasta n
        mejorOpcion <- beneficio[i]
		
        k <- i - 1
        encontrado <- 0
        Mientras k >= 1 Y encontrado = 0 Hacer
            Si finTarea[k] <= inicio[i] Entonces
                mejorOpcion <- beneficio[i] + dp[k]
                encontrado <- 1
            FinSi
            k <- k - 1
        FinMientras
		
        Si mejorOpcion > dp[i-1] Entonces
            dp[i] <- mejorOpcion
        SiNo
            dp[i] <- dp[i-1]
        FinSi
    FinPara
	
    Escribir ""
    Escribir "====================================="
    Escribir "Beneficio máximo obtenido: ", dp[n]
    Escribir "====================================="
FinAlgoritmo