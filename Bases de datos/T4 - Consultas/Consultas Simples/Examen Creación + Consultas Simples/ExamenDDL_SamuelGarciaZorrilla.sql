DROP DATABASE if EXISTS ExamenDDL;
CREATE DATABASE ExamenDDL CHARACTER SET UTF8MB4 COLLATE UTF8MB4_SPANISH_CI;
USE ExamenDDL;

# EJERCICIO 1
CREATE TABLE propietario (
	dni				CHAR(9)			PRIMARY KEY,
	nombre			VARCHAR(20)		NOT NULL,
	apellidos 		VARCHAR(30)		NOT NULL,
	fecha_carnet	DATE,
	INDEX IN_nombre_apellidos (nombre, apellidos)
	#DROP COLUMN ON CASCADE
);

CREATE TABLE coche (
	matricula	CHAR(7)			PRIMARY KEY,
	marca 		VARCHAR(30)		NOT NULL,
	numPuertas 	INT 				NOT NULL,
	dni 			CHAR(9) 			NOT NULL,
	CONSTRAINT FOREIGN KEY FK_coche_propietario (dni) REFERENCES propietario (dni)
);

CREATE TABLE moto (
	matricula	CHAR(7)			PRIMARY KEY,
	marca 		VARCHAR(30)		NOT NULL,
	dni 			CHAR(9) 			NOT NULL,
	CONSTRAINT FOREIGN KEY FK_moto_propietario (dni) REFERENCES propietario (dni)
);

CREATE TABLE camion (
	matricula	CHAR(7),
	marca 		VARCHAR(30)		NOT NULL,
	dni 			CHAR(9) 			NOT NULL,
	CONSTRAINT PRIMARY KEY (matricula),
	CONSTRAINT FOREIGN KEY FK_camion_propietario (dni) REFERENCES propietario (dni)
);

CREATE TABLE multa (
	dni 			CHAR(9) 	NOT NULL,
	matricula	CHAR(7)	NOT NULL,
	fecha			DATE		NOT NULL
);

# EJERCICIO 2
ALTER TABLE multa ADD CONSTRAINT FOREIGN KEY FK_multa_propietario (dni) REFERENCES propietario (dni);
ALTER TABLE multa ADD CONSTRAINT FOREIGN KEY FK_multa_coche (matricula) REFERENCES coche (matricula);

# EJERCICIO 3
ALTER TABLE multa ADD COLUMN importe DEC(6,2);

# EJERCICIO 4
ALTER TABLE camion DROP CONSTRAINT FK_camion_propietario;

# EJERCICIO 5
ALTER TABLE multa RENAME COLUMN importe TO cantidad;

# EJERCICIO 6
ALTER TABLE propietario ADD CHECK(fecha_carnet < '2024-03-07');

# EJERCICIO 7
ALTER TABLE coche MODIFY COLUMN marca VARCHAR(50) NOT NULL;