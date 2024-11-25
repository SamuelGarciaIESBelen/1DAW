
DROP DATABASE if EXISTS Horarios;

CREATE DATABASE Horarios CHARACTER SET UTF8MB4 COLLATE UTF8MB4_SPANISH_CI;
USE Horarios;

CREATE TABLE Profesor (
	idProf	INT				PRIMARY KEY,
	nombre	VARCHAR(30)		NOT NULL,
	dpto		VARCHAR(30)		NOT NULL,
	INDEX IN_Profesor_Nombre_Departamento (nombre, dpto)
);

CREATE TABLE Aula (
	num					INT		PRIMARY KEY,
	capacidad			INT		NOT NULL,
	numOrdenadores		INT,
	altoPizarra			INT,
	anchoPizarra		INT
);

CREATE TABLE Asignatura (
	idAsignatura	INT				PRIMARY KEY,
	nombre			VARCHAR(30)		NOT NULL,
	cuatrimestre	INT				NOT NULL,
	aula				INT				NOT NULL,
	profesor			INT				NOT NULL,
	CONSTRAINT FOREIGN KEY FK_Asignatura_Aula(aula) REFERENCES Aula(num),
	CONSTRAINT FOREIGN KEY FK_Asignatura_Profesor(profesor) REFERENCES Profesor(idProf)
);