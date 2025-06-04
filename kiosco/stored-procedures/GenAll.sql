Begin
	declare ctab cursor for SELECT name from sys.tables
	declare @t varchar(64)
	open ctab
	fetch ctab into @t
	while @@fetch_status = 0
	Begin
		EXEC GenCreateInsert @t 
		EXEC GenCreateUpdate @t
		EXEC GenCreateDelete @t
		fetch ctab into @t
	END
	close ctab
	deallocate ctab
End
