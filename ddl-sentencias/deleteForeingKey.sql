-- Usar la Base de Datos Escuela
USE Escuela
GO


/* 
    Para poder eliminar las restricciones foreing Key de la tabla Alumnos y luego eliminar la tabla Alumnos
    Nota : Tener en cuenta las tablas que se han eliminado.


    Normalmente esto se utiliza para cuando se elimina las tablas por completo , existe restricciones de foreing key
    por ello se debe de quitar esa restriccion antes de eliminarla.

*/

-- Eliminar la Tabla Tutores
DROP TABLE Parentescos
GO


-- Eliminar la Restricci�n Foreign Key de la Tabla Tutores
ALTER TABLE Tutores
DROP CONSTRAINT FK_Tutores_Parentescos
GO


-- Volver a eliminar la Tabla Tutores
DROP TABLE Parentescos
GO


/*
 Ejercicio
 Eliminar las Restricciones Foreign Key de la Tabla Alumnos
 y luego eliminar la Tabla Alumnos.
 Nota: Ten en cuenta las Tablas que se han eliminado.
*/
-- Eliminar la Restricci�n con la Tabla Alumnos_Tutores
ALTER TABLE Alumnos_Tutores
DROP CONSTRAINT FK_Alumnos_Tutores_Alumnos
GO


-- Eliminar la Tabla Alumnos
DROP TABLE Alumnos
GO