create view vEstadoAcademico
as
select 
	p.apellido as Apellido, 
	p.nombre as Nombre, 
	p.dni as DNI, 
	n.descripcion as Nivel, 
	asig.nombre as Materia, 
	e.calificacion as Nota 
from Alumno a 
inner join MateriasPlan mp 
	on mp.plan_id = a.planestudio_id 
inner join Asignatura asig 
	on asig.id = mp.asignatura_id 
inner join Nivel n
	on n.id = mp.nivel_id 
inner join Persona p 
	on p.id = a.persona_id
left join Evaluacion e 
	on e.alumno_id = a.id 
	and e.materiaplan_id = mp.id;
GO

-- Un caso de uso:
-- select * from vEstadoAcademico
-- where DNI in(select top 5 dni from Persona p)