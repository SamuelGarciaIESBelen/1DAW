
DROP DATABASE if EXISTS Telefonica;

CREATE DATABASE Telefonica CHARACTER SET UTF8MB4 COLLATE UTF8MB4_SPANISH_CI;
USE Telefonica;

CREATE TABLE Terminal (
	numero				INT(9)			PRIMARY KEY,
	tipo					CHAR(1) 			NOT NULL,
	nombre_abonado		VARCHAR(30) 	NOT NULL
);

CREATE TABLE Llamada (
	id_emisor			INT(9),
	id_receptor			INT(9),
	duracion				INT			NOT NULL,
	fecha_comienzo		DATE,
	CONSTRAINT PRIMARY KEY (id_emisor, id_receptor, fecha_comienzo),
	CONSTRAINT FOREIGN KEY FK_Llamada_Terminal_emisor(id_emisor) REFERENCES Terminal(numero),
	CONSTRAINT FOREIGN KEY FK_Llamada_Terminal_receptor(id_receptor) REFERENCES Terminal(numero)
);