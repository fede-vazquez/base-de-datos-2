insert into Institucion(nombre, domicilio)
values ('UTN Facultad Regional San Nicolás', 'Colón 332, San Nicolás, Buenos Aires (2900)');
GO

insert into TipoCarrera(nombre) values ('Tecnicatura Universitaria');
insert into TipoCarrera(nombre) values ('Ingeniería');
GO

insert into ModalidadCarrera(nombre) values ('Presencial');
insert into ModalidadCarrera(nombre) values ('A distancia');
GO

insert into Carrera(institucion_id, tipocarrera_id, modalidadcarrera_id, nombre, duracion)
values (1, 1, 1, 'Tecnicatura Universitaria en Programación',2);
GO

insert into Regimen(nombre) values ('Anual');
insert into Regimen(nombre) values ('Cuatrimestral');
insert into Regimen(nombre) values ('Proyecto Final');
GO

insert into Area(nombre) values ('Ciencias Básicas');
insert into Area(nombre) values ('Disciplinas Tecnológicas');
insert into Area(nombre) values ('Disciplinas Complementarias');
insert into Area(nombre) values ('Integración Multidisciplinaria');
GO

insert into PlanEstudio(nombre, carrera_id, fecha_inicio)
values ('Nuevo Plan 2018',1,'01/01/2018');
GO

insert into Cuatrimestre(numero, descripcion) values (1, 'Primer');
insert into Cuatrimestre(numero, descripcion) values (2, 'Segundo');
insert into Cuatrimestre(numero, descripcion) values (3, 'Proyecto Final');
GO

insert into Nivel(numero, descripcion) values (1, 'Primer Año');
insert into Nivel(numero, descripcion) values (2, 'Segundo Año');
GO

insert into Asignatura(area_id, regimen_id, nombre,	horassemana, horascuatrimestre, creditos)
values(2,1,'Programación I', 8, 128, 13);
insert into Asignatura(area_id, regimen_id, nombre,	horassemana, horascuatrimestre, creditos)
values(2,1,'Arquitectura y Sistemas Operativos', 4, 64, 5);
insert into Asignatura(area_id, regimen_id, nombre,	horassemana, horascuatrimestre, creditos)
values(1,1,'Matemática', 4, 64, 5);
insert into Asignatura(area_id, regimen_id, nombre,	horassemana, horascuatrimestre, creditos)
values(3,1,'Organización empresarial', 4, 64, 5);
GO

--SEGUNDO CUATRIMESTRE
insert into Asignatura(area_id, regimen_id, nombre,	horassemana, horascuatrimestre, creditos)
values(2,1,'Programación II' , 8, 128, 13);
insert into Asignatura(area_id, regimen_id, nombre,	horassemana, horascuatrimestre, creditos)
values(1,1,'Probabilidad y Estadística' , 4, 64, 5);
insert into Asignatura(area_id, regimen_id, nombre,	horassemana, horascuatrimestre, creditos)
values(2,1,'Base de Datos I' , 4, 64, 5);
insert into Asignatura(area_id, regimen_id, nombre,	horassemana, horascuatrimestre, creditos)
values(3,1,'Inglés I' , 4, 64, 5);
GO

--TERCER valuesCUATRIMESTRE
insert into Asignatura(area_id, regimen_id, nombre,	horassemana, horascuatrimestre, creditos)
values(2,1,'Programación III' , 8, 128, 13);
insert into Asignatura(area_id, regimen_id, nombre,	horassemana, horascuatrimestre, creditos)
values(2,1,'Base de Datos II' , 4, 64, 5);
insert into Asignatura(area_id, regimen_id, nombre,	horassemana, horascuatrimestre, creditos)
values(2,1,'Metodología de Sistemas I' , 4, 64, 5);
insert into Asignatura(area_id, regimen_id, nombre,	horassemana, horascuatrimestre, creditos)
values(3,1,'Inglés II' , 4, 64, 5);
GO

--CUARTO CUATRIMESTRE
insert into Asignatura(area_id, regimen_id, nombre,	horassemana, horascuatrimestre, creditos)
values(2,1,'Programación IV' , 8, 128, 13);
insert into Asignatura(area_id, regimen_id, nombre,	horassemana, horascuatrimestre, creditos)
values(2,1,'Metodología de  Sistemas II' , 4, 64, 5);
insert into Asignatura(area_id, regimen_id, nombre,	horassemana, horascuatrimestre, creditos)
values(2,1,'Introducción al análisis de datos' , 2, 32, 2);
insert into Asignatura(area_id, regimen_id, nombre,	horassemana, horascuatrimestre, creditos)
values(3,1,'Legislación' , 2, 32, 2);
insert into Asignatura(area_id, regimen_id, nombre,	horassemana, horascuatrimestre, creditos)
values(2,1,'Gestión de desarrollo de software' , 4, 64, 5);
insert into Asignatura(area_id, regimen_id, nombre,	horassemana, horascuatrimestre, creditos)
values(3,4,'Trabajo Final Integrador', 0, 95, 9);
GO

insert into MateriasPlan(plan_id,asignatura_id,nivel_id,cuatrimestre_id) values (1,1,1,1);
insert into MateriasPlan(plan_id,asignatura_id,nivel_id,cuatrimestre_id) values (1,2,1,1);
insert into MateriasPlan(plan_id,asignatura_id,nivel_id,cuatrimestre_id) values (1,3,1,1);
insert into MateriasPlan(plan_id,asignatura_id,nivel_id,cuatrimestre_id) values (1,4,1,1);

insert into MateriasPlan(plan_id,asignatura_id,nivel_id,cuatrimestre_id) values (1,5,1,2);
insert into MateriasPlan(plan_id,asignatura_id,nivel_id,cuatrimestre_id) values (1,6,1,2);
insert into MateriasPlan(plan_id,asignatura_id,nivel_id,cuatrimestre_id) values (1,7,1,2);
insert into MateriasPlan(plan_id,asignatura_id,nivel_id,cuatrimestre_id) values (1,8,1,2);
GO

insert into MateriasPlan(plan_id,asignatura_id,nivel_id,cuatrimestre_id) values (1,9,2,1);
insert into MateriasPlan(plan_id,asignatura_id,nivel_id,cuatrimestre_id) values (1,10,2,1);
insert into MateriasPlan(plan_id,asignatura_id,nivel_id,cuatrimestre_id) values (1,11,2,1);
insert into MateriasPlan(plan_id,asignatura_id,nivel_id,cuatrimestre_id) values (1,12,2,1);
GO

insert into MateriasPlan(plan_id,asignatura_id,nivel_id,cuatrimestre_id) values (1,13,2,2);
insert into MateriasPlan(plan_id,asignatura_id,nivel_id,cuatrimestre_id) values (1,14,2,2);
insert into MateriasPlan(plan_id,asignatura_id,nivel_id,cuatrimestre_id) values (1,15,2,2);
insert into MateriasPlan(plan_id,asignatura_id,nivel_id,cuatrimestre_id) values (1,16,2,2);
insert into MateriasPlan(plan_id,asignatura_id,nivel_id,cuatrimestre_id) values (1,17,2,2);
GO

insert into MateriasPlan(plan_id,asignatura_id,nivel_id,cuatrimestre_id) values (1,18,2,3);
GO


Begin
    declare @id int
    exec I_TipoEvaluacion @id out, @nombre='Final'
    exec I_TipoEvaluacion @id out, @nombre='Parcial'
    exec I_TipoEvaluacion @id out, @nombre='Trabajo Practico'
    exec I_TipoEvaluacion @id out, @nombre='Monografia'
End
