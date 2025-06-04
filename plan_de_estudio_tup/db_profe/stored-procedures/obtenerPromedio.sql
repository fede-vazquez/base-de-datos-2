CREATE PROCEDURE obtenerPromedio
	@DNI INTEGER
AS
select * from vPromedios
where DNI = @DNI;
GO