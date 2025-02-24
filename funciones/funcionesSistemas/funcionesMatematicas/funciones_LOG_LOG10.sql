

/*

    LOG : 

        Devuelve el logaritmo natural de la expresion float especificada en SQL server

    LOG10 :

        Devuelve el logaritmo en base 10 de la expresion float especificada.


*/


-- Podemos estar ubicados en cualquier Base de Datos


-- Funcion LOG
PRINT LOG(10);

PRINT LOG(10.8);

PRINT LOG(50,3);

PRINT LOG(100,10);
GO


-- Funcion LOG10
PRINT LOG10(5);

PRINT LOG10(10);

PRINT LOG10(100)

PRINT LOG10(1000)
GO