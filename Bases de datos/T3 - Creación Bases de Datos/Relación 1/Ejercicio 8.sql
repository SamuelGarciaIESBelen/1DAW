
DROP DATABASE if EXISTS Trafico;

CREATE DATABASE Trafico CHARACTER SET UTF8MB4 COLLATE UTF8MB4_SPANISH_CI;
USE Trafico;

CREATE TABLE Propietario (
	dni			CHAR(9)			PRIMARY KEY,
	nombre		VARCHAR(20)		NOT NULL,
	apellidos	VARCHAR (30)	NOT NULL,
	añosCarnet	INT				NOT NULL
);

CREATE TABLE Vehiculo (
	matricula		CHAR(7)			PRIMARY KEY,
	marca				VARCHAR(20)		NOT NULL,
	idPropietario	CHAR(9)			NOT NULL,
	CONSTRAINT FOREIGN KEY FK_Vehiculo_Propietario(idPropietario) REFERENCES Propietario(dni)
);

CREATE TABLE Coche (
	matricula	CHAR(7)	PRIMARY KEY,
	numPuertas	INT		NOT NULL,
	CONSTRAINT FOREIGN KEY FK_Coche_Vechiculo(matricula) REFERENCES Vehiculo(matricula)
);

CREATE TABLE Moto (
	matricula	CHAR(7)	PRIMARY KEY,
	CONSTRAINT FOREIGN KEY FK_Moto_Vechiculo(matricula) REFERENCES Vehiculo(matricula)
);

CREATE TABLE Camion (
	matricula	CHAR(7)	PRIMARY KEY,
	tara			INT		NOT NULL,
	CONSTRAINT FOREIGN KEY FK_Camion_Vechiculo(matricula) REFERENCES Vehiculo(matricula)
);