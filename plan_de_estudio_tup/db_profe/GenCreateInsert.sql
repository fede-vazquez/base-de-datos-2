create procedure gencreateinsert
@tab varchar(128)
AS
BEGIN
    DECLARE @SQLTEXT NVARCHAR(1024)
    DECLARE @VALUES NVARCHAR(1024)
    DECLARE @WHERE NVARCHAR(1024)
	DECLARE @SQLCMD NVARCHAR(4000)
	DECLARE @DROPCMD NVARCHAR(4000)
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


	SET @DROPCMD = CONCAT('IF OBJECT_ID(' , CHAR(39) ,'I_', @tab,CHAR(39), ',' ,CHAR(39) ,'P',CHAR(39) ,') IS NOT NULL',CHAR(13))
	SET @DROPCMD = CONCAT(@DROPCMD,'BEGIN',CHAR(13))
	SET @DROPCMD = CONCAT(@DROPCMD, CHAR(9),'DROP PROCEDURE I_', @tab, ';', CHAR(13))
	SET @DROPCMD = CONCAT(@DROPCMD,'END',CHAR(13))
	PRINT('Borrando Stored Procedure ' + 'I_' + @tab)
	EXEC(@DROPCMD)
	PRINT('Stored Procedure Borrada')

    SET @SQLCMD = CONCAT('CREATE PROCEDURE I_', @tab, CHAR(13))
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
                        SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9), ' @', @COLNAME ,' ', @COLTYPE ,' OUTPUT', CHAR(13))
                        SET @CNT = 1
                    END
                ELSE
                        SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9), ',@', @COLNAME ,' ', @COLTYPE ,' OUTPUT', CHAR(13))
            END
            ELSE
            BEGIN
                IF @CNT = 0
                    BEGIN
                        SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9),' @',@COLNAME,' ', @COLTYPE , CHAR(13))
                        SET @CNT = 1
                    END
                ELSE
                        SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9),',@',@COLNAME,' ', @COLTYPE , CHAR(13))
            END            
        END    
        FETCH C_COL INTO @COLNAME, @COLTYPE, @ISPK
    END
    CLOSE C_COL

    SET @SQLCMD = CONCAT(@SQLCMD,CHAR(13),'AS',CHAR(13),'BEGIN',CHAR(13))
    SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),'BEGIN TRY',CHAR(13))
    SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),CHAR(9),'INSERT INTO ',@tab)
    SET @CNT = 0
    OPEN C_COL
    FETCH C_COL INTO @COLNAME, @COLTYPE, @ISPK
    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF @ISPK = 1
            BEGIN
                SET @WHERE = CONCAT(CHAR(9),'WHERE ',UPPER(@COLNAME),' = @', @COLNAME)
            END
        ELSE
            IF @CNT = 0
                BEGIN
                    SET @SQLTEXT = CONCAT('(',UPPER(@COLNAME))
                    SET @VALUES =  CONCAT('(@', UPPER(@COLNAME))
                    SET @CNT = 1
                END
            ELSE
                BEGIN
                    SET @SQLTEXT = CONCAT(@SQLTEXT, ', ',UPPER(@COLNAME))
                    SET @VALUES =  CONCAT(@VALUES, ', @', UPPER(@COLNAME))
                END
        FETCH C_COL INTO @COLNAME, @COLTYPE, @ISPK
    END
    SET @SQLTEXT = CONCAT(@SQLTEXT, ')', CHAR(13))
    SET @VALUES = CONCAT(@VALUES, ')', CHAR(13))
	SET @SQLCMD = CONCAT(@SQLCMD, @SQLTEXT)
    SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),CHAR(9),'VALUES',@VALUES)
	CLOSE C_COL
    DEALLOCATE C_COL

    SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),CHAR(9),'SET @ID = @@IDENTITY',CHAR(13))
    SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),'END TRY',CHAR(13))
    SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),'BEGIN CATCH',CHAR(13))
    SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),CHAR(9),'EXECUTE GetErrorInfo',CHAR(13))
    SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),'END CATCH',CHAR(13))
    SET @SQLCMD = CONCAT(@SQLCMD,'END;', CHAR(13))
	PRINT('Creando Stored Procedure ' + 'I_' + @tab)
	EXEC(@SQLCMD)
	PRINT('Stored Procedure Creada')
END;