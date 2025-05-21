insert into Alumno(persona_id, planestudio_id, legajo)
select p.id, (select id from PlanEstudio), p.dni
from Persona p;