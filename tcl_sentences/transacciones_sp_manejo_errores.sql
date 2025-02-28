USE Northwind
GO



-- Insertar un cliente con control de errores
BEGIN TRY
    BEGIN TRANSACTION

    INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country)
    VALUES ('ZNDXT', 'INDITEX SA', 'Amancio', 'Owner', 'Av . Diputacion Edificio Inditex. N15142', 'Coruña', NULL, NULL, 'España');

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
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error al insertar cliente: ' + ERROR_MESSAGE();
END CATCH
GO



-- Actualizar el nombre de contacto de un cliente con control de errores
BEGIN TRY
    BEGIN TRANSACTION

    UPDATE Customers
    SET ContactName = 'Amancio Ortega'
    WHERE CustomerID = 'ZNDXT';

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
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error al actualizar cliente: ' + ERROR_MESSAGE();
END CATCH
GO




-- Eliminar un cliente con control de errores
BEGIN TRY
    BEGIN TRANSACTION

    DELETE FROM Customers
    WHERE CustomerID = 'ZNDXT';

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
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error al eliminar cliente: ' + ERROR_MESSAGE();
END CATCH
GO
