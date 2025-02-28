USE Northwind
GO

-- 1. Procedimiento almacenado para insertar un cliente
CREATE OR ALTER PROCEDURE sp_insert_customer (
    @CustomerID NVARCHAR(5),
    @CompanyName NVARCHAR(40),
    @ContactName NVARCHAR(30),
    @ContactTitle NVARCHAR(30),
    @Address NVARCHAR(60),
    @City NVARCHAR(15),
    @Region NVARCHAR(15),
    @PostalCode NVARCHAR(10),
    @Country NVARCHAR(15)
)
AS
BEGIN
    BEGIN TRANSACTION

    INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country)
    VALUES (@CustomerID, @CompanyName, @ContactName, @ContactTitle, @Address, @City, @Region, @PostalCode, @Country);

    IF @@ROWCOUNT = 1
    BEGIN
        COMMIT TRANSACTION;
        PRINT 'Cliente insertado correctamente';
    END
    ELSE
    BEGIN
        ROLLBACK TRANSACTION;
        PRINT 'Error en la inserción';
    END
END
GO

-- 2. Procedimiento almacenado para actualizar el nombre de contacto de un cliente
CREATE OR ALTER PROCEDURE sp_update_customer_contact (
    @CustomerID NVARCHAR(5),
    @NewContactName NVARCHAR(30)
)
AS
BEGIN
    BEGIN TRANSACTION

    UPDATE Customers
    SET ContactName = @NewContactName
    WHERE CustomerID = @CustomerID;

    IF @@ROWCOUNT = 1
    BEGIN
        COMMIT TRANSACTION;
        PRINT 'Contacto actualizado correctamente';
    END
    ELSE
    BEGIN
        ROLLBACK TRANSACTION;
        PRINT 'No se encontró el cliente o no se realizaron cambios';
    END
END
GO

-- 3. Procedimiento almacenado para eliminar un cliente
CREATE OR ALTER PROCEDURE sp_delete_customer (
    @CustomerID NVARCHAR(5)
)
AS
BEGIN
    BEGIN TRANSACTION

    DELETE FROM Customers
    WHERE CustomerID = @CustomerID;

    IF @@ROWCOUNT = 1
    BEGIN
        COMMIT TRANSACTION;
        PRINT 'Cliente eliminado correctamente';
    END
    ELSE
    BEGIN
        ROLLBACK TRANSACTION;
        PRINT 'No se encontró el cliente o error en la eliminación';
    END
END
GO

-- 4. Ejemplo de ejecución de los SPs

-- Insertar un cliente
EXEC sp_insert_customer 'ZNDXT', 'INDITEX SA', 'Amancio', 'Owner', 'Av . Diputacion Edificio Inditex. N15142', 'Coruña', NULL, NULL, 'España';

-- Actualizar el contacto de un cliente
EXEC sp_update_customer_contact 'ZNDXT', 'Amancio Ortega';

-- Eliminar un cliente
EXEC sp_delete_customer 'ZNDXT';
