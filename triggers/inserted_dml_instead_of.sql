-- Ubicarse en la Base de Datos MundoCineXYZ
USE MundoCineXYZ
GO




-- Insertar registro en la Tabla Cargos
INSERT INTO Cargos(cargoID, tipo, descripcion)
			VALUES(1, 'Cajero', 'Encargado de la venta de Ticket'),
				  (2, 'Encargado de Proyecci�n', NULL),
				  (3, 'Limpieza', 'Encargado de limpiar la sala de cine'),
				  (4, 'Supervisor', NULL)
GO

-- Consultar la Tabla Cargos
SELECT * FROM Cargos
GO




-- Insertar registro en la Tabla Empleados
INSERT INTO Empleados(empleadoID, cargoID, nombre, paterno, materno, 
					  salario, fechaContratacion, fechaNacimiento)
VALUES(1, 4, 'Juan', 'P�rez', 'Gonz�lez', 4000, '2020-01-01', '2020-04-04'),
	  (2, 1, 'Martha', 'Garc�a', 'Rodr�guez', 3500, '2022-08-01', '2000-05-17'),
	  (3, 1, 'Carlos', 'Ram�rez', 'Hern�ndez', 3000, '2023-06-06', '1998-07-15'),
	  (4, 2, 'Ana', 'Mart�nez', 'L�pez', 3000, '2021-09-01', '2000-04-08'),
	  (5, 2, 'Luis', 'Fern�ndez', 'S�nchez', 3300, '2018-12-01', '1997-02-02'),
	  (6, 2, 'Sof�a', 'Torres', 'Morales', 3400, '2015-10-10', '1996-11-11'),
	  (7, 3, 'Jos�', 'Rivera', 'Castillo', 2800, '2019-12-12', '1998-07-14'),
	  (8, 3, 'Laura', 'Ortiz', 'G�mez', 3000, '2019-03-12', '2000-08-10'),
	  (9, 3, 'Daniel', 'Ch�vez', 'M�ndez', 2500, '2021-06-12', '2000-03-01'),
	  (10, 3, 'Valeria', 'Flores', 'Romero', 3000, '2018-06-07', '1997-08-08')
GO

-- Consultar la Tabla Empleados
SELECT * FROM Empleados
GO




-- Insertar registro en la Tabla Salas
INSERT INTO Salas(salaID, numero, capacidad, tipo)
		   VALUES(1, 'SALA 1', 100, '2D'),
			     (2, 'SALA 2', 120, '3D'),
				 (3, 'SALA 3', 150, '2D'),
				 (4, 'SALA 4', 200, '3D')
GO

-- Consultar la Tabla Salas
SELECT * FROM Salas
GO




-- Insertar registro en la Tabla Salas_Empleados
INSERT INTO Salas_Empleados(empleadoID, salaID)
					 VALUES(4, 1), (7, 1),
						   (5, 2), (8, 2),
						   (6, 3), (9, 3),
						   (4, 4), (10, 4)
GO

-- Consultar la Tabla Salas_Empleados
SELECT * FROM Salas_Empleados
GO




-- Insertar registro en la Tabla Asientos
INSERT INTO Asientos(asientoID, salaID, asiento)
VALUES(1, 1, 'A1'), (2, 1, 'A2'), (3, 1, 'A3'), (4, 1, 'A4'), (5, 1, 'A5'),
	  (6, 1, 'A6'), (7, 1, 'A7'), (8, 1, 'A8'), (9, 1, 'A9'), (10, 1, 'A10'),
	  (11, 1, 'B1'), (12, 1, 'B2'), (13, 1, 'B3'), (14, 1, 'B4'), (15, 1, 'B5'),
	  (16, 1, 'B6'), (17, 1, 'B7'), (18, 1, 'B8'), (19, 1, 'B9'), (20, 1, 'B10'),
	  (21, 2, 'A1'), (22, 2, 'A2'), (23, 2, 'A3'), (24, 2, 'A4'), (25, 2, 'A5'),
	  (26, 2, 'A6'), (27, 2, 'A7'), (28, 2, 'A8'), (29, 2, 'A9'), (30, 2, 'A10'),
	  (31, 2, 'B1'), (32, 2, 'B2'), (33, 2, 'B3'), (34, 2, 'B4'), (35, 2, 'B5'),
	  (36, 2, 'B6'), (37, 2, 'B7'), (38, 2, 'B8'), (39, 2, 'B9'), (40, 2, 'B10'),
	  (41, 3, 'A1'), (42, 3, 'A2'), (43, 3, 'A3'), (44, 3, 'A4'), (45, 3, 'A5'),
	  (46, 3, 'A6'), (47, 3, 'A7'), (48, 3, 'A8'), (49, 3, 'A9'), (50, 3, 'A10'),
	  (51, 3, 'B1'), (52, 3, 'B2'), (53, 3, 'B3'), (54, 3, 'B4'), (55, 3, 'B5'),
	  (56, 3, 'B6'), (57, 3, 'B7'), (58, 3, 'B8'), (59, 3, 'B9'), (60, 3, 'B10'),
	  (61, 4, 'A1'), (62, 4, 'A2'), (63, 4, 'A3'), (64, 4, 'A4'), (65, 4, 'A5'),
	  (66, 4, 'A6'), (67, 4, 'A7'), (68, 4, 'A8'), (69, 4, 'A9'), (70, 4, 'A10'),
	  (71, 4, 'B1'), (72, 4, 'B2'), (73, 4, 'B3'), (74, 4, 'B4'), (75, 4, 'B5'),
	  (76, 4, 'B6'), (77, 4, 'B7'), (78, 4, 'B8'), (79, 4, 'B9'), (80, 4, 'B10')
GO

-- Consultar la Tabla Asientos
SELECT * FROM Asientos
GO




-- Insertar registro en la Tabla Generos
INSERT INTO Generos(generoID, nombre)
VALUES(101, 'Aventura'), (102, 'Fantas�a'), (103, 'Drama'),
      (104, 'Horror'), (105, 'Acci�n'), (106, 'Comedia'),
	  (107, 'Historia'), (108, 'Suspenso'), (109, 'Crimen'),
	  (110, 'Misterio'), (111, 'M�sica'), (112, 'Romance'),
	  (113, 'Familia'), (114, 'Guerra'), (115, 'Ciencia ficci�n')
GO

-- Consultar la Tabla Generos
SELECT * FROM Generos
GO




-- Insertar registro en la Tabla Peliculas
INSERT INTO Peliculas(peliculaID, titulo, descripcion, eslogan, fechaLanzamiento, tiempoDuracion, estado)
VALUES
(1, 'El �ltimo Refugio', 'En un futuro dist�pico, un grupo de supervivientes lucha por encontrar un lugar seguro.', 'La esperanza es lo �ltimo que se pierde.', '2024-02-14', 130, 0),
(2, 'Horizonte Perdido', 'Una expedici�n descubre un mundo oculto bajo el oc�ano.', 'M�s all� del horizonte, comienza la aventura.', '2024-03-01', 145, 0),
(3, 'Memorias del Futuro', 'Un cient�fico desarrolla una m�quina que permite ver recuerdos del futuro.', 'El futuro est� escrito en nuestras mentes.', '2024-04-12', 128, 0),
(4, 'El Enigma de la Estrella Roja', 'Un equipo de astronautas descubre un misterio en Marte que podr�a cambiar la humanidad.', 'El descubrimiento es solo el principio.', '2024-05-24', 137, 0),
(5, 'Cazadores del Tiempo', 'Un grupo de arque�logos viaja al pasado para recuperar artefactos perdidos.', 'El pasado est� al alcance de tu mano.', '2024-06-07', 122, 0),
(6, 'El C�digo Omega', 'Un hacker descubre un c�digo que puede controlar el mundo.', 'El poder absoluto en las manos equivocadas.', '2024-07-19', 118, 0),
(7, 'Sombras en la Ciudad', 'Un detective investiga una serie de desapariciones en una ciudad donde nunca sale el sol.', 'En la oscuridad, todos los secretos son revelados.', '2024-08-02', 110, 0),
(8, 'Sue�os Artificiales', 'Un hombre se enamora de una inteligencia artificial en un mundo donde la realidad y la fantas�a se mezclan.', 'El amor no conoce l�mites.', CAST(GETDATE() AS DATE), 132, 1),
(9, 'El Legado de los Inmortales', 'Una sociedad secreta de inmortales lucha por el control del destino de la humanidad.', 'La eternidad tiene un precio.', '2024-10-25', 140, 0),
(10, 'La �ltima Frontera', 'Una nave espacial en una misi�n desesperada para encontrar un nuevo hogar para la humanidad.', 'El futuro de la humanidad est� en sus manos.', CAST(GETDATE() AS DATE), 150, 1),
(11, 'Reflejos del Pasado', 'Una mujer descubre que puede comunicarse con su yo del pasado a trav�s de los espejos.', 'Lo que ves no siempre es lo que parece.', '2024-01-05', 119, 0),
(12, 'El Rescate Imposible', 'Un equipo de �lite intenta rescatar a cient�ficos atrapados en una base bajo el hielo.', 'No hay misi�n imposible.', '2024-03-22', 125, 0),
(13, 'Almas Perdidas', 'Un sacerdote y un m�dium unen fuerzas para combatir una amenaza sobrenatural.', 'El mal siempre encuentra una manera de regresar.', '2024-04-19', 114, 0),
(14, 'La Ciudad Invisible', 'Un grupo de amigos descubre una ciudad escondida en las monta�as que no aparece en ning�n mapa.', 'Algunas ciudades no est�n destinadas a ser encontradas.', '2024-05-03', 108, 0),
(15, 'Ecos del Silencio', 'Una periodista investiga un caso de desaparici�n que la lleva a descubrir una verdad inquietante.', 'El silencio tiene su propio lenguaje.', '2024-06-14', 116, 0),
(16, 'M�s All� del Velo', 'Una mujer que ha perdido a su hija comienza a ver visiones de ella en un mundo paralelo.', 'El amor traspasa todas las fronteras.', '2024-07-26', 121, 0),
(17, 'El Juicio Final', 'Un abogado debe defender a un hombre acusado de cr�menes que a�n no ha cometido.', 'La justicia est� en el futuro.', CAST(GETDATE() AS DATE), 126, 1),
(18, 'La Resistencia Oculta', 'En un mundo controlado por corporaciones, un grupo de rebeldes lucha por la libertad.', 'El esp�ritu humano nunca ser� domado.', '2024-09-27', 135, 0),
(19, 'Las Cr�nicas de Tit�n', 'Un grupo de exploradores coloniza una luna lejana, enfrentando desaf�os inesperados.', 'La aventura est� m�s all� de las estrellas.', '2024-10-18', 142, 0),
(20, 'El Susurro del Bosque', 'Una familia se muda a una caba�a en un bosque encantado lleno de secretos antiguos.', 'Los �rboles guardan historias antiguas.', '2024-11-29', 111, 0),
(21, 'Sin Retorno', 'Un hombre despierta en un mundo donde todos sus seres queridos han desaparecido.', 'En la b�squeda de la verdad, a veces no hay regreso.', '2024-01-26', 117, 0),
(22, 'El Portal Oculto', 'Un joven descubre un portal que lo transporta a diferentes �pocas y dimensiones.', 'Cada puerta oculta un nuevo mundo.', '2024-03-08', 124, 0),
(23, 'El �ltimo Guerrero', 'En un mundo post-apocal�ptico, el �ltimo guerrero lucha por restaurar la civilizaci�n.', 'La esperanza es la �ltima arma.', '2024-04-05', 138, 0),
(24, 'El Ojo de la Tormenta', 'Un piloto debe enfrentar sus miedos y una tormenta sobrenatural para salvar a su tripulaci�n.', 'En la tormenta, el miedo es el enemigo.', '2024-06-21', 127, 0),
(25, 'Las Sombras del Ayer', 'Un historiador descubre un complot que ha sido ocultado durante siglos.', 'El pasado nunca muere.', '2024-07-12', 109, 0),
(26, 'El Guardi�n del Tiempo', 'Un relojero se convierte en el guardi�n del tiempo cuando descubre un reloj que puede detener el mundo.', 'El tiempo est� en sus manos.', CAST(GETDATE() AS DATE), 115, 1),
(27, 'El Despertar de los Dragones', 'En un mundo de fantas�a, los dragones despiertan para reclamar su dominio.', 'El fuego regresa para purificar.', '2024-09-05', 131, 0),
(28, 'La Guerra de los Sue�os', 'Dos facciones luchan por el control de los sue�os en un mundo donde los sue�os pueden ser mortales.', 'El poder de los sue�os es infinito.', '2024-10-11', 120, 0),
(29, 'La Maldici�n del Faro', 'Un grupo de investigadores desentra�a los misterios de un faro abandonado donde ocurrieron hechos macabros.', 'Algunas luces nunca deben encenderse.', '2024-11-15', 103, 0),
(30, 'El �ltimo Deseo', 'Una mujer recibe la oportunidad de cumplir un �ltimo deseo antes de que se acabe el tiempo.', '�Qu� har�as si te quedara un solo deseo?', CAST(GETDATE() AS DATE), 113, 1),
(31, 'El Origen', 'Un thriller que desaf�a la mente sobre sue�os dentro de sue�os.', 'Tu mente es el escenario del crimen.', '2010-07-16', 148, 0),
(32, 'Matrix', 'Un hacker descubre que el mundo es una realidad simulada.', 'Libera tu mente.', '1999-03-31', 136, 0),
(33, 'El Laberinto del Fauno', 'Una ni�a se escapa a un mundo de fantas�a en medio de la Guerra Civil Espa�ola.', 'Inocencia ha sido perdida.', '2006-10-11', 118, 0),
(34, 'Amores Perros', 'Tres historias entrelazadas que exploran la brutalidad de la vida en la Ciudad de M�xico.', 'Todo est� conectado.', '2000-05-19', 154, 0),
(35, 'La Vida es Bella', 'Un padre utiliza su imaginaci�n para proteger a su hijo de los horrores de un campo de concentraci�n.', 'La vida es hermosa en medio del horror.', '1997-12-20', 116, 0),
(36, 'Roma', 'Una mirada �ntima a la vida de una empleada dom�stica en la Ciudad de M�xico en los a�os 70.', 'Una historia universal.', '2018-11-21', 135, 0),
(37, 'El Secreto de sus Ojos', 'Un antiguo investigador revisita un caso de asesinato que lo obsesiona.', 'La justicia no es ciega.', '2009-08-13', 129, 0),
(38, 'El Hijo de la Novia', 'Un hombre reconsidera su vida tras un infarto mientras su madre padece Alzheimer.', 'Nunca es tarde para cambiar.', CAST(GETDATE() AS DATE), 124, 1),
(39, 'Relatos Salvajes', 'Seis historias que muestran lo que sucede cuando las personas son empujadas al l�mite.', 'Todos tenemos un l�mite.', '2014-08-21', 122, 0),
(40, 'El Espinazo del Diablo', 'Un orfanato en la Guerra Civil Espa�ola esconde un oscuro secreto.', 'Lo que ves no es lo �nico que existe.', '2001-04-20', 108, 0),
(41, 'Mar Adentro', 'La lucha de un hombre por su derecho a morir con dignidad.', 'La vida es un derecho, no una obligaci�n.', '2004-09-03', 126, 0),
(42, 'Todo Sobre mi Madre', 'Una mujer busca al padre de su hijo fallecido en el mundo del teatro y la transgeneridad.', 'Un homenaje al amor materno.', '1999-04-16', 101, 0),
(43, 'La Lengua de las Mariposas', 'Un ni�o y su maestro experimentan las tensiones de la Guerra Civil Espa�ola.', 'La educaci�n como resistencia.', '1999-01-24', 96, 0),
(44, 'Volver', 'Una mujer regresa a su pueblo natal y enfrenta el pasado y los secretos familiares.', 'El pasado siempre vuelve.', '2006-03-17', 121, 0),
(45, 'Tesis', 'Una estudiante de cine descubre una red de snuff movies mientras investiga para su tesis.', 'La curiosidad puede ser mortal.', '1996-04-12', 125, 0),
(46, 'El Laberinto del Fauno', 'Una ni�a escapa a un mundo de fantas�a en medio de la Guerra Civil Espa�ola.', 'Inocencia perdida en tiempos oscuros.', '2006-10-11', 118, 0),
(47, 'La Comunidad', 'Una agente inmobiliaria encuentra una fortuna oculta en un apartamento y desata una lucha por el dinero.', 'El dinero puede ser la ra�z del mal.', '2000-09-29', 106, 0),
(48, 'Celda 211', 'Un funcionario de prisiones se encuentra atrapado en un mot�n y debe fingir ser un prisionero.', 'En la celda, todos somos iguales.', '2009-11-06', 113, 0),
(49, 'Abre los Ojos', 'Un hombre con desfiguraci�n facial tiene problemas para distinguir entre sue�o y realidad.', 'Despierta a la verdad.', '1997-12-19', 117, 0),
(50, 'La Isla M�nima', 'Dos detectives investigan una serie de desapariciones en un remoto pueblo durante la transici�n espa�ola.', 'En el silencio del campo, nadie te oye gritar.', '2014-09-26', 105, 0),
(51, 'El Hombre de las Mil Caras', 'La historia del estafador Francisco Paesa y su implicaci�n en uno de los mayores esc�ndalos de Espa�a.', 'El arte de la mentira.', CAST(GETDATE() AS DATE), 123, 1),
(52, 'Los Otros', 'Una mujer vive con sus hijos en una mansi�n oscura donde suceden cosas inexplicables.', 'No todos los fantasmas son visibles.', '2001-08-02', 101, 0),
(53, 'Balada Triste de Trompeta', 'La rivalidad entre dos payasos de un circo en la Espa�a franquista.', 'El circo de la guerra.', '2010-12-17', 107, 0),
(54, 'El Bola', 'La amistad entre dos ni�os revela los abusos que uno de ellos sufre en su hogar.', 'El silencio no protege a nadie.', '2000-11-10', 88, 0),
(55, 'El D�a de la Bestia', 'Un cura intenta evitar el nacimiento del Anticristo en la noche de Navidad en Madrid.', 'El Apocalipsis ha llegado.', '1995-10-20', 99, 0),
(56, 'Camar�n: Flamenco y Revoluci�n', 'La vida y carrera de Camar�n de la Isla, una leyenda del flamenco.', 'El arte no tiene fronteras.', '2005-07-15', 119, 0),
(57, 'El Milagro de P. Tinto', 'Una exc�ntrica comedia sobre un hombre que espera un milagro para tener hijos.', 'La espera vale la pena.', '1998-09-25', 105, 0),
(58, 'Nadie Hablar� de Nosotras Cuando Hayamos Muerto', 'Una mujer que trabaj� para la mafia huye a Espa�a donde enfrenta su oscuro pasado.', 'El pasado siempre vuelve.', '1995-10-06', 104, 0),
(59, 'Los Lunes al Sol', 'Un grupo de desempleados en la Espa�a post-industrial busca sentido a su vida.', 'La dignidad no tiene precio.', '2002-09-27', 113, 0),
(60, 'El Cuerpo', 'El cad�ver de una mujer desaparece misteriosamente de la morgue, desencadenando una investigaci�n llena de secretos.', 'Algunos cuerpos nunca descansan.', '2012-10-04', 108, 0);
GO

-- Consultar la Tabla Peliculas
SELECT * FROM Peliculas
ORDER BY estado DESC, fechaLanzamiento DESC
GO




-- Insertar registro en la Tabla Peliculas
INSERT INTO Generos_Peliculas(peliculaID, generoID)
VALUES(1, 115), (2, 101), (3, 115), (4, 115), (5, 101),
	  (6, 109), (7, 108), (8, 102), (8, 115), (9, 102),
	  (10, 115), (11, 107), (11, 110), (12, 105), (13, 104),
	  (14, 101), (14, 102), (15, 104), (15, 110), (16, 103),
	  (16, 102), (17, 103), (17, 110), (18, 115), (18, 105),
	  (19, 115), (19, 101), (20, 104), (20, 110), (21, 107),
	  (21, 110), (22, 101), (22, 102), (23, 115), (23, 105),
	  (24, 108), (25, 110), (25, 107), (26, 102), (26, 115),
	  (27, 102), (28, 102), (28, 115), (29, 104), (29, 110),
	  (30, 103), (30, 102), (31, 115), (31, 102), (32, 115),
	  (33, 102), (33, 103), (34, 103), (35, 103), (35, 106),
	  (36, 103), (37, 103), (37, 108), (38, 103), (38, 106),
	  (39, 106), (39, 109), (40, 104), (40, 103), (41, 103),
	  (42, 103), (43, 103), (44, 103), (44, 106), (45, 104),
	  (45, 108), (46, 102), (46, 103), (47, 106), (48, 105),
	  (49, 115), (50, 103), (51, 104), (51, 108), (52, 104),
	  (52, 110), (53, 106), (53, 103), (54, 103), (55, 106),
	  (55, 104), (56, 111), (56, 107), (57, 106), (58, 103),
	  (59, 103), (60, 110), (60, 104), (60, 108)
GO

-- Consultar la Tabla Generos_Peliculas
SELECT * FROM Generos_Peliculas
GO




-- Insertar registro en la Tabla Funciones
INSERT INTO Funciones(funcionID, peliculaID, salaID, fecha, hora)
			   VALUES(1, 8,   1, CAST(DATEADD(DAY, -2, GETDATE()) AS DATE), '15:00'),
					 (2, 10,  1, CAST(DATEADD(DAY, -2, GETDATE()) AS DATE), '17:45'),
					 (3, 17,  1, CAST(DATEADD(DAY, -2, GETDATE()) AS DATE), '20:30'),
					 (4, 26,  2, CAST(DATEADD(DAY, -2, GETDATE()) AS DATE), '15:00'),
					 (5, 30,  2, CAST(DATEADD(DAY, -2, GETDATE()) AS DATE), '17:45'),
					 (6, 38,  2, CAST(DATEADD(DAY, -2, GETDATE()) AS DATE), '20:30'),
					 (7, 51,  3, CAST(DATEADD(DAY, -2, GETDATE()) AS DATE), '15:00'),
					 (8, 8,   3, CAST(DATEADD(DAY, -2, GETDATE()) AS DATE), '17:45'),
					 (9, 10,  3, CAST(DATEADD(DAY, -2, GETDATE()) AS DATE), '20:30'),
					 (10, 17, 4, CAST(DATEADD(DAY, -2, GETDATE()) AS DATE), '15:00'),
					 (11, 26, 4, CAST(DATEADD(DAY, -2, GETDATE()) AS DATE), '17:45'),
					 (12, 30, 4, CAST(DATEADD(DAY, -2, GETDATE()) AS DATE), '20:30'),
					 (13, 8,  1, CAST(DATEADD(DAY, -1, GETDATE()) AS DATE), '15:00'),
					 (14, 10, 1, CAST(DATEADD(DAY, -1, GETDATE()) AS DATE), '17:45'),
					 (15, 17, 1, CAST(DATEADD(DAY, -1, GETDATE()) AS DATE), '20:30'),
					 (16, 26, 2, CAST(DATEADD(DAY, -1, GETDATE()) AS DATE), '15:00'),
					 (17, 30, 2, CAST(DATEADD(DAY, -1, GETDATE()) AS DATE), '17:45'),
					 (18, 38, 2, CAST(DATEADD(DAY, -1, GETDATE()) AS DATE), '20:30'),
					 (19, 51, 3, CAST(DATEADD(DAY, -1, GETDATE()) AS DATE), '15:00'),
					 (20, 8,  3, CAST(DATEADD(DAY, -1, GETDATE()) AS DATE), '17:45'),
					 (21, 10, 3, CAST(DATEADD(DAY, -1, GETDATE()) AS DATE), '20:30'),
					 (22, 17, 4, CAST(DATEADD(DAY, -1, GETDATE()) AS DATE), '15:00'),
					 (23, 26, 4, CAST(DATEADD(DAY, -1, GETDATE()) AS DATE), '17:45'),
					 (24, 30, 4, CAST(DATEADD(DAY, -1, GETDATE()) AS DATE), '20:30'),
					 (25, 8,  1, CAST(GETDATE() AS DATE), '15:00'),
					 (26, 10, 1, CAST(GETDATE() AS DATE), '17:45'),
					 (27, 17, 1, CAST(GETDATE() AS DATE), '20:30'),
					 (28, 26, 2, CAST(GETDATE() AS DATE), '15:00'),
					 (29, 30, 2, CAST(GETDATE() AS DATE), '17:45'),
					 (30, 38, 2, CAST(GETDATE() AS DATE), '20:30'),
					 (31, 51, 3, CAST(GETDATE() AS DATE), '15:00'),
					 (32, 8,  3, CAST(GETDATE() AS DATE), '17:45'),
					 (33, 10, 3, CAST(GETDATE() AS DATE), '20:30'),
					 (34, 17, 4, CAST(GETDATE() AS DATE), '15:00'),
					 (35, 26, 4, CAST(GETDATE() AS DATE), '17:45'),
					 (36, 30, 4, CAST(GETDATE() AS DATE), '20:30')
GO

-- Consultar la Tabla Funciones
SELECT * FROM Funciones
GO




-- Insertar registro en la Tabla Promociones
INSERT INTO Promociones(promocionID, codigo, descuento, fechaInicio, horaInicio, fechaFin, horaFin)
VALUES(1, 'Ninguno', 0, '2000-01-01', '00:00', '2199-01-01', '23:59'),
	  (2, 'DSCTO', 10, CAST(GETDATE() AS DATE), '00:00', CAST(GETDATE() AS DATE), '23:59'),
	  (3, 'CINE', 12, CAST(DATEADD(DAY, +7, GETDATE()) AS DATE), '00:00', 
					  CAST(DATEADD(DAY, +9, GETDATE()) AS DATE), '23:59')
GO

-- Consultar la Tabla Promociones
SELECT * FROM Promociones
GO




-- Crear el Trigger DML TG_Entrada
CREATE OR ALTER TRIGGER TG_Entrada
ON Entradas
AFTER INSERT
AS
	SET NOCOUNT ON;

	DECLARE @entradaID	INT
	DECLARE @desct		DECIMAL(10, 2)
	DECLARE @total		DECIMAL(10, 2)

	SET @entradaID = (SELECT entradaID FROM inserted);

	SET @desct = (SELECT P.descuento 
				  FROM inserted AS I INNER JOIN Promociones AS P
				  ON I.promocionID = P.promocionID);
	SET @total = (SELECT precio - @desct FROM inserted);


	UPDATE	Entradas
	SET		total = @total
	WHERE	entradaID = @entradaID

GO




-- Crear el Procedimiento Almacenado para Insertar Entradas
CREATE OR ALTER PROCEDURE SP_InsertarEntrada
(
	@empleadoID		INT,
	@promocionID	INT,
	@funcionID		INT,
	@asientoID		INT
)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Entradas(empleadoID, promocionID, funcionID)
				  VALUES(@empleadoID, @promocionID, @funcionID);


	DECLARE @maxEntradaID	INT
	SET @maxEntradaID = ( SELECT MAX(entradaID) FROM Entradas );

	INSERT INTO Reservas(entradaID, asientoID)
				  VALUES(@maxEntradaID, @asientoID);

END
GO


-- Insertar registro en la Tabla Entradas y Reservas
EXECUTE SP_InsertarEntrada 2, 1, 28, 25
GO


-- Consultar las Tablas Entradas y Reservas
SELECT * FROM Entradas;
SELECT * FROM Reservas;
GO




-- Insertar mas registros en la Tabla Entradas y Reservas
EXECUTE SP_InsertarEntrada 2, 1, 28, 26;
GO

EXECUTE SP_InsertarEntrada 3, 2, 30, 25;
GO

EXECUTE SP_InsertarEntrada 3, 2, 30, 26;
GO

EXECUTE SP_InsertarEntrada 3, 3, 34, 65;
GO

EXECUTE SP_InsertarEntrada 3, 3, 34, 66;
GO

EXECUTE SP_InsertarEntrada 3, 3, 34, 70;
GO

EXECUTE SP_InsertarEntrada 3, 3, 34, 71;
GO

EXECUTE SP_InsertarEntrada 3, 3, 34, 72;
GO

EXECUTE SP_InsertarEntrada 2, 2, 31, 41;
GO

EXECUTE SP_InsertarEntrada 2, 2, 31, 55;
GO

EXECUTE SP_InsertarEntrada 2, 2, 31, 56;
GO

EXECUTE SP_InsertarEntrada 2, 1, 31, 59;
GO

EXECUTE SP_InsertarEntrada 2, 1, 31, 60;
GO

EXECUTE SP_InsertarEntrada 3, 2, 30, 31;
GO



-- Reporte de las entradas vendidas en el D�a de hoy
SELECT E.entradaID, E.precio, P.descuento, E.total, 
		Em.nombre, Em.paterno, Em.materno, C.tipo Cargo,
		Pe.titulo, Pe.tiempoDuracion, F.fecha, F.hora, 
		S.numero, S.capacidad, S.tipo, A.asiento, R.estado
FROM Entradas E JOIN Promociones P ON E.promocionID = P.promocionID
				JOIN Empleados Em ON EM.empleadoID = E.empleadoID
				JOIN Cargos C ON Em.cargoID = C.cargoID
				JOIN Funciones F ON E.funcionID = F.funcionID
				JOIN Peliculas Pe ON F.peliculaID = Pe.peliculaID
				JOIN Salas S ON F.salaID = S.salaID
				JOIN Asientos A ON A.salaID = S.salaID
				JOIN Reservas R ON (R.asientoID = A.asientoID AND
									R.entradaID = E.entradaID)
WHERE E.fechaCompra = CAST(GETDATE() AS DATE )
GO