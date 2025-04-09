.mode csv
.import 20231205_info_publica_datos_barrios.csv Base

select 'Creacion de Tablas';
CREATE TABLE Provincia(id integer not null primary key autoincrement, nombre varchar(64) not null unique);
CREATE TABLE Energia_electrica(id integer not null primary key autoincrement, nombre varchar(64) not null unique);
CREATE TABLE Efluentes_cloacales(id integer not null primary key autoincrement, nombre varchar(64) not null unique);
CREATE TABLE Agua_corriente(id integer not null primary key autoincrement, nombre varchar(64) not null unique);
CREATE TABLE Cocina(id integer not null primary key autoincrement, nombre varchar(64) not null unique);
CREATE TABLE Calefaccion(id integer not null primary key autoincrement, nombre varchar(64) not null unique);
CREATE TABLE Clasificacion_barrio(id integer not null primary key autoincrement, nombre varchar(64) not null unique);

select 'Insercion de Datos';
insert into Provincia(nombre) select distinct provincia from Base order by 1;
insert into Energia_electrica(nombre) select distinct energia_electrica from Base order by 1;
insert into Efluentes_cloacales(nombre) select distinct efluentes_cloacales from Base order by 1;
insert into Agua_corriente(nombre) select distinct agua_corriente from Base order by 1;
insert into Cocina(nombre) select distinct cocina from Base order by 1;
insert into Calefaccion(nombre) select distinct calefaccion from Base order by 1;
insert into Clasificacion_barrio(nombre) select distinct clasificacion_barrio from Base order by 1;
--.schema

--with xbase as (select distinct provincia, departamento from Base order by 1,2)
--select provincia,count(*) from xbase group by provincia;

select 'Departamento';
create table Departamento ( 
    id integer not null primary key autoincrement,
    provincia_id integer not null,
    nombre varchar(128) not null,
    foreign key (provincia_id) references Provincia(id));

create unique index uix_depto on Departamento(provincia_id, nombre);

insert into Departamento(provincia_id, nombre)
select distinct p.id, b.departamento
from Base b
inner join Provincia p
    on p.nombre = b.provincia
order by 1,2;

select 'Localidad';
create table Localidad (
    id integer not null primary key autoincrement,
    departamento_id integer not null,
    nombre varchar(256) not null,
    foreign key (departamento_id) references Departamento(id));

create unique index uix_localidad on Localidad(departamento_id, nombre);

insert into Localidad(departamento_id, nombre)
select distinct d.id, b.localidad
from Base b
inner join Departamento d 
    on d.nombre = b.departamento
inner join Provincia p
    on p.id = d.provincia_id
    and p.nombre = b.provincia
order by 1,2;


create table Barrio(
    id integer not null primary key autoincrement,
    nombre varchar(512) not null,
    localidad_id integer not null,
    energia_electrica_id integer not null,
    efluentes_cloacales_id integer not null,
    agua_corriente_id integer not null,
    cocina_id integer not null,
    calefaccion_id integer not null,
    clasificacion_barrio_id integer not null,
    cantidad_viviendas integer not null default 0,
    cantidad_familias integer not null default 0,
    anio_creacion integer,
    decada_creacion integer not null check(decada_creacion > 0),
    superficie real not null check(superficie >= 0),
    titulo_propiedad_sn char(1) not null default 'N' check(titulo_propiedad_sn in ('S','N')),
    foreign key (localidad_id) references Localidad(id),
    foreign key (energia_electrica_id) references Energia_elctrica(id),
    foreign key (efluentes_cloacales_id) references Efluentes_cloacales(id),
    foreign key (agua_corriente_id) references Agua_corriente(id),
    foreign key (cocina_id) references Cocina(id),
    foreign key (calefaccion_id) references Calefaccion(id),
    foreign key (clasificacion_barrio_id) references Calsificacion_barrio(id)
);


insert into Barrio(
    nombre,
    localidad_id,
    energia_electrica_id,
    efluentes_cloacales_id,
    agua_corriente_id,
    cocina_id,
    calefaccion_id,
    clasificacion_barrio_id,
    cantidad_viviendas,
    cantidad_familias,
    anio_creacion,
    decada_creacion,
    superficie,
    titulo_propiedad_sn
)
select b.nombre_barrio, l.id, ee.id, ec.id, ac.id, co.id, ca.id, cb.id,
cast(b.cantidad_viviendas_aproximadas as integer),
cast(b.cantidad_familias_aproximada as integer),
cast(b.anio_de_creacion as integer),
cast(replace(b.decada_de_creacion,'Década ','') as integer),
cast(b.superficie_m2 as real),
case b.titulo_propiedad
when 'SI' then 'S'
when 'NO' then 'N'
else 'N'
end
from Base b
inner join Energia_electrica ee
    on ee.nombre = b.energia_electrica
inner join Efluentes_cloacales ec
    on ec.nombre = b.efluentes_cloacales
inner join Agua_corriente ac
    on ac.nombre = b.agua_corriente
inner join Cocina co
    on co.nombre = b.cocina
inner join Calefaccion ca
    on ca.nombre = b.calefaccion
inner join Clasificacion_barrio cb
    on cb.nombre = b.clasificacion_barrio
inner join Localidad l
    on l.nombre = b.localidad
inner join Departamento  d
    on d.nombre = b.departamento
   and d.id = l.departamento_id
inner join Provincia p
    on p.nombre = b.provincia
   and p.id = d.provincia_id;

select 'Tablas creadas';
.tables


drop view if exists vBarrios;

create view vBarrios as
select 
    p.nombre as provincia, 
    d.nombre as departamento, 
    l.nombre as localidad, 
    b.nombre as barrio, 
    b.decada_creacion as decada,
    b.superficie as superficie
from Barrio b
inner join Localidad l
    on b.localidad_id = l.id
inner join Departamento d
    on d.id = l.departamento_id
inner join Provincia p
    on p.id = d.provincia_id
order by 1,2,3,4;

--https://sqlite.org/lang_createview.html




