
DROP DATABASE if exists geografia;

CREATE DATABASE if NOT EXISTS geografia CHARACTER SET utf8mb4 COLLATE UTF8MB4_SPANISH_CI;
USE geografia;

CREATE TABLE rio (
	nombre		VARCHAR(50)		PRIMARY KEY,
	longitud		INT				NOT NULL,
	caudal		DEC(9, 2)		NOT NULL
);

CREATE TABLE ccaa (
	nombre		VARCHAR(50)		PRIMARY KEY,
	num_hab		INT 				NOT NULL
);

CREATE TABLE discurre (
	id_rio		VARCHAR(50),
	id_ccaa		VARCHAR(50),
	kms			INT				NOT NULL,
	CONSTRAINT PRIMARY KEY (id_rio, id_ccaa),
	CONSTRAINT FOREIGN KEY FK_discurre_rio(id_rio) REFERENCES rio(nombre),
	CONSTRAINT FOREIGN KEY FK_discurre_ccaa(id_ccaa) REFERENCES ccaa(nombre)
);

CREATE TABLE ciudad (
	nombre		VARCHAR(50) 	PRIMARY KEY,
	num_hab		INT 				NOT NULL,
	id_ccaa		VARCHAR(50) 	NOT NULL,
	CONSTRAINT FOREIGN KEY FK_ciudad_ccaa(id_ccaa) REFERENCES ccaa(nombre)
);

CREATE TABLE pasa (
	id_rio		VARCHAR(50),
	id_ciudad	VARCHAR(50),
	CONSTRAINT PRIMARY KEY (id_rio, id_ciudad),
	CONSTRAINT FOREIGN KEY FK_pasa_rio(id_rio) REFERENCES rio(nombre),
	CONSTRAINT FOREIGN KEY FK_pasa_ciudad(id_ciudad) REFERENCES ciudad(nombre)
);