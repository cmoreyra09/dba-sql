/*

    Funciones del Sistema

    Funciones Escalares:

        Las funciones escalares son las mas parecidas a las funciones que se utilizan dentro de los lenguajes
        de programacion.


    Las mayores de las funciones son deterministas es decir
    Devuelven siempre el mismo resultado cada ves que se llama con un conjunto especifico de valores de entrada



    
*/

-- Ejemplo


LOG10(100) -- Siempre dara resultado 2

YEAR('01-01-2024') -- Siempre dara 2024

MONTH('01-01-2024') -- Siempre dara 1

SQRT(100) -- Siempre dara 10

POWER(5,2) -- Siempre va dar 25

LEFT('Base de datos',4) -- Siempre nos dara Base




/*

Funciones no deterministas

La cual nos devuelven diferentes resultados cada ves que se les llamada con un conjunto especifico de valores de entrada. Incluso si el estado de la base de datos al que accede
sigue siendo el mismo

*/ 

-- Ejemplo


GETDATE() -- Nos devuelven un estado diferente porque , el dia que se corre determinar el resultado.
CURRENT_TIMESTAMP()
NEWID()
NEWSEQUENTIALID()



/*


Entonces las funciones escalares son aquellas funciones que toman 1 valor trasnforma los datos para corregir , modificar o complementar la informacion resultante y devuelven
un solo valor.

No estamos generando cambios reales sobre la tabla original solo la de salida.


*/