create procedure gendelete
@tab varchar(128)
AS
BEGIN
	PRINT ''
	PRINT ''
--    PRINT 'IF OBJECT_ID(' + CHAR(39) + 'D_' + @tab + CHAR(39) + ',' + CHAR(39) + 'P' + CHAR(39) + ') IS NOT NULL'
--    PRINT '    DROP PROCEDURE D_' + @tab + ';'
    PRINT 'CREATE PROCEDURE D_' + @tab
    PRINT '@ID INTEGER'
    PRINT 'AS'
    PRINT 'BEGIN'
    PRINT '  BEGIN TRY'
    PRINT '    DELETE FROM ' + @tab + ' WHERE ID = @ID'
    PRINT '  END TRY'
    PRINT '  BEGIN CATCH'
    PRINT '     EXECUTE GetErrorInfo'
    PRINT '  END CATCH'    
	PRINT 'END;'
END;