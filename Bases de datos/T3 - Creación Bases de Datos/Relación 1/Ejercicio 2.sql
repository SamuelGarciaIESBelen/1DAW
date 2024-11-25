
DROP DATABASE if exists despachos;

CREATE DATABASE if not exists despachos CHARACTER SET utf8mb4 COLLATE UTF8MB4_SPANISH_CI;
USE despachos;

CREATE TABLE edificio (
	nombre			VARCHAR(50)		PRIMARY KEY,
	num_despachos	INT				NOT NULL,
	id_poligono		VARCHAR(50)		NOT NULL
);

CREATE TABLE departamento (
	nombre 			VARCHAR(50)		PRIMARY KEY,
	num_empleados	INT				NOT NULL
);

CREATE TABLE distribuido (
	id_edificio		VARCHAR(50),
	id_dpto			VARCHAR(50),
	num_dptos		INT				NOT NULL,
	CONSTRAINT PRIMARY KEY (id_edificio, id_dpto),
	CONSTRAINT FOREIGN KEY FK_distribuido_edificio_id_edificio(id_edificio) REFERENCES edificio(nombre),
	CONSTRAINT FOREIGN KEY FK_distribuido_departamento_id_dpto(id_dpto) REFERENCES departamento(nombre)
);

CREATE TABLE poligono (
	nombre			VARCHAR(50)		PRIMARY KEY,
	ciudad			VARCHAR(50)		NOT NULL,
	INDEX IN_poligono_ciudad(ciudad)
);

ALTER TABLE edificio ADD CONSTRAINT FOREIGN KEY FK_edificio_poligono_id_poligono(id_poligono) REFERENCES poligono(nombre);