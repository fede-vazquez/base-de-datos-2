create procedure gencreateupdate
@tab varchar(128)
AS
BEGIN
    DECLARE @SQLCMD NVARCHAR(4000)
    DECLARE @DROPCMD NVARCHAR(4000)
    DECLARE @SQLTEXT VARCHAR(1024)
    DECLARE @WHERE VARCHAR(1024)
    DECLARE C_COL CURSOR FOR
    SELECT 
        UPPER(c.name), 
        CASE y.name
            WHEN 'VARCHAR' then 'VARCHAR(' + RTRIM(LTRIM(STR(c.MAX_LENGTH))) + ')'
            WHEN 'CHAR' then 'CHAR(' + RTRIM(LTRIM(STR(c.MAX_LENGTH))) + ')'
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


	SET @DROPCMD = CONCAT(@DROPCMD, 'IF OBJECT_ID(',CHAR(39),'U_',@tab, CHAR(39), ',', CHAR(39), 'P', CHAR(39) + ') IS NOT NULL', CHAR(13))
	SET @DROPCMD = CONCAT(@DROPCMD, 'BEGIN', CHAR(13))
	SET @DROPCMD = CONCAT(@DROPCMD, CHAR(9), 'DROP PROCEDURE U_', @tab, CHAR(13))
	SET @DROPCMD = CONCAT(@DROPCMD, 'END', CHAR(13))
	PRINT('Borrando Stored Procedure U_' + @tab)
	EXEC(@DROPCMD)
	PRINT('Stored Procedure borrada')

    SET @SQLCMD = CONCAT('CREATE PROCEDURE U_',@tab, CHAR(13))
    OPEN C_COL
    FETCH C_COL INTO @COLNAME, @COLTYPE, @ISPK
    SET @CNT = 0
    WHILE @@FETCH_STATUS = 0
    BEGIN
        BEGIN
            IF @CNT = 0
                BEGIN
                    SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9), ' @', @COLNAME, ' ', @COLTYPE, ' = NULL', CHAR(13))
                    SET @CNT = 1
                END
            ELSE
                SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9), ',@', @COLNAME, ' ', @COLTYPE, ' = NULL', CHAR(13))
        END    
        FETCH C_COL INTO @COLNAME, @COLTYPE, @ISPK
    END
    CLOSE C_COL

    SET @SQLCMD = CONCAT(@SQLCMD,'AS',CHAR(13))
    SET @SQLCMD = CONCAT(@SQLCMD,'BEGIN',CHAR(13))
    SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),'BEGIN TRY',CHAR(13))
    SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),CHAR(9),'UPDATE ', @tab ,' SET ', CHAR(13))
    SET @CNT = 0
    OPEN C_COL
    FETCH C_COL INTO @COLNAME, @COLTYPE, @ISPK
    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF @ISPK = 1
            BEGIN
                SET @WHERE = CONCAT('WHERE ' + UPPER(@COLNAME) + ' = @' + @COLNAME, CHAR(13))
            END
        ELSE
            IF @CNT = 0
                BEGIN
					SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),CHAR(9),@COLNAME, ' = ISNULL(@', @COLNAME, ', ', @COLNAME ,')',CHAR(13))
                    SET @CNT = 1
                END
            ELSE
				SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),CHAR(9),',', @COLNAME, ' = ISNULL(@', @COLNAME, ', ', @COLNAME ,')',CHAR(13))

        FETCH C_COL INTO @COLNAME, @COLTYPE, @ISPK
    END
	SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),CHAR(9),@WHERE,CHAR(13))

    CLOSE C_COL
    DEALLOCATE C_COL

    SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9),'END TRY', CHAR(13))
    SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),'BEGIN CATCH',CHAR(13))
    SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9), CHAR(9),'EXECUTE GetErrorInfo',CHAR(13))
    SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),'END CATCH',CHAR(13))    
    SET @SQLCMD = CONCAT(@SQLCMD,'END;', CHAR(13))
	PRINT('Creando Stored Procedure U_' + @tab)
	EXEC(@SQLCMD)
	PRINT('Stored Procedure Creada')
END;
