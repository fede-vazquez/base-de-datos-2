select * from Alumno;
GO
-- Hacer un stored procedure que haga lo siguiente
-- Crear un xml de todos los registros.

CREATE PROCEDURE sp_GenerarXMLDesdeTabla
    @NombreTabla NVARCHAR(128)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SQL NVARCHAR(MAX);

    -- Validamos si la tabla existe
    IF NOT EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_NAME = @NombreTabla
    )
    BEGIN
        RAISERROR('La tabla especificada no existe.', 16, 1);
        RETURN;
    END

    -- Generamos el SQL dinámico para extraer los datos en formato XML
    SET @SQL = '
    SELECT *
    FROM ' + QUOTENAME(@NombreTabla) + '
    FOR XML AUTO, ELEMENTS, ROOT(''Registros'')';

    -- Ejecutamos el SQL dinámico
    EXEC sp_executesql @SQL;
END;

exec sp_GenerarXMLDesdeTabla 'Asignatura';
GO
-- Lo mismo, pero para JSON

select * from Correlativas;