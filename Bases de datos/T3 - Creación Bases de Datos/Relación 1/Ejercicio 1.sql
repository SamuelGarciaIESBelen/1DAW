
CREATE DATABASE if not exists RRHH CHARACTER SET utf8mb4 COLLATE UTF8MB4_SPANISH_CI;
USE RRHH;
#DROP DATABASE RRHH;
CREATE TABLE empleado (
	dni			CHAR(9)		PRIMARY KEY,
	nombre		VARCHAR(50)	NOT NULL,
	fecha_nac	DATE			NOT NULL,
	salario		DEC(6, 2)	NOT NULL,
	id_dpto		VARCHAR(50)	NOT NULL
);

CREATE TABLE departamento (
	nombre			VARCHAR(50)	PRIMARY KEY,
	num_despacho	INT,
	id_jefe			CHAR(9)		NOT NULL,
	CONSTRAINT FOREIGN KEY fk_departamento_empleado_id_jefe(id_jefe) REFERENCES empleado(dni)
);

ALTER TABLE empleado ADD CONSTRAINT FOREIGN KEY fk_empleado_departamento_id_dpto(id_dpto) REFERENCES departamento(nombre);

CREATE INDEX IN_empleado_nombre ON empleado(nombre);