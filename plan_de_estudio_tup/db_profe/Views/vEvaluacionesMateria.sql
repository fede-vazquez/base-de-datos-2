create view vEvaluacionesMateria
as
select 
	mp.id as MateriaID,
	a.nombre as Materia, 
	round(avg(e.calificacion),2) as Promedio, 
	min(e.calificacion) as Minimo, 
	max(e.calificacion) as Maximo,
	count(*) as Alumnos
from Evaluacion e 
inner join MateriasPlan mp 
	on mp.id = e.materiaplan_id 
inner join Asignatura a 
	on a.id = mp.asignatura_id 
group by mp.id, a.nombre;


-- Un caso de uso:
-- select * from vEvaluacionesMateria
-- where materia like 'Mate%'