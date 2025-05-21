create Procedure GenXml
    @tab varchar(64),
    @id int = NULL
as
Begin
    declare @xml nvarchar(4000) 
    declare ccols cursor for
    select c.column_id as cid, c.name as cname, y.name as ctype
    from sys.tables t
    inner join sys.columns c
        on c.object_id = t.object_id 
    inner join sys.types y
        on y.system_type_id = c.system_type_id 
    where t.name = @tab 

    declare @cid int
    declare @cname varchar(128)
    declare @ctype varchar(32)
    
    set @xml = CONCAT('SELECT CONCAT(', char(39),'<',lower(@tab),'>', char(39), ',')

    open ccols
    fetch ccols into @cid, @cname, @ctype
    while @@FETCH_STATUS = 0
    Begin
        set @xml = CONCAT(@xml, char(39), '<', @cname ,'>', char(39),',', @cname, ',', char(39), '</', @cname, '>', char(39),',') 
        
        fetch ccols into @cid, @cname, @ctype
    End
    close ccols
    deallocate ccols
    
    SET @xml = CONCAT(@xml, char(39),'</', lower(@tab),'>', char(39), ') from ', @tab)

    if @id is not NULL
    BEGIN
	    --SET @xml = CONCAT(@xml, char(39),'</', lower(@tab),'>', char(39), ') from ', @tab)
    	SET @xml = CONCAT(@xml, ' WHERE ID = ', @id)
	    EXEC(@xml)
    END
	ELSE
    BEGIN
	    declare @extxml varchar(4000)
		SET @extxml = CONCAT('SELECT ', char(39),'<lista-', lower(@tab),'>', char(39), char(13))
		SET @extxml = CONCAT(@extxml, ' UNION ALL ', char(13))
		SET @extxml = CONCAT(@extxml, @xml, char(13))
		SET @extxml = CONCAT(@extxml, ' UNION ALL ', char(13))
		SET @extxml = CONCAT(@extxml, 'SELECT ', char(39),'</lista-', lower(@tab),'>', char(39), char(13))
	    EXEC(@extxml)
	END
End
