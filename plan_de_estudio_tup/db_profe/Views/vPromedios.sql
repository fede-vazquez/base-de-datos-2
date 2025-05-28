create view vPromedios
as
select 
	p.apellido as Apellido, 
	p.nombre as Nombre, 
	p.dni as DNI,
	round(avg(calificacion),2) as Promedio
from Evaluacion e 
inner join Alumno a 
	on a.id = e.alumno_id 
inner join Persona p 
	on p.id = a.persona_id 
group by p.apellido, p.nombre, p.dni;

select * from vPromedios
where DNI = 42574577;

-- Dos casos de uso
-- select * from vPromedios
-- where dni in (select top 10 dni from Persona)

-- select * from vPromedios where dni = 47117878
-- select * from vPromedios where dni = 43258761

-- select * from vPromedios
-- where dni in (select top 10 dni from Persona)
-- order by 1,2

-- select * from vPromedios where apellido like 'G%'

-- select * from vPromedios order by 1,2