Algoritmo Planificador_FuerzaBruta
    Definir n, i, j, combinacion, bit Como Entero
    Definir hayCruce Como Entero
    Definir beneficioTotal, mejorBeneficio Como Real
	
    Escribir "Cantidad de tareas:"
    Leer n
	
    Dimension inicio[n+1]
    Dimension finTarea[n+1]
    Dimension beneficio[n+1]
	
    Para i <- 1 Hasta n
        Escribir "Hora de inicio de la tarea ", i, ":"
        Leer inicio[i]
        Escribir "Hora de fin de la tarea ", i, ":"
        Leer finTarea[i]
        Escribir "Beneficio de la tarea ", i, ":"
        Leer beneficio[i]
    FinPara
	
    mejorBeneficio <- 0
	
    Para combinacion <- 0 Hasta (2^n) - 1
		
        beneficioTotal <- 0
        hayCruce <- 0
		
        Para i <- 1 Hasta n
            bit <- Trunc((combinacion MOD 2^i) / 2^(i-1))
            Si bit = 1 Entonces
                beneficioTotal <- beneficioTotal + beneficio[i]
				
                Para j <- 1 Hasta n
                    Si j <> i Entonces
                        Si Trunc((combinacion MOD 2^j) / 2^(j-1)) = 1 Entonces
                            Si inicio[i] < finTarea[j] Y inicio[j] < finTarea[i] Entonces
                                hayCruce <- 1
                            FinSi
                        FinSi
                    FinSi
                FinPara
            FinSi
        FinPara
		
        Si hayCruce = 0 Entonces
            Si beneficioTotal > mejorBeneficio Entonces
                mejorBeneficio <- beneficioTotal
            FinSi
        FinSi
		
    FinPara
	
    Escribir ""
    Escribir "La mejor combinacion de tareas da un beneficio de: ", mejorBeneficio
FinAlgoritmo