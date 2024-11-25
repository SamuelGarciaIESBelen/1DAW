DROP DATABASE IF EXISTS motocicletas;

CREATE DATABASE motocicletas 
	CHARACTER SET utf8
	COLLATE utf8_spanish2_ci;

USE motocicletas;

--
-- Estructura de la tabla cliente
--
CREATE TABLE cliente (
  nif CHAR(9) PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  apellidos VARCHAR(255) NOT NULL,
  direccion VARCHAR(255)NOT NULL
);

--
-- Datos de la tabla cliente
--

INSERT INTO cliente (nif, nombre, apellidos, direccion) VALUES
('12365478V', 'Jorge', 'Lozano', 'C/Guay'),
('12587695U', 'George', 'Cortés', 'C/Música'),
('15975326T', 'Francisco Javier', 'Llamas', 'C/Carrefour'),
('36985214G', 'Manolo', 'Montoro', 'C/Continente'),
('65874952F', 'Leonardo', 'Chiapetta', 'C/Yogur'),
('74125896W', 'Jorge', 'Florido', 'C/Pryca'),
('75841236G', 'Alexis', 'Urbaneja', 'C/Importante'),
('78945632D', 'Pablo', 'Rodríguez', 'C/Guay'),
('85274196G', 'Gonzalo', 'Castillo', 'C/Lejana'),
('96478521H', 'Gabriel', 'Muñoz', 'C/SGBD');

--
-- Estructura de la tabla comercial
--

CREATE TABLE comercial (
  nif CHAR(9) PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  apellidos VARCHAR(255) NOT NULL
);

--
-- Datos de la tabla comercial
--

INSERT INTO comercial (nif, nombre, apellidos) VALUES
('11111222R', 'Ramiro', 'Castillo'),
('77777777G', 'Pedro', 'Ramírez'),
('78945632D', 'Pablo', 'Rodríguez');

--
-- Estructura de la tabla modelo
--

CREATE TABLE modelo (
  bastidor VARCHAR(255) PRIMARY KEY,
  cilindrada INTEGER NOT NULL,
  tipo VARCHAR(255) NOT NULL,
  precio DECIMAL(8,2) NOT NULL,
  fabricante VARCHAR(255) NOT NULL
);

--
-- Datos de la tabla modelo
--

INSERT INTO modelo (bastidor, cilindrada, tipo, precio, fabricante) VALUES
('25GTR445S22', 1100, 'Cross', 3500.00, 'KTM'),
('3579A4CV2E', 1200, 'Custom', 7500.00, 'Harley Davidson'),
('6YRE2846682', 1000, 'Cross', 7000.00, 'KTM'),
('8725492ERT2', 49, 'Scooter', 1250.00, 'Piaggio'),
('8759TY64W1', 49, 'Scooter', 1500.00, 'Piaggio'),
('87FER21DF44', 500, 'Cross', 3000.00, 'Derbi'),
('95478ASD12', 125, 'Scooter', 2500.00, 'Peugeot'),
('9R57Y83V335', 1100, 'Custom', 8000.00, 'Harley Davidson'),
('9RT45W3T45', 125, 'Scooter', 2000.00, 'Vespa'),
('9SW23F35GG', 1500, 'Deportiva', 7000.00, 'Kawasaki'),
('RT426HD34W', 1000, 'Deportiva', 4000.00, 'Yamaha');


--
-- Estructura de la tabla venta
--

CREATE TABLE venta (
  codigo INTEGER PRIMARY KEY,
  nif_cliente CHAR(9) NOT NULL,
  nif_comercial CHAR (9) NOT NULL,
  bastidor_modelo VARCHAR(255) NOT NULL,
  fecha_hora DATETIME NOT NULL
);

--
-- Datos de la tabla venta
--

INSERT INTO venta (codigo, nif_cliente, nif_comercial, bastidor_modelo, fecha_hora) VALUES
(1, '78945632D', '78945632D', '3579A4CV2E', '1985-11-10 23:00:00.000000'),
(2, '85274196G', '78945632D', '6YRE2846682', '2000-12-11 23:00:00.000000'),
(3, '96478521H', '77777777G', '8725492ERT2', '1990-05-01 22:00:00.000000'),
(4, '75841236G', '77777777G', '8759TY64W1', '2001-07-15 22:00:00.000000'),
(5, '74125896W', '77777777G', '87FER21DF44', '1999-09-07 22:00:00.000000'),
(6, '65874952F', '77777777G', '95478ASD12', '2005-06-02 22:00:00.000000'),
(7, '36985214G', '77777777G', 'RT426HD34W', '1989-04-01 22:00:00.000000'),
(8, '15975326T', '11111222R', '9R57Y83V335', '2000-12-11 23:00:00.000000'),
(9, '12587695U', '11111222R', '9RT45W3T45', '1989-12-21 23:00:00.000000'),
(10, '96478521H', '78945632D', '9SW23F35GG', '2003-06-29 22:00:00.000000'),
(11, '12365478V', '78945632D', '25GTR445S22', '1997-05-18 22:00:00.000000');

--
-- Claves Ajenas
--

--
-- Claves ajenas de venta
--
ALTER TABLE venta
  ADD FOREIGN KEY (nif_cliente) REFERENCES cliente(nif),
  ADD FOREIGN KEY (nif_comercial) REFERENCES comercial(nif),
  ADD FOREIGN KEY (bastidor_modelo) REFERENCES modelo(bastidor);

