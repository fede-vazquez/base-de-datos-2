create view vMateriasXCuatrimestre
as
select n.descripcion as Nivel, c.descripcion as Cuatrimestre, count(*) as MateriasXCuatrimestre
from MateriasPlan mp 
inner join Asignatura a 
	on a.id = mp.asignatura_id 
inner join Nivel n 
	on n.id = mp.nivel_id 
inner join Cuatrimestre c 
	on c.id = mp.cuatrimestre_id 
group by n.descripcion, c.descripcion;