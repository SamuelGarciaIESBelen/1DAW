drop database if exists Farmacias;
create database Farmacias character set utf8mb4 collate utf8mb4_spanish_ci;
use Farmacias;

create table Persona (
	dni 		char(9)			primary key,
    nombre		varchar(30)		not null,
    salario 	dec(6,2)		not null,
    index IN_Persona_nombre (nombre)
);

create table Empleado (
	dni 			char(9)		primary key,
    fechaTitulo		date		not null,
    constraint foreign key FK_Empleado_Persona (dni) references Persona (dni)
);

create table Farmaceutico (
	dni 			char(9)		primary key,
    fechaTitulo		date		not null,
    constraint foreign key FK_Farmaceutico_Persona (dni) references Persona (dni)
);

create table Ciudad (
	nombre			varchar(50)		primary key,
    idFarmaceutico	char(9)			not null,
    constraint foreign key FK_Ciudad_Farmaceutico (idFarmaceutico) references Farmaceutico (dni)
);

create table Farmacia (
	numero		int(10)			primary key,				
    nombre		varchar(30)		not null,
    direccion	varchar(100)	unique	not null,
    ciudad		varchar(50)		not null,
    constraint foreign key FK_Farmacia_Ciudad (ciudad) references Ciudad (nombre),
    index IN_Farmacia_Nombre (nombre)
);

create table TrabajaEn (
	idFarmacia	int(10),
    idPersona	char(9),
    constraint primary key (idFarmacia, idPersona),
    constraint foreign key FK_TrabajaEn_Farmacia (idFarmacia) references Farmacia (numero),
    constraint foreign key FK_TrabajaEn_Persona (idPersona) references Persona (dni)
);

create table PrincipioActivo (
	codigo			varchar(20)		primary key,
    descripcion 	varchar(200) 	not null
);

create table AccionTerapeutica (
	accion			varchar(20)		primary key,
    descripcion 	varchar(200) 	not null
);

create table Laboratorio (
	codigo	varchar(20)		primary key,
    nombre	varchar(50)		not null,
    index IN_Laboratorio_Nombre (nombre)
);

create table Medicamento (
	codigo		varchar(20)		primary key,
	nombre		varchar(100)	unique not null,
    precio		dec(5,2)		not null,
    contenido	varchar(50)		not null,
    index IN_Medicamento_Nombre (nombre)
);

create table Contiene (
	idMedicamento	varchar(20),
    idPrincipio		varchar(20),
    constraint primary key (idMedicamento, idPrincipio),
    constraint foreign key FK_Contiene_Medicamento (idMedicamento) references Medicamento (codigo),
    constraint foreign key FK_Contiene_PrincipioActivo (idPrincipio) references PrincipioActivo (codigo)
);

create table SirvePara (
	idMedicamento	varchar(20),
    idAccion		varchar(20),
    constraint primary key (idMedicamento, idAccion),
    constraint foreign key FK_SirvePara_Medicamento (idMedicamento) references Medicamento (codigo),
    constraint foreign key FK_SirvePara_AccionTerapeutica (idAccion) references AccionTerapeutica (accion)
);

create table Stock (
	idFarmacia			int(10),
    idMedicamento		varchar(20),
    tipoPresentacion	varchar(50),
    cantidad			int				not null,
    constraint primary key (idFarmacia, idMedicamento, tipoPresentacion),
    constraint foreign key FK_Stock_Farmacia (idFarmacia) references Farmacia (numero),
    constraint foreign key FK_Stock_Medicamento (idMedicamento) references Medicamento (codigo)
);