/*

    GOTO :

    La instruccion GOTO altera el flujo de ejecucion y lo dirige a una etiqueta. Las instrucciones
    Transact SQL que siguen a una instruccion GOTO se pasan por alto y el procesamiento continua en el punto
    que marca la etiqueta. La instrucciones GOTO y las etiquetas se puede utilizar en cualquierp unto de un procedimiento
    o lote / bloque de instrucciones. Las instrucciones GOTO se puede anidar.


*/


-- Puedes ubicarte en cualquier Base de Datos

DECLARE @contador TINYINT = 1
WHILE @contador < 10  
BEGIN   
    
    IF @contador = 4 GOTO etiqueta_uno	-- Salta a la primera etiqueta.
    IF @contador = 5 GOTO etiqueta_dos  -- Esto nunca se ejecutar�.
	SET @contador = @contador + 1  
END  
etiqueta_uno:
    PRINT 'Saltando a la etiqueta Uno.'
    GOTO etiqueta_tres	-- Esto evitar� que Etiqueta Dos se ejecute.
etiqueta_dos:
    PRINT 'Saltando a la etiqueta Dos.'
etiqueta_tres:  
    PRINT 'Saltando a la etiqueta Tres.'


/*

Caso específico: Manejo de errores sin usar TRY...CATCH

Imagina que tienes un proceso donde necesitas validar datos antes de ejecutarlo. 
Si la validación falla, puedes usar GOTO para saltar directamente a una parte del código que maneja el error.Caso específico: Manejo de errores sin usar TRY...CATCH

Imagina que tienes un proceso donde necesitas validar datos antes de ejecutarlo. 
Si la validación falla, puedes usar GOTO para saltar directamente a una parte del código que maneja el error.


*/

DECLARE @Edad INT = 15

IF @Edad < 18
    GOTO ERROR_MENOR_EDAD

PRINT 'El usuario es mayor de edad, puede continuar con el proceso'
GOTO FIN

ERROR_MENOR_EDAD:
    PRINT 'Error: El usuario es menor de edad. No puede continuar'

FIN:
    PRINT 'Proceso finalizado'

/*
Explicación:
1- Se declara una variable @Edad y se asigna el valor 15.
2- Si @Edad es menor de 18, se salta directamente a la etiqueta ERROR_MENOR_EDAD.
3- Si la edad es mayor o igual a 18, se imprime un mensaje de éxito y se salta a FIN.
4- En ERROR_MENOR_EDAD, se imprime un mensaje de error.
5- En FIN, se imprime que el proceso ha terminado.
*/

--Salida Esperada :

/*
Error: El usuario es menor de edad. No puede continuar
Proceso finalizado

Este uso de GOTO es útil cuando necesitas un control de flujo rápido y simple, 
pero en la mayoría de los casos, TRY...CATCH es una mejor alternativa para manejar errores de manera estructurada. 🚀
*/