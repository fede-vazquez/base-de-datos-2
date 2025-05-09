Begin
	declare ctab cursor for SELECT name from sys.tables
	declare @tab varchar(64)
	open ctab
	fetch ctab into @tab
	while @@fetch_status = 0
	Begin
    		PRINT ''
    		PRINT 'IF OBJECT_ID(' + CHAR(39) + 'I_' + @tab + CHAR(39) + ',' + CHAR(39) + 'P' + CHAR(39) + ') IS NOT NULL'
    		PRINT '    DROP PROCEDURE I_' + @tab + ';'
    		PRINT 'GO'
    		PRINT 'IF OBJECT_ID(' + CHAR(39) + 'U_' + @tab + CHAR(39) + ',' + CHAR(39) + 'P' + CHAR(39) + ') IS NOT NULL'
    		PRINT '    DROP PROCEDURE U_' + @tab + ';'
    		PRINT 'GO'
    		PRINT 'IF OBJECT_ID(' + CHAR(39) + 'D_' + @tab + CHAR(39) + ',' + CHAR(39) + 'P' + CHAR(39) + ') IS NOT NULL'
    		PRINT '    DROP PROCEDURE D_' + @tab + ';'
    		PRINT 'GO'
		fetch ctab into @tab
	END
	close ctab
	deallocate ctab
End;

