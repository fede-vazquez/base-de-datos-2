create view vMateriasXNivel
as
select n.descripcion as Nivel, count(*) as MateriasXNivel
from MateriasPlan mp 
inner join Asignatura a 
	on a.id = mp.asignatura_id 
inner join Nivel n 
	on n.id = mp.nivel_id 
group by n.descripcion;
