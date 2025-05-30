-- Carga de Evaluaciones.
---------------------------------------
-- Si la tabla TipoEvaluacion esta vacia, hay q cargarla:
--     Begin
--         declare @id int
--         exec I_TipoEvaluacion @id out, @nombre='Final'
--     End
-- Por ahora, con los finales alcanza.

-- Vamos a cargar random finales para todas las materias
-- de 1er anio (nivel 1)

-- Contamos cuantas materias hay:
select count(*) from MateriasPlan mp  where nivel_id = 1;

-- Contamos cuantos alumnos tenemos cargados:
select count(*) from Alumno;

-- En mi caso, 8 materias, 60 alumnos, deberia cargar 480 finales
-- Verificamos:
select count(*)
from MateriasPlan mp 
inner join Alumno al
	on al.planestudio_id = mp.plan_id 
where mp.nivel_id = 1;

-- Deberian ser 480 (8 x 60)

-- Ejecutamos el insert en Evaluacion
insert into Evaluacion (
    tipoevaluacion_id, 
    materiaplan_id, 
    alumno_id, 
    fecha, 
    aprobada_sn, 
    promovida_sn, 
    calificacion)
select 
	(select id from TipoEvaluacion where nombre = 'Final'), 
	mp.asignatura_id, 
	al.id,
	DATEFROMPARTS(2024, ABS(CHECKSUM(NEWID()) % 11) + 1, ABS(CHECKSUM(NEWID()) % 27) + 1),
	'S',
	'N',
	(ABS(CHECKSUM(NEWID()) % 6) + 4)
from MateriasPlan mp 
inner join Alumno al
	on al.planestudio_id = mp.plan_id 
where mp.nivel_id = 1

-- Verificamos
select count(*) from Evaluacion;

-- Deberian ser 480.

-- A analizar en clase:
-- Todas las funciones utilizadas para generar la data.
-- Fechas, notas

-- Ojo! Esto es un caso particular para generar datos.
