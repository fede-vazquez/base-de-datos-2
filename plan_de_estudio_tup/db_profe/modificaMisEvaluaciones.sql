-- actualizar mis datos

--	Select para tener las evaluaciones, con esto tenemos
--	los id de las evaluaciones que tenemos que cambiar.
--	Todo por el número de dni

select e.id, a.nombre, e.calificacion, promovida_sn as promovida from Evaluacion e
	inner join Alumno al
	on al.id = alumno_id
	inner join Persona p
	on p.id = al.persona_id
	inner join MateriasPlan mp
	on mp.id = e.materiaplan_id
	inner join Asignatura a
	on a.id = asignatura_id
where p.dni = 42574577;
GO

exec U_Evaluacion @id = 16, @PROMOVIDA_SN = 'S', @CALIFICACION = 9;
exec U_Evaluacion @id = 76, @PROMOVIDA_SN = 'S', @CALIFICACION = 8;
exec U_Evaluacion @id = 136, @PROMOVIDA_SN = 'S', @CALIFICACION = 10;
exec U_Evaluacion @id = 196, @PROMOVIDA_SN = 'S', @CALIFICACION = 7;
exec U_Evaluacion @id = 256, @PROMOVIDA_SN = 'S', @CALIFICACION = 9;
exec U_Evaluacion @id = 316, @PROMOVIDA_SN = 'S', @CALIFICACION = 9;
exec U_Evaluacion @id = 376, @PROMOVIDA_SN = 'S', @CALIFICACION = 9;
exec U_Evaluacion @id = 436, @PROMOVIDA_SN = 'S', @CALIFICACION = 10;