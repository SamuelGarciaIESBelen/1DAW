
DROP DATABASE if EXISTS Autobuses;

CREATE DATABASE Autobuses CHARACTER SET UTF8MB4 COLLATE UTF8MB4_SPANISH_CI;
USE Autobuses;

CREATE TABLE Conductor (
	dni					CHAR(9) 		PRIMARY KEY,
	nombre				VARCHAR(30)		NOT NULL,
	primer_apellido	VARCHAR(20)		NOT NULL,
	antig					INT				NOT NULL,
	INDEX IN_Conductor_nombre_completo(nombre, primer_apellido)
);

CREATE TABLE Autobus (
	linea			CHAR(3) 	PRIMARY KEY,
	asientos		INT		NOT NULL
);

CREATE TABLE Asignado (
	id_conductor1		CHAR(9),
	id_conductor2		CHAR(9),
	id_dia				DATE,
	id_autobus			CHAR(3) 	NOT NULL,
	CONSTRAINT PRIMARY KEY (id_conductor1, id_conductor2, id_dia),
	CONSTRAINT FOREIGN KEY FK_Asignado_Conductor1(id_conductor1) REFERENCES Conductor(dni),
	CONSTRAINT FOREIGN KEY FK_Asignado_Conductor2(id_conductor2) REFERENCES Conductor(dni),
	CONSTRAINT FOREIGN KEY FK_Asignado_Autobus(id_autobus) REFERENCES Autobus(linea)
);

CREATE TABLE Parada (
	direccion					VARCHAR(50) 	PRIMARY KEY,
	hora_primera_llegada		TIME				NOT NULL,
	frecuencia					INT				NOT NULL
);

CREATE TABLE Realiza (
	id_autobus	CHAR(3),
	id_parada	VARCHAR(50),
	CONSTRAINT PRIMARY KEY (id_autobus, id_parada),
	CONSTRAINT FOREIGN KEY FK_Realiza_Autobus(id_autobus) REFERENCES Autobus(linea),
	CONSTRAINT FOREIGN KEY FK_Realiza_Parada(id_parada) REFERENCES Parada(direccion)
);