-- Ingresa comercio
begin
	declare @id int
	exec I_Comercio @id, 'Kiosco sa', '99-999999-99';
end
go

-- Ingresa 
begin
	declare @id int
	exec I_TipoProducto @id, 'Gaseosa'
end