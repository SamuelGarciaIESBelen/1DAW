DROP DATABASE IF EXISTS proveedores;

CREATE DATABASE proveedores
	CHARACTER SET utf8
	COLLATE utf8_spanish2_ci;

USE proveedores;

CREATE TABLE articulo (
  codigo INTEGER NOT NULL PRIMARY KEY,
  denominacion VARCHAR(100) NOT NULL,
  cantidad INTEGER NOT NULL,
  precio INTEGER NOT NULL,
  stock INTEGER NOT NULL,
  departamento INTEGER NOT NULL
);

CREATE TABLE provart (
  codigo_proveedor INTEGER NOT NULL,
  codigo_articulo INTEGER NOT NULL,
  CONSTRAINT PRIMARY KEY (codigo_proveedor, codigo_articulo)
);

CREATE TABLE proveedor (
  codigo INTEGER NOT NULL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  localidad VARCHAR(100) NOT NULL,
  cod_jefe INTEGER NULL
);

INSERT INTO articulo (codigo, denominacion, cantidad, precio, stock, departamento) VALUES
(114, 'ALETAS', 8000, 13, 0, 1),
(120, 'REGULADOR', 30000, 13, 0, 1),
(121, 'REGULADOR', 20000, 10, 0, 1),
(200, 'CINTURON', 10000, 10, 0, 2),
(212, 'BOTAS', 7000, 10, 10, 2),
(213, 'GRASA', 600, 15, 0, 2),
(214, 'BOTAS', 11900, 10, 0, 2),
(215, 'ZODIAC', 189000, 5, 0, 2),
(228, 'GRASA', 300, 15, 0, 2),
(315, 'ZAPATOS', 10300, 20, 0, 3),
(316, 'TRAJE', 20540, 10, 0, 3);

INSERT INTO provart (codigo_proveedor, codigo_articulo) VALUES
(1, 114),
(1, 212),
(1, 228),
(3, 120),
(3, 212),
(3, 213),
(5, 120),
(5, 200),
(5, 214),
(12, 114),
(12, 215),
(14, 214),
(14, 228),
(18, 121),
(18, 315),
(18, 316),
(20, 200),
(21, 114),
(21, 215),
(23, 120),
(23, 228),
(23, 315),
(27, 228),
(27, 315),
(27, 316);

INSERT INTO proveedor (codigo, nombre, localidad, cod_jefe) VALUES
(0, 'ANDRES', 'MADRID', NULL),
(1, 'ERNESTO', 'SEVILLA', 18),
(3, 'ADOLFO', 'CADIZ', 11),
(5, 'EDUARDO', 'VALENCIA', 23),
(11, 'FRANCISCO', 'MADRID', 0),
(12, 'ANTONIO', 'MALAGA', 18),
(14, 'LUIS', 'MALAGA', 11),
(18, 'JOSE', 'MADRID', NULL),
(20, 'JESUS', 'BARCELONA', NULL),
(21, 'MANUEL', 'BILBAO', 23),
(23, 'JUAN LUIS', 'VIGO', 37),
(27, 'PEDRO', 'GRANADA', 11),
(37, 'CARLOS', 'MADRID', 11);

ALTER TABLE proveedor ADD CONSTRAINT FOREIGN KEY (cod_jefe) REFERENCES proveedor(codigo);

ALTER TABLE provart ADD CONSTRAINT FOREIGN KEY (codigo_proveedor) REFERENCES proveedor (codigo),
                    ADD CONSTRAINT FOREIGN KEY (codigo_articulo) REFERENCES articulo (codigo);
