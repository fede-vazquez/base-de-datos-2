-- actualizar mis datos
/*
select * from Evaluacion
inner join Alumno a
on a.id = alumno_id
inner join Persona p
on p.id = a.persona_id
where p.dni = 42574577;
GO
*/

exec U_Evaluacion @id = 16, @PROMOVIDA_SN = 'S', @CALIFICACION = 9;
exec U_Evaluacion @id = 76, @PROMOVIDA_SN = 'S', @CALIFICACION = 8;
exec U_Evaluacion @id = 136, @PROMOVIDA_SN = 'S', @CALIFICACION = 10;
exec U_Evaluacion @id = 196, @PROMOVIDA_SN = 'S', @CALIFICACION = 7;
exec U_Evaluacion @id = 256, @PROMOVIDA_SN = 'S', @CALIFICACION = 9;
exec U_Evaluacion @id = 316, @PROMOVIDA_SN = 'S', @CALIFICACION = 9;
exec U_Evaluacion @id = 376, @PROMOVIDA_SN = 'S', @CALIFICACION = 9;
exec U_Evaluacion @id = 436, @PROMOVIDA_SN = 'S', @CALIFICACION = 10;