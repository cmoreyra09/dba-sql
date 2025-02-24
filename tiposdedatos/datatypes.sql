/*

	Tipos de Datos :

	Los tipos de datos son una parte fundamental para definir la naturaleza de la informacion que puede almacenarse en una base de datos. Estos Tipos de datos permiten a SQL server
	gestionar y almacenar datos de manera eficiente, garantizando la integridad y exactitud de la informacion.


	Un tipo de datos define que tipo de valor puede conteneder una columna: datos enteros, datos de caracteres, datos monetarios, datos de fecha y hora, cadena binaria, etc.

	Se requiere que cada columna en una tabla de base de datos tenga un nombre y un tipo de datos.

	Un desarrollador de SQL debe decidir que tipo de datos se almacenaran dentro de cada columna al crear una tabla. El tipo de datos es una guia para que SQL entienda que tipo de datos
	se espera dentro de cada columna y tambien identifica como SQL interactua con los datos almacenados.

	Cada tipo de dato tiene su propio uso y caracteristicas especificas y la eleccion del tipo de datos adecuado es crucial para optimizar el rendimiento y la integridad de la bases de datos.


*/



-- (1) Valores Numericos Exactos , Estos valores numericos se dividen en 4: 

/*
    (A) Numericos Exactos Entero:
	-----------------------------

	tinyint :
		Intervalo : De 0 a 255
		Ocupacion de almancenamiento : 1 byte


	smallint :
		Intervalo : De 0 a 255
		Ocupacion de almancenamiento : 1 byte

	int :
		Intervalo : De -2.147.483.648 a 2.147.483.647
		Storage : 4 Bytes

	bigint :
		Storage : 8 Bytes


	(B) Numericos Exactos Decimal
	-----------------------------

	decimal (p,s) / numeric (p,s) : 
		p (precision) : Precision , el numero total maximo de digitos decimales que se almacenaran.
		s (escala)	  : El numero de digitos decimales que se almacenaran a la derecha del separador decimal.

	
	Ambos tienen las misma expresion de intervalo

	Precision 			   Almacenamiento 
	  1 - 9 				 (5 Bytes)
	 10 - 19 				 (9 Bytes)
	 20 - 28 				 (13 Bytes)
	 29 - 38 				 (17 Bytes)

	
	Estos Tipos  de datos son identicos, solo que tienen nombres diferentes,

	(C) Numericos Exactos Logico
	-----------------------------
	
	bit 	= 

		Solo tiene datos como 1 o 0

	Bit en disco : 1
	

	(D) Numericos Exactos Moneda
	-----------------------------

	smallmoney :
		Storage : 4 Bytes

	
	money 		:
		Storage : 8 Bytes

	
	Ambos tipos de datos manejan dinero .

	Decimales vs Moneda

	-- Decimal se utiliza porque unicamente se permite manejar valores decimales de solo 4 digitos.Al realizar operaciones con tipo de moneda no tiene una precision exacta.
	Entonces es mejor utiliza decimals


*/




/*

	(2) Valores Numericos Aproximados
	
	Tipos de datos que almacenan numeros de tipos flotantes es mas que todos aproximados y no exactos, esto se utiliza cuando se esta trabajando con calculos que involucren numeros racionales.


	float(n):

	Storage : 4 Bytes (n = 1 - 24,7 digitos)
			  8 Bytes (n = 25 - 53,15 digitos)

	
	Real :
		Storage: 4 Bytes

	
	Decimales vs Numeros Aproximados :

	Numeros aproximados, solo se aproxima extremadamente al valor, de preferencia es usar decimal
	



*/


/* 
	
	(3) Cadenas de Caracteres


	char (n) = character :
		
		valor n = 1 hasta 8000
		storage = n Bytes

	
	varchar(n):

		valor n : 1 hasta 8000
		storage : n + 2 Bytes


*/


/*
	 (4) Cadenas de Caracteres Unicode

	Para almacenar datos de tipo caractores, unicode nos permite almacenar caracteres con distintos idiomas.

	nchar(n):

		Longitud Fija

		Storage : n * 2 Bytes


	nvarchar(n) :
	
		Longitud Variable

		Storage : n*2 + 2 Bytes

*/


/*
	(5) Fecha y Hora


	Solo para almacenar tipos de datos fechas

	time : 
	
		Formato : hh:mm:ss [.nnn]
		storage : 5 Bytes

	date :

		Formato : yyyy-MM-dd
		storage : 3 Bytes

	smalldatetime : 

		Formato : yyyy-MM-dd hh:mm:ss
		storage : 4 Bytes


	datetime 	  :

		Formato : yyyy-MM-dd hh:mm:ss[.nnn]
		Storage : 8 Bytes

	datetime2	  ;

		Formato : yyyy-MM-dd hh:mm:ss[.nnn]
		storage : 6/7/8 Bytes

	datetimeOfffset ...


*/




/*

	-- (6) Cadenas Binarias


	Para este tipo de datos, se utiliza para almacenar datos en formatos binarios como imagenes, documentos y otros tipos de archivos binarios, las cadenas binarias permiten almacenar datos que no necesariamente son texto.

	binary (n):
		valor n : 1 hasta 8000
		storage : n Bytes

	varbinary (n / max):

		valor n : 1 hasta 8000
		storage : n + 2 Bytes

	image ...




*/

/*

	-- (7) Otros Tipos de Datos


	cursor : Para recorrer registros y resultados de una consulta .

	geography : Para almacenar datos espaciales como coordenadas , longitud latitud

	geometry  : Para almacenar datos espaciales planares en un sistema de cordenadas oclideo.

	hierarchyid : Para representar la posicion de una jerarquia de un largo

	json 		: Es el tipo de datos json nativo en un formato binario nativo.

	rowversion 	: Es para identifacar las filas de unas tablas

	sql_variant : para almacenar valores de varios tipos de datos admitidos en sql server

	table 		: Para almacenar temporalmente un conjunto filas y devolver el resultados con valores de tablas.

	uniqueidentifier 	: Para almacenar identificadores unicos globales 

	xml 				: Para almacenar datos en xml


	collate (collation ) :

		Represnta la nomenclatura de simbolos , es decir la propiedad de la base de datos que proporciona la distincion entre caracteres como acentos, mayusculas
		minusculas , otros caracteres soportados y reglas de ordenacion para los datos que la base de datos es capaz de manejar.

		collate especificara a la base de datos tanto los patrones de bits que representan cada caracter contenido en el juego de caracteres vinculados a una region
		como las reglas de comparacion u ordenacion de datos .

		Ñ = No se encuentra presente en la lengua inglesa





*/