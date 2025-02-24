-- Podemos estar ubicados en cualquier Base de Datos


-- Ejercicio 1
/*
Realizar un script que calcule el area y el Perimetro de un Circulo, teniendo en cuenta que: 
La formula del area es: Pi por Radio al cuadrado y
La formula del Perimetro es: 2 por Pi por Radio
El radio nosotros debemos de asignarle un valor.
*/


BEGIN
	DECLARE @radio DECIMAL(7,2) = 10
	DECLARE @area DECIMAL(7,2), @perimetro DECIMAL(7,2)

	SET @area = PI() * POWER(@radio, 2)
	SET @perimetro = 2 * PI() * @radio

	PRINT('El �rea del circulo es: ')
	PRINT(@area)
	PRINT('--------------------------')
	PRINT('El per�metro del circulo es: ')
	PRINT(@perimetro)
END
GO



-- Ejercicio 2
/*
Realizar un script que calcule el Volumen de un Cilindro, teniendo en cuenta que: 
La formula del Volumen es: Pi por Radio al cuadrado por la altura
El radio y la altura nosotros debemos de asignarle un valor.
*/
BEGIN
	DECLARE @radio DECIMAL(7,2) = 5
	DECLARE @altura DECIMAL(7,2) = 10
	DECLARE @volumen DECIMAL(7,2)

	SET @volumen = PI() * POWER(@radio, 2) * @altura

	PRINT('El volumen del cilindro es: ')
	PRINT(@volumen)
	
END
GO



-- Ejercicio 3
/*
Realizar un script que calcule la Distancia entre dos puntos de coordenadas, teniendo en cuenta que: 
La formula para calcular la distancia es:
Raiz Cuadrada de x2 - x1 al cuadrado + y2 - y1 al cuadrado
los puntos de coordenada X y Y nosotros le debemos asignar.
*/


BEGIN
	DECLARE @x1 DECIMAL(7,2) = 10
	DECLARE @y1 DECIMAL(7,2) = 5
	DECLARE @x2 DECIMAL(7,2) = 20
	DECLARE @y2 DECIMAL(7,2) = 10
	DECLARE @distancia DECIMAL(7,2)

	SET @distancia = SQRT( POWER((@x2 - @x1), 2) + POWER( (@y2 - @y1), 2 ) )

	PRINT('La distancia entre los dos puntos de coordenada es: ')
	PRINT(@distancia)
	
END
GO