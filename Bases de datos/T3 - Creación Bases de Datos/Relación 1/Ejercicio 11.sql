
DROP DATABASE if EXISTS ETT;

CREATE DATABASE ETT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_SPANISH_CI;
USE ETT;

CREATE TABLE Empresa (
	cif		CHAR(9)			PRIMARY KEY,
	nombre	VARCHAR(20)		NOT NULL,
	sector	VARCHAR(20)		NOT NULL,
	INDEX Empresa_Nombre_Sector (nombre, sector)
);

CREATE TABLE Multinacional (
	idEmpresa	CHAR(9)			PRIMARY KEY,
	numPaises	INT				NOT NULL,
	CONSTRAINT FOREIGN KEY FK_Multinacional_Empresa (idEmpresa) REFERENCES Empresa (cif)
);

CREATE TABLE Pyme (
	idEmpresa	CHAR(9)			PRIMARY KEY,
	ciudad		VARCHAR(20)		NOT NULL,
	CONSTRAINT FOREIGN KEY FK_Pyme_Empresa (idEmpresa) REFERENCES Empresa (cif)
);

CREATE TABLE Oferta (
	codigo			INT				PRIMARY KEY,
	profesion		VARCHAR(20)		NOT NULL,
	lugar				VARCHAR(20)		NOT NULL,
	condiciones		VARCHAR(30)		NOT NULL,
	idEmpresa		CHAR(9)			NOT NULL,
	CONSTRAINT FOREIGN KEY FK_Oferta_Empresa (idEmpresa) REFERENCES Empresa (cif)
);

CREATE TABLE Contrato (
	idOferta			INT,
	idPersona		CHAR(9),
	fechaContrato	DATE,
	duracion			INT			NOT NULL,
	sueldo			DEC(9,2) 	NOT NULL,
	CONSTRAINT PRIMARY KEY (idOferta, idPersona, fechaContrato),
	CONSTRAINT FOREIGN KEY FK_Contrato_Oferta (idOferta) REFERENCES Oferta (codigo)
);

CREATE TABLE Persona (
	dni			CHAR(9)			PRIMARY KEY,
	nombre		VARCHAR(50)		NOT NULL,
	estudios		VARCHAR(50)		NOT NULL,
	profesion	VARCHAR(20)		NOT NULL,
	INDEX Persona_Nombre_Profesion (nombre, profesion)
);

CREATE TABLE Interesa (
	idPersona	CHAR(9),
	idEmpleo		INT,
	CONSTRAINT PRIMARY KEY (idPersona, idEmpleo),
	CONSTRAINT FOREIGN KEY FK_Interesa_Persona (idPersona) REFERENCES Persona (dni),
	CONSTRAINT FOREIGN KEY FK_Interesa_Oferta (idEmpleo) REFERENCES Oferta (codigo)
);

ALTER TABLE Contrato ADD CONSTRAINT FOREIGN KEY FK_Contrato_Persona (idPersona) REFERENCES Persona (dni);
CREATE INDEX IN_Oferta_Profesion ON Oferta (profesion);