
DROP DATABASE if EXISTS Inmuebles;

CREATE DATABASE Inmuebles CHARACTER SET UTF8MB4 COLLATE UTF8MB4_SPANISH_CI;
USE Inmuebles;

CREATE TABLE Persona (
	dni			CHAR(9)			PRIMARY KEY,
	nombre		VARCHAR(30)		NOT NULL,
	apellido1	VARCHAR(30)		NOT NULL,
	apellido2	VARCHAR(30)		NOT NULL,
	INDEX IN_Persona_nombre_completo(nombre, apellido1, apellido2)
);

CREATE TABLE Vivienda (
	direccion		VARCHAR(50)		PRIMARY KEY,
	superficie		INT				NOT NULL
);

CREATE TABLE Pertenece (
	propietario		CHAR(9),
	direccion		VARCHAR(50),
	CONSTRAINT PRIMARY KEY (propietario, direccion),
	CONSTRAINT FOREIGN KEY FK_Pertenece_Persona(propietario) REFERENCES Persona(dni),
	CONSTRAINT FOREIGN KEY FK_Pertenece_Vivienda(direccion) REFERENCES Vivienda(direccion)
);

CREATE TABLE Poliza (
	num_poliza 		CHAR(12)			PRIMARY KEY,
	propietario		CHAR(9)			NOT NULL,
	inmueble			VARCHAR(50) 	NOT NULL,
	ctd_asegurada	INT(9)			NOT NULL,
	cuota				INT(9)			NOT NULL,
	tipo				CHAR(3)			NOT NULL,
	CONSTRAINT FOREIGN KEY FK_Poliza_Persona(propietario) REFERENCES Persona(dni),
	CONSTRAINT FOREIGN KEY FK_Poliza_Vivienda(inmueble) REFERENCES Vivienda(direccion)
);