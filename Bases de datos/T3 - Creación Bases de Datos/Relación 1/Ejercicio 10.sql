
DROP DATABASE if EXISTS Hosteleria;

CREATE DATABASE Hosteleria CHARACTER SET UTF8MB4 COLLATE UTF8MB4_SPANISH_CI;
USE Hosteleria;

CREATE TABLE Empleado (
	dni			CHAR(9)			PRIMARY KEY,
	nombre		VARCHAR(50)		NOT NULL,
	direccion	VARCHAR(50)		NOT NULL,
	INDEX IN_Empleado_Nombre (nombre)
);

CREATE TABLE Trabaja (
	dni		CHAR(9)			PRIMARY KEY,
	cif		CHAR(9)			NOT NULL,
	funcion	VARCHAR(20)		NOT NULL,
	CONSTRAINT FOREIGN KEY FK_Trabaja_Empleado (dni) REFERENCES Empleado (dni)
);

CREATE TABLE Recaudacion (
	idPub			CHAR(9),
	fecha 		DATE 			NOT NULL,
	cantidad 	INT 			NOT NULL,
	CONSTRAINT PRIMARY KEY (idPub, fecha)
);

CREATE TABLE Pub (
	cif 				CHAR(9) 			PRIMARY KEY,
	nombre			VARCHAR(20) 	NOT NULL,
	direccion		VARCHAR(50)		NOT NULL,
	fechaApertura	DATE				NOT NULL,
	horario			TIME				NOT NULL,
	diasApertura	INT				NOT NULL,
	INDEX IN_Pub_Nombre (nombre)
);

CREATE TABLE EsPropietario (
	idPub				CHAR(9),
	idPropietario	CHAR(9),
	CONSTRAINT PRIMARY KEY (idPub, idPropietario),
	CONSTRAINT FOREIGN KEY FK_EsPropietario_Pub (idPub) REFERENCES Pub (cif)
);

CREATE TABLE Propietario (
	dni			CHAR(9) 			PRIMARY KEY,
	nombre 		VARCHAR(50) 	NOT NULL,
	direccion	VARCHAR(50) 	NOT NULL
);

CREATE TABLE Pedido (
	numero			INT				PRIMARY KEY,
	fecha				DATE				NOT NULL,
	proveedor		VARCHAR(20)		NOT NULL,
	precioTotal		INT				NOT NULL,
	idPub				CHAR(9)			NOT NULL,
	CONSTRAINT FOREIGN KEY FK_Pedido_Pub (idPub) REFERENCES Pub (cif)
);

CREATE TABLE DetallePedido (
	idPedido		INT,
	idArticulo	INT,
	cantidad		INT,
	CONSTRAINT PRIMARY KEY (idPedido, idArticulo),
	CONSTRAINT FOREIGN KEY FK_DetallePedido_Pedido (idPedido) REFERENCES Pedido (numero)
);

CREATE TABLE Articulo (
	codigo	INT				PRIMARY KEY,
	nombre	VARCHAR(20)		NOT NULL,
	precio	INT				NOT NULL,
	INDEX IN_Articulo_Nombre (nombre)
);

CREATE TABLE Existencias (
	idPub			CHAR(9),
	idArticulo	INT,
	cantidad		INT,
	CONSTRAINT PRIMARY KEY (idPub, idArticulo),
	CONSTRAINT FOREIGN KEY FK_Existencias_Pub (idPub) REFERENCES Pub (cif),
	CONSTRAINT FOREIGN KEY FK_Existencias_Articulo (idArticulo) REFERENCES Articulo (codigo)
);

ALTER TABLE Recaudacion ADD CONSTRAINT FOREIGN KEY FK_Recaudacion_Pub (idPub) REFERENCES Pub (cif);
ALTER TABLE EsPropietario ADD CONSTRAINT FOREIGN KEY FK_EsPropietario_Propietario (idPropietario) REFERENCES Propietario (dni);
ALTER TABLE DetallePedido ADD CONSTRAINT FOREIGN KEY FK_DetallePedido_Articulo (idArticulo) REFERENCES Articulo (codigo);