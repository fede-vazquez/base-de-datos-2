create procedure gencreatedelete
@tab varchar(128)
AS
BEGIN
    DECLARE @SQLTEXT NVARCHAR(1024)
    DECLARE @VALUES NVARCHAR(1024)
    DECLARE @WHERE NVARCHAR(1024)
	DECLARE @SQLCMD NVARCHAR(4000)
	DECLARE @DROPCMD NVARCHAR(4000)

	SET @DROPCMD = CONCAT('IF OBJECT_ID(', CHAR(39), 'D_', @tab, CHAR(39), ',', CHAR(39), 'P', CHAR(39) , ') IS NOT NULL', CHAR(13))
	SET @DROPCMD = CONCAT(@DROPCMD,'BEGIN', CHAR(13))
	SET @DROPCMD = CONCAT(@DROPCMD,CHAR(9),'DROP PROCEDURE D_', @tab, ';', CHAR(13))
	SET @DROPCMD = CONCAT(@DROPCMD,'END', CHAR(13))
	PRINT('Borrando Stored Procedure ' + 'D_' + @tab)
	EXEC(@DROPCMD)
	PRINT('Stored Procedure Borrada')

    SET @SQLCMD = CONCAT('CREATE PROCEDURE D_', @tab, CHAR(13))
    SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9), '@ID INTEGER', CHAR(13))
    SET @SQLCMD = CONCAT(@SQLCMD, 'AS', CHAR(13))
    SET @SQLCMD = CONCAT(@SQLCMD, 'BEGIN', CHAR(13))
    SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9),'BEGIN TRY', CHAR(13))
    SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9),CHAR(9),'DELETE FROM ',@tab, ' WHERE ID = @ID', CHAR(13))
    SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9),'END TRY', CHAR(13))
    SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9),'BEGIN CATCH', CHAR(13))
    SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9),CHAR(9),'EXECUTE GetErrorInfo', CHAR(13))
    SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9),'END CATCH'    , CHAR(13))
	SET @SQLCMD = CONCAT(@SQLCMD, 'END;', CHAR(13))
	PRINT('Creando Stored Procedure ' + 'D_' + @tab)
	EXEC(@SQLCMD)
	PRINT('Stored Procedure Creada')
END;