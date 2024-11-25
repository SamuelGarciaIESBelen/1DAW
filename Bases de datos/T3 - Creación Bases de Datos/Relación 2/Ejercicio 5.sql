drop database if exists Intercambio;
create database Intercambio character set utf8mb4 collate utf8mb4_spanish_ci;
use Intercambio;

create table Alumno (
	nombre		varchar(100)	primary key,
    telefono	char(9)
);

create table Departamento (
	codigo		char(3)			primary key,
    nombre		varchar(100)	not null,
    index IN_Departamento_Nombre (nombre)
);

create table Parner (
	nombre		varchar(100)	primary key,
    telefono	char(9),
    idDpto		char(3)			not null,
    constraint foreign key FK_Parner_Departamento (idDpto) references Departamento (codigo)
);

create table Asignacion (
	idAlumno	varchar(100),
    trimestre	varchar(25),
    idDpto		char(3) 		not null,
    idParner	varchar(100)	not null,
    constraint primary key (idAlumno, trimestre),
    constraint foreign key FK_Asignacion_Alumno (idAlumno) references Alumno (nombre),
    constraint foreign key FK_Asignacion_Departamento (idDpto) references Departamento (codigo),
    constraint foreign key FK_Asignacion_Parner (idParner) references Parner (nombre)
);