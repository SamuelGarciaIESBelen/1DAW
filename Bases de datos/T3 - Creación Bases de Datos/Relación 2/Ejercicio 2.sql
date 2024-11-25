drop database if exists Facturacion;
create database Facturacion character set utf8mb4 collate utf8mb4_spanish_ci;
use Facturacion;

create table Cliente (
	cif			char(9)			primary key,
    nombre		varchar(100)	not null,
    localidad	varchar(50)		not null,
    numCalle	varchar(200)	not null,
    telefono	char(9)			not null,
    index IN_Cliente_Nombre (nombre),
    index IN_Cliente_Telefono (telefono)
);

create table Factura (
	numero		varchar(20)		primary key,
    fecha		date			not null,
    idCliente	char(9)			not null,
    constraint foreign key FK_Factura_Cliente (idCliente) references Cliente (cif)
);

create table LineaFactura (
	idFactura		varchar(20),
    lineaFactura	int,
    idProducto		char(20) 		not null,
    cantidad		int				not null,
    constraint primary key (idFactura, lineaFactura),
    constraint foreign key FK_LineaFactura_Factura (idFactura) references Factura (numero)
);

create table Producto (
	referencia	varchar(20)		primary key,
    nombre 		varchar(100)	not null,
    precio 		dec(6,2)		not null
);

alter table LineaFactura add constraint foreign key FK_LineaFactura_Producto (idProducto) references Producto (referencia);
create index IN_Producto_Nombre ON Producto (nombre);