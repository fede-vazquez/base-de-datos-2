create procedure geninsert
@tab varchar(128)
AS
BEGIN
    DECLARE @SQLTEXT VARCHAR(1024)
    DECLARE @VALUES VARCHAR(1024)
    DECLARE @WHERE VARCHAR(1024)
    DECLARE C_COL CURSOR FOR
    SELECT 
        UPPER(c.name), 
        CASE y.name
            WHEN 'VARCHAR' then 'VARCHAR(' + TRIM(STR(c.MAX_LENGTH)) + ')'
            WHEN 'CHAR' then 'CHAR(' + TRIM(STR(c.MAX_LENGTH)) + ')'
            ELSE UPPER(y.name)
        END,
        i.is_primary_key
    FROM sys.tables t
        INNER JOIN sys.columns c
	        ON c.object_id = t.object_id
        INNER JOIN sys.types y
            ON y.user_type_id = c.user_type_id
        LEFT JOIN sys.index_columns ic
        	on ic.object_id = t.object_id
        	and ic.column_id = c.column_id
        LEFT JOIN sys.indexes i
        	ON i.object_id = t.object_id
        	and i.index_id = ic.index_id
    WHERE t.name = @tab

    DECLARE @COLNAME VARCHAR(128)
    DECLARE @COLTYPE VARCHAR(128)
    DECLARE @ISPK INT
    DECLARE @CNT INTEGER


--    PRINT 'IF OBJECT_ID(' + CHAR(39) + 'I_' + @tab + CHAR(39) + ',' + CHAR(39) + 'P' + CHAR(39) + ') IS NOT NULL'
--    PRINT '    DROP PROCEDURE I_' + @tab + ';'
    PRINT ''
    PRINT 'CREATE PROCEDURE I_' + @tab
    OPEN C_COL
    FETCH C_COL INTO @COLNAME, @COLTYPE, @ISPK
    SET @CNT = 0
    WHILE @@FETCH_STATUS = 0
    BEGIN
        BEGIN
            IF @ISPK = 1
            BEGIN
                IF @CNT = 0
                    BEGIN
                        PRINT '    @' + @COLNAME + ' ' + @COLTYPE + ' OUTPUT' 
                        SET @CNT = 1
                    END
                ELSE
                        PRINT '   ,@' + @COLNAME + ' ' + @COLTYPE + ' OUTPUT'
            END
            ELSE
            BEGIN
                IF @CNT = 0
                    BEGIN
                        PRINT '    @' + @COLNAME + ' ' + @COLTYPE 
                        SET @CNT = 1
                    END
                ELSE
                        PRINT '   ,@' + @COLNAME + ' ' + @COLTYPE 
            END            
        END    
        FETCH C_COL INTO @COLNAME, @COLTYPE, @ISPK
    END
    CLOSE C_COL

    PRINT 'AS'
    PRINT 'BEGIN'
    PRINT '  BEGIN TRY'
    PRINT '    INSERT INTO ' + @tab
    SET @CNT = 0
    OPEN C_COL
    FETCH C_COL INTO @COLNAME, @COLTYPE, @ISPK
    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF @ISPK = 1
            BEGIN
                SET @WHERE = '    WHERE ' + UPPER(@COLNAME) + ' = @' + @COLNAME
            END
        ELSE
            IF @CNT = 0
                BEGIN
                    SET @SQLTEXT = '    (' + UPPER(@COLNAME)
                    SET @VALUES =  '    (@' + UPPER(@COLNAME)
                    SET @CNT = 1
                END
            ELSE
                BEGIN
                    SET @SQLTEXT = @SQLTEXT + ' ,' + UPPER(@COLNAME)
                    SET @VALUES =  @VALUES + ' ,@' + UPPER(@COLNAME)
                END
        FETCH C_COL INTO @COLNAME, @COLTYPE, @ISPK
    END
    SET @SQLTEXT = @SQLTEXT + ')'
    SET @VALUES = @VALUES + ')'
    PRINT @SQLTEXT
    PRINT '    VALUES'
    PRINT @VALUES
    CLOSE C_COL
    DEALLOCATE C_COL
    PRINT '     SET @ID = @@IDENTITY'
    PRINT '  END TRY'
    PRINT '  BEGIN CATCH'
    PRINT '     EXECUTE GetErrorInfo'
    PRINT '  END CATCH'
    PRINT 'END;'
END;