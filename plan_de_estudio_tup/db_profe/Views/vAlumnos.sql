create view vAlumnos
as
select p.apellido, p.nombre, p.dni, a.legajo, pe.nombre as PlanEstudio
from Alumno a 
inner join Persona p 
	on p.id = a.persona_id 
inner join PlanEstudio pe 
	on pe.id = a.planestudio_id;