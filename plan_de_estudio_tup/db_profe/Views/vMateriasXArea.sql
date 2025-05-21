create view vMateriasXArea as
select 
    a.nombre as Area, 
    count(*) as Materias, 
    sum(m.creditos) as Creditos, 
    sum(m.horassemana) as HorasXSemana,
    avg(m.horascuatrimestre) as PromedioHoras
from Area a
inner join Asignatura m 
    on m.area_id = a.id
group by a.nombre;