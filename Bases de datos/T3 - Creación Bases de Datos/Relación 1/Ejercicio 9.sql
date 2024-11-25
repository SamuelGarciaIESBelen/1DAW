
DROP DATABASE if EXISTS Editorial;

CREATE DATABASE Editorial CHARACTER SET UTF8MB4 COLLATE UTF8MB4_SPANISH_CI;
USE Editorial;

CREATE TABLE Periodista (
	dni				CHAR(9)			PRIMARY KEY,	
	nombre			VARCHAR(30)		NOT NULL,
	telefono			INT(9)			NOT NULL,
	especialidad	VARCHAR(20)		NOT NULL,
	INDEX Periodista_nombre(nombre)
);

CREATE TABLE Sucursal (
	codigo		INT				PRIMARY KEY,
	direccion	VARCHAR(50)		NOT NULL,
	telefono		INT(9)			NOT NULL
);

CREATE TABLE Empleado (
	dni			CHAR(9)			PRIMARY KEY,
	nombre		VARCHAR(30)		NOT NULL,
	telefono		INT(9)			NOT NULL,
	idSucursal	INT				NOT NULL,
	CONSTRAINT FOREIGN KEY FK_Empleado_Sucursal(idSucursal) REFERENCES Sucursal(codigo),
	INDEX Empleado_nombre(nombre)
);

CREATE TABLE Revista (
	numRegistro		INT				PRIMARY KEY,
	titulo			VARCHAR(20)		NOT NULL,
	periodicidad	INT				NOT NULL,
	tipo				VARCHAR(20)		NOT NULL,
	idSucursal		INT				NOT NULL,
	CONSTRAINT FOREIGN KEY FK_Revista_Sucursal(idSucursal) REFERENCES Sucursal(codigo),
	INDEX Revista_tipo (tipo)
);

CREATE TABLE Colabora (
	idRevista		INT,
	idPeriodista	CHAR(9),
	CONSTRAINT PRIMARY KEY (idRevista, idPeriodista),
	CONSTRAINT FOREIGN KEY FK_Colabora_Revista(idRevista) REFERENCES Revista(numRegistro),
	CONSTRAINT FOREIGN KEY FK_Colabora_Periodista(idPeriodista) REFERENCES Periodista(dni)
);

CREATE TABLE Seccion (
	idRevista	INT,
	titulo		VARCHAR(20),
	extension	INT				NOT NULL,
	CONSTRAINT PRIMARY KEY (idRevista, titulo),
	CONSTRAINT FOREIGN KEY FK_Seccion_Revista(idRevista) REFERENCES Revista(numRegistro)
);

CREATE TABLE Numero (
	idRevista				INT,
	fecha						DATE,
	paginas					INT 		NOT NULL,
	ejemplaresVendidos	INT		NOT NULL,
	CONSTRAINT PRIMARY KEY (idRevista, fecha),çd
	CONSTRAINT FOREIGN KEY FK_Numero_Revista(idRevista) REFERENCES Revista(numRegistro)
);