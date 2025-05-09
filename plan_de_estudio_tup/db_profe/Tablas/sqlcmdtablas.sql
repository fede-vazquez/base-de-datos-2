create table Institucion (
	id integer not null primary key identity(1,1), 
	nombre  varchar(256) not null unique,
	domicilio varchar(256));
GO
create table TipoCarrera(
	id integer not null primary key identity(1,1), 
	nombre varchar(128)not null unique
);
GO
create table ModalidadCarrera(
	id integer not null primary key identity(1,1), 
	nombre varchar(128)not null unique
);
GO
create table Carrera (
	id integer not null primary key identity(1,1), 
	institucion_id integer not null,
	tipocarrera_id integer not null,
	modalidadcarrera_id integer not null,
	nombre  varchar(256) not null unique,
	duracion integer not null,
	foreign key (institucion_id) references  Institucion(id),
	foreign key (tipocarrera_id) references  TipoCarrera(id),
	foreign key (modalidadcarrera_id) references  ModalidadCarrera(id));
GO
create table Regimen (
	id integer not null primary key identity(1,1), 
	nombre  varchar(256) not null unique);
GO
create table Area (
	id integer not null primary key identity(1,1), 
	nombre  varchar(256) not null unique);
GO
create table PlanEstudio (
	id integer not null primary key identity(1,1), 
	nombre  varchar(256) not null unique,
	carrera_id integer not null,
	fecha_inicio datetime not null,
	fecha_fin datetime,
	foreign key (carrera_id) references Carrera(id));
GO
create table Cuatrimestre (
	id integer not null primary key identity(1,1), 
	numero integer not null check (numero >= 0),
	descripcion varchar(128) not null);
GO
create table Nivel (
	id integer not null primary key identity(1,1), 
	numero integer not null check (numero >= 0),
	descripcion varchar(128) not null);
GO
create table Asignatura(
	id integer not null primary key identity(1,1), 
	area_id integer not null,
	regimen_id integer not null,
	nombre varchar(256) not null,
	horassemana integer not null,
	horascuatrimestre integer not null,
	creditos integer not null,
	foreign key (area_id) references Area(id),
	foreign key (regimen_id) references Regimen(id));
GO
create table MateriasPlan(
	id integer not null primary key identity(1,1),
	plan_id integer not null,
	asignatura_id integer,
	nivel_id integer not null,
	cuatrimestre_id integer not null,
	Foreign Key(plan_id) references PlanEstudio(id),
	Foreign Key(asignatura_id) references Asignatura(id),
	Foreign Key(nivel_id) references Nivel(id),
	Foreign Key(cuatrimestre_id) references Cuatrimestre(id));
GO
create table Correlativas(
	id integer not null primary key identity(1,1),
	asignatura_id integer not null,
	correlativa_id integer not null,
	foreign key (asignatura_id) references Asignatura(id),
	foreign key (correlativa_id) references Asignatura(id));
	
create unique index uix_correlativas on Correlativas(asignatura_id, correlativa_id);
GO
create table Persona (
	id integer not null primary key identity(1,1),
	apellido varchar(64) not null,
	nombre varchar(64) not null,
	dni integer not null unique);
GO
create table Alumno(
	id integer not null primary key identity(1,1),
	persona_id integer not null,
	planestudio_id integer not null,
	legajo integer not null,
	foreign key (persona_id) references Persona(id),
	foreign key (planestudio_id) references PlanEstudio(id));
GO
create table TipoEvaluacion(
	id integer not null primary key identity(1,1),
	nombre varchar(128) not null unique);
GO
create table Evaluacion(
	id integer not null primary key identity(1,1),
	tipoevaluacion_id integer not null,
	materiaplan_id integer not null,
	fecha datetime not null,
	aprobada_sn char(1) not null check (aprobada_sn in ('S','N')),
	calificacion float);
GO
create table Profesor(
	id integer not null primary key identity(1,1),
	persona_id integer not null,
	materiaplan_id integer not null,
	legajo integer not null,
	foreign key (persona_id) references Persona(id),
	foreign key (materiaplan_id) references MateriasPlan(id));
GO
