drop database if exists Liga;
create database Liga character set utf8mb4 collate utf8mb4_spanish_ci;
use Liga;

create table Jugador (
	equipo		varchar(50),
    numero		int(2),
    nombre		varchar(100)	not null,
    posicion	varchar(20)		not null,
    constraint primary key (equipo, numero),
    index IN_Jugador_Nombre (nombre)
);

create table Entrenador (
	licencia	char(8)			primary key,
    nombre		varchar(100)	not null,
    index IN_Entrenador_Nombre (nombre)
);

create table Equipo (
	nombre			varchar(50)		primary key,
    idEntrenador	char(8)			not null,
    numCapitan		int(2)			not null,
    constraint foreign key FK_Equipo_Entrenador (idEntrenador) references Entrenador (licencia),
    constraint foreign key FK_Equipo_Capitan (nombre, numCapitan) references Jugador (equipo, numero)
);

create table Colores (
	idEquipo	varchar(50),
    color		varchar(20),
    constraint primary key (idEquipo, color),
    constraint foreign key FK_Colores_Equipo (idEquipo) references Equipo (nombre)
);

alter table Jugador add constraint foreign key FK_Jugador_Equipo (equipo) references Equipo (nombre);