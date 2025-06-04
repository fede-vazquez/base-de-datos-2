create table Comercio (
	id integer not null primary key identity(1,1), 
	razon_social varchar(128) not null,
	cuit varchar(20) not null
);
GO

create table CabeceraTicket(
	id integer not null primary key identity(1,1), 
	fecha varchar(128) not null,
	comercio_id integer not null,

	foreign key (comercio_id) references  Comercio(id),
);
GO

create table TipoProducto(
	id integer not null primary key identity(1,1),
	nombre varchar(128) not null,
);
GO

create table Producto(
	id integer not null primary key identity(1,1),
	nombre varchar(128) not null,
	nombre_kt varchar(64) not null,
	activo_sn char(1) not null default 'S' check (activo_sn in ('S', 'N')),
	tipoProducto_id integer not null,

	foreign key (tipoProducto_id) references  TipoProducto(id),
);
GO

create table Proveedor(
	id integer not null primary key identity(1,1),
	razon_social varchar(128) not null,
	cuit varchar(20) not null
);
GO

create table ProductoProveedor(
	id integer not null primary key identity(1,1),
	proveedor_id integer not null,
	producto_id integer not null,
	precio_unitario integer not null,
	ganancia integer not null,

	foreign key (proveedor_id) references  Proveedor(id),
	foreign key (producto_id) references  Producto(id),
);
GO

create table Stock(
	id integer not null primary key identity(1,1), 
	cantidad_minima integer not null,
	cantidad_actual integer not null,
	productoProveedor_id integer not null,

	foreign key (productoProveedor_id) references ProductoProveedor(id)
);
GO

create table ItemTicket(
	id integer not null primary key identity(1,1), 
	cabeceraTicket_id integer not null,
	productoProveedor_id integer not null,

	foreign key (cabeceraTicket_id) references  CabeceraTicket(id),
	foreign key (productoProveedor_id) references  ProductoProveedor(id),
);
GO

create table Compras(
	id integer not null primary key identity(1,1), 
	precio_unitario integer not null,
	fecha varchar(128) not null,
	cantidad integer not null,
	productoProveedor_id integer not null,

	foreign key (productoProveedor_id) references  ProductoProveedor(id),
);
GO

create table HistoricoPrecio(
	id integer not null primary key identity(1,1), 
	precio_unitario integer not null,
	ganancia integer not null,
	fecha varchar(128) not null,
	productoProveedor_id integer not null,

	foreign key (productoProveedor_id) references  ProductoProveedor(id),
);
GO