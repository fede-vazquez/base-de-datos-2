CREATE PROCEDURE obtenerEstadoAcademico
	@DNI INTEGER
AS
select * from vEstadoAcademico
where DNI = @DNI;
GO