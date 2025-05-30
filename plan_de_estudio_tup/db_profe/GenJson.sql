create procedure GenJson
	@tab varchar(128),
	@id int = NULL
As
Begin
	declare @cmd varchar(4000)
	declare @cols varchar(1000)
	declare ccols cursor for 
		select c.column_id, c.name
		from sys.tables t
		inner join sys.columns c
			on c.object_id  = t.object_id 
		where t.name = @tab
		order by c.column_id;
	declare @colid int
	declare @colname varchar(128)
	declare @pos int = 1
	
	open ccols
	fetch ccols into @colid, @colname
	while @@fetch_status = 0
	Begin
		if @pos = 1
		Begin
			set @cols = @colname
			set @pos = 2
		END 
		ELSE 
		BEGIN 
			set @cols = CONCAT(@cols,', ', @colname) 
		END
		fetch ccols into @colid, @colname
	End
	close ccols
	deallocate ccols	
	
	set @cmd = concat('select json_query((select ', @cols, ' for JSON PATH, without_array_wrapper)) as jdata from ', @tab)
	if @id is not null
	Begin
		set @cmd = concat(@cmd, ' where id = ', @id)
	End
	EXEC(@cmd)
End