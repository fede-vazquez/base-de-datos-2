create table Comercio (
    id integer not null primary key identity(1,1),
    razonsocial varchar(256) not null,
    cuit varchar(20) not null);

create table TipoProducto (
    id integer not null primary key identity(1,1),
    nombre varchar(256) not null unique);

create table Producto (
    id integer not null primary key identity(1,1),
    tipoproducto_id integer not null,
    nombre varchar(256) not null,
    nombretkt varchar(32) not null,
    activo_sn char(1) not null default 'S'
    check (activo_sn in ('S','N')),
    foreign key (tipoproducto_id) references TipoProducto(id));

create table Proveedor(
    id integer not null primary key identity(1,1),
    razonsocial varchar(256) not null,
    cuit varchar(20) not null);

create table ProductoProveedor(
    id integer not null primary key identity(1,1),
    proveedor_id integer not null,
    producto_id integer not null,
    preciounitario float not null default 0
    check (preciounitario >= 0),
    ganancia float not null default 0
    check (ganancia >= 0),
    foreign key (proveedor_id) references Proveedor(id),
    foreign key (producto_id) references Producto(id));

create unique index uix_ProductoProveedor
on ProductoProveedor(proveedor_id, producto_id);

create table HistoricoPrecio (
    id integer not null primary key identity(1,1),
    productoproveedor_id integer not null,
    preciounitario float not null,
    ganancia float not null,
    fecha datetime not null default GETDATE(),
    foreign key (productoproveedor_id) 
    references ProductoProveedor(id));

create table CabeceraTicket (
    id integer not null primary key identity(1,1),
    comercio_id integer not null,
    fecha datetime not null default GETDATE(),
    texto varchar(512),
    foreign key (comercio_id) references Comercio(id));

create table ItemTicket(
    id integer not null primary key identity(1,1),
    cabeceraticket_id integer not null,
    productoproveedor_id integer not null,
    cantidadproductos integer not null default 1
    check (cantidadproductos > 1),
    texto varchar(64),
    foreign key (cabeceraticket_id)
    references CabeceraTicket(id),
    foreign key (productoproveedor_id)
    references ProductoProveedor(id));

create table Stock (
    id integer not null primary key identity(1,1),
    productoproveedor_id integer not null,
    cantidadminima integer not null
    check (cantidadminima >= 0),
    cantidadactual integer not null
    check (cantidadactual >= 0),
    foreign key (productoproveedor_id)
    references ProductoProveedor(id));

create table Compras(
    id integer not null primary key identity(1,1),
    productoproveedor_id integer not null,
    preciounitario float not null 
    check (preciounitario >= 0),
    fecha datetime not null default GETDATE(),
    cantidad integer not null 
    check (cantidad >= 0),
    foreign key (productoproveedor_id)
    references ProductoProveedor(id));
