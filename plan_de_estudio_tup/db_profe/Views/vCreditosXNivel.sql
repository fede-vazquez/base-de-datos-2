create view vCreditosXNivel
as
select n.descripcion as Nivel, sum(a.creditos) as CreditosXNivel, count(*) as Materias
from MateriasPlan mp 
inner join Asignatura a 
	on a.id = mp.asignatura_id 
inner join Nivel n 
	on n.id = mp.nivel_id 
inner join Cuatrimestre c 
	on c.id = mp.cuatrimestre_id 
group by n.descripcion;