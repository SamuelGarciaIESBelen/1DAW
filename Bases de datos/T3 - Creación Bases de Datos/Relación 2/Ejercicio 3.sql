drop database if exists Biblioteca;
create database Biblioteca character set utf8mb4 collate utf8mb4_spanish_ci;
use Biblioteca;

create table Libro (
	isbn		char(13)		primary key,
    titulo		varchar(50)		not null,
    autor		varchar(50)		not null,
    editorial	varchar(50)		not null,
    index IN_Libro_Titulo (titulo),
    index IN_Libro_Autor (autor)
);

create table Ejemplar (
	idLibro		varchar(15)		primary key,
    isbn		char(13)		not null,
    constraint foreign key FK_Ejemplar_Libro (isbn) references Libro (isbn)
);

create table Usuario (
	dni			char(9) 		primary key,
    nombre 		varchar(50)		not null,
    direccion	 varchar(100) 	not null,
    localidad 	varchar(50) 	not null,
    cp 			char(5) 		not null,
    index IN_Usuario_Nombre (nombre)
);

create table Prestamo (
	idLibro				varchar(15),
    idUsuario			char(9),
    fechaPrestamo		date,
    fechaDevolucion		date,
    constraint primary key (idLibro, idUsuario, fechaPrestamo),
    constraint foreign key FK_Prestamo_Libro (idLibro) references Ejemplar (idLibro),
    constraint foreign key FK_Prestamo_Usuario (idUsuario) references Usuario (dni)
);