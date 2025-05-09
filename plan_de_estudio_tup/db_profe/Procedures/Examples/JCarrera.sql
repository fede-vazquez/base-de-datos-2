
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'JCarrera')
DROP PROCEDURE JCarrera;

create procedure JCarrera @id integer
As
Begin
select concat(
	'{"id" : ', cast(ca.id as varchar), ',',
	'"nombre" : "', ca.nombre,'",',
	'"institucion": {"id": ', cast(i.id as varchar), ', "nombre" : "', i.nombre , '"},',
	'"tipo": {"id": ', cast(tc.id as varchar), ', "nombre" : "', tc.nombre , '"},',
	'"modalidad": {"id": ', cast(mc.id as varchar), ', "nombre" : "', mc.nombre , '"}}'
)
from Carrera ca
inner join TipoCarrera tc 
	on tc.id = ca.tipocarrera_id 
inner JOIN ModalidadCarrera mc 
	on mc.id  = ca.modalidadcarrera_id 
inner join Institucion i 
	on i.id = ca.institucion_id 
where ca.id = @id or @id is null

End;

exec JCarrera @id=NULL 

-- JSON Basics:
-- Devuelve algo asi:
{"id" : 1,"nombre" : "Tecnicatura Universitaria en Programación","institucion": {"id": 1, "nombre" : "UTN Facultad Regional San Nicolás"},"tipo": {"id": 1, "nombre" : "Tecnicatura Universitaria"},"modalidad": {"id": 1, "nombre" : "Presencial"}}

-- q pasado por jsonlint.com, queda asi de bonito:
{
    "id": 1,
    "nombre": "Tecnicatura Universitaria en Programación",
    "institucion": {
        "id": 1,
        "nombre": "UTN Facultad Regional San Nicolás"
    },
    "tipo": {
        "id": 1,
        "nombre": "Tecnicatura Universitaria"
    },
    "modalidad": {
        "id": 1,
        "nombre": "Presencial"
    }
}

