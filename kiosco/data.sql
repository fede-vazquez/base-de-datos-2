Begin
    declare @id int
    exec I_Comercio @id out, 'Calamar Campeon','30-17170170-3'
    exec I_Proveedor @id out, 'Proveedor 1','99-99999997-9'
    exec I_Proveedor @id out, 'Proveedor 2','99-99999998-9'
    exec I_Proveedor @id out, 'Proveedor 3','99-99999999-9'
    exec I_TipoProducto @id out, 'Gaseosas'
    exec I_TipoProducto @id out, 'Golosinas'
    exec I_TipoProducto @id out, 'Panaderia'
    exec I_TipoProducto @id out, 'Bebidas Alcoholicas'
    exec I_TipoProducto @id out, 'Limpieza'
    exec I_TipoProducto @id out, 'Cigarillos'
End
GO
Begin
    declare @id int
    declare @tipoproducto_id integer

    select @tipoproducto_id = id from TipoProducto
    where nombre = 'Gaseosas';
    EXEC I_Producto @id out, @tipoproducto_id, 'Coca Cola 2 Litros retornable', 'Coca/2L/Ret','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Coca Cola 500cc', 'Coca/500cc','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Coca Cola 1 Litro No retornable', 'Coca/1/NoRet','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Coca Cola Lata', 'Coca/Lata','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Fanta 2 Litros retornable', 'Fanta/2L/Ret','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Fanta 500cc', 'Fanta/500cc','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Fanta 1 Litro No retornable', 'Fanta/1/NoRet','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Fanta Lata', 'Fanta/Lata','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Sprite 2 Litros retornable', 'Sprite/2L/Ret','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Sprite 500cc', 'Sprite/500cc','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Sprite 1 Litro No retornable', 'Sprite/1/NoRet','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Sprite Lata', 'Sprite/Lata','S'

    select @tipoproducto_id = id from TipoProducto
    where nombre = 'Golosinas'
    EXEC I_Producto @id out, @tipoproducto_id, 'Chocolate Aguila 200 Gr', 'Choc/Ag/200','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Chocolate Aguila 100 Gr', 'Choc/Ag/100','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Chocolate Aguila 50 Gr', 'Choc/Ag/50','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Chocolate Aguila 400 Gr', 'Choc/Ag/400','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Bananita Dolca', 'Ban/Dolca','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Caramelos Sugus', 'Sugus','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Corazoncitos Riquelme', 'Cor/Riquel','S'

    select @tipoproducto_id = id from TipoProducto
    where nombre = 'Panaderia'
    EXEC I_Producto @id out, @tipoproducto_id, 'Bizcochos Don Satur Salados 250 Gr', 'DSat/Sal/250','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Bizcochos Don Satur Dulces 250 Gr', 'DSat/Dul/250','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Bizcochos Don Satur Salados 100 Gr', 'DSat/Sal/100','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Bizcochos Don Satur Dulces 100 Gr', 'DSat/Dul/100','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Bizcochos 9 de Oro Salados 250 Gr', '9Oro/Sal/250','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Bizcochos 9 de Oro Dulces 250 Gr', '9Oro/Dul/250','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Bizcochos 9 de Oro Salados 100 Gr', '9Oro/Sal/100','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Bizcochos 9 de Oro Dulces 100 Gr', '9Oro/Dul/100','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Galletitas Melba', 'Melba','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Galletitas Mellizas', 'Mellizas','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Galletitas Rumba', 'Rumba','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Galletitas Criollitas', 'Criollitas','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Galletitas Express', 'Express','S'

    select @tipoproducto_id = id from TipoProducto
    where nombre = 'Bebidas Alcoholicas'
    EXEC I_Producto @id out, @tipoproducto_id, 'Cerveza Brahma 1 Litro', 'Brahma 1L','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Cerveza Brahma Lata 500', 'Brahma 500cc','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Cerveza Brahma Lata 350', 'Brahma 350cc','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Cerveza Quilmes 1 Litro',  'Quilmes 1L','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Cerveza Quilmes Lata 500', 'Quilmes 500cc','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Cerveza Quilmes Lata 350', 'Quilmes 350cc','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Cerveza Stella Artois 1 Litro',  'Stella 1L','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Cerveza Stella Artois (Negra) 1 Litro',  'Stella/1L','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Cerveza Stella Artois Lata 500', 'Stella 500cc','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Cerveza Stella Artois Lata 350', 'Stella 350cc','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Whisky 30 Pelusas', '30 Pelusas','S'

    select @tipoproducto_id = id from TipoProducto
    where nombre = 'Limpieza'
    EXEC I_Producto @id out, @tipoproducto_id, 'Detergente Espumita 1L', 'Det/Esp/1L','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Detergente Espumita 500cc', 'Det/Esp/500','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Detergente Espumita 250cc', 'Det/Esp/250','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Detergente Espumita 100cc', 'Det/Esp/100','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Esponja Patito', 'Lav/Patito','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Lavandina Suplerblanca 1L', 'Lav/Sbl/1L','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Lavandina Suplerblanca 500cc', 'Lav/Sbl/500','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Lavandina Suplerblanca 250cc', 'Lav/Sbl/250','S'

    select @tipoproducto_id = id from TipoProducto
    where nombre = 'Cigarrillos'
    EXEC I_Producto @id out, @tipoproducto_id, 'Alto Faso x 20','Cig/AF/20','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Alto Faso x 10','Cig/AF/10','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Pulmon Negro x 20','Cig/PN/20','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Pulmon Negro x 10','Cig/PN/10','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Humo de Colores x 20','Cig/HC/20','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Humo de Colores x 1','Cig/HC/10','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Maconia x 1','Cig/Macon','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Vuela Alto x 1','Cig/VA/10','S'
    EXEC I_Producto @id out, @tipoproducto_id, 'Fafafa x 1','Cig/FA/10','S'
End
GO
Begin
	declare @proveedor_id int
	declare @producto_id int
	declare @id int
	declare @precio float
	declare ccur cursor for
	select prov.id, prod.id from Proveedor prov, Producto prod;

	open ccur
	fetch ccur into @proveedor_id, @producto_id
	While @@fetch_status = 0
	Begin
		select @precio = round(Cast(RAND()*(5000-500)+500 as float),2)
		exec I_ProductoProveedor @id, @proveedor_id, @producto_id, @precio, 10.0
		fetch ccur into @proveedor_id, @producto_id
	END
	close ccur
	deallocate ccur
END
GO
insert into Stock(productoproveedor_id, cantidadminima, cantidadactual)
select id, 10, 100 from ProductoProveedor;
