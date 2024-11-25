DROP database if EXISTS empleados;
CREATE DATABASE empleados CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE empleados;

#
# Table structure for table cliente
#

CREATE OR REPLACE TABLE cliente (
  numclie INTEGER NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  repclie INTEGER NULL,
  limite_credito DECIMAL(19,4) NOT NULL,
  CONSTRAINT PRIMARY KEY (numclie)
);

#
# Dumping data for table cliente
#

INSERT INTO cliente (numclie, nombre, repclie, limite_credito) VALUES (2101, 'Luis Garcia Antón', 106, 65000);
INSERT INTO cliente (numclie, nombre, repclie, limite_credito) VALUES (2102, 'Alvaro Rodríguez', 101, 65000);
INSERT INTO cliente (numclie, nombre, repclie, limite_credito) VALUES (2103, 'Jaime Llorens', 105, 50000);
INSERT INTO cliente (numclie, nombre, repclie, limite_credito) VALUES (2105, 'Antonio Canales', 101, 45000);
INSERT INTO cliente (numclie, nombre, repclie, limite_credito) VALUES (2106, 'Juan Suárez', 102, 65000);
INSERT INTO cliente (numclie, nombre, repclie, limite_credito) VALUES (2107, 'Julian Lopez', 110, 35000);
INSERT INTO cliente (numclie, nombre, repclie, limite_credito) VALUES (2108, 'Julia Antequera', 109, 55000);
INSERT INTO cliente (numclie, nombre, repclie, limite_credito) VALUES (2109, 'Alberto Juanes', 103, 25000);
INSERT INTO cliente (numclie, nombre, repclie, limite_credito) VALUES (2111, 'Cristóbal García', 103, 50000);
INSERT INTO cliente (numclie, nombre, repclie, limite_credito) VALUES (2112, 'María Silva', 108, 50000);
INSERT INTO cliente (numclie, nombre, repclie, limite_credito) VALUES (2113, 'Luisa Maron', 104, 20000);
INSERT INTO cliente (numclie, nombre, repclie, limite_credito) VALUES (2114, 'Cristina Bulini', 102, 20000);
INSERT INTO cliente (numclie, nombre, repclie, limite_credito) VALUES (2115, 'Vicente Martínez', 101, 20000);
INSERT INTO cliente (numclie, nombre, repclie, limite_credito) VALUES (2117, 'Carlos Tena', 106, 35000);
INSERT INTO cliente (numclie, nombre, repclie, limite_credito) VALUES (2118, 'Junipero Alvarez', 108, 60000);
INSERT INTO cliente (numclie, nombre, repclie, limite_credito) VALUES (2119, 'Salomon Bueno', 109, 25000);
INSERT INTO cliente (numclie, nombre, repclie, limite_credito) VALUES (2120, 'Juan Malo', 102, 50000);
INSERT INTO cliente (numclie, nombre, repclie, limite_credito) VALUES (2121, 'Vicente Ríos', 103, 45000);
INSERT INTO cliente (numclie, nombre, repclie, limite_credito) VALUES (2122, 'José Marchante', 105, 30000);
INSERT INTO cliente (numclie, nombre, repclie, limite_credito) VALUES (2123, 'José Libros', 102, 40000);
INSERT INTO cliente (numclie, nombre, repclie, limite_credito) VALUES (2124, 'Juan Bolto', 107, 40000);
#
# Table structure for table empleado
#

CREATE OR REPLACE TABLE empleado (
  numempl INTEGER NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  edad INTEGER NOT NULL,
  oficina INTEGER NULL,
  titulo VARCHAR(25) NOT NULL,
  contrato DATE NOT NULL,
  jefe INTEGER NULL,
  cuota INTEGER NULL,
  ventas INTEGER NOT NULL,
  CONSTRAINT PRIMARY KEY (numempl)
);

#
# Dumping data for table empleado
#

INSERT INTO empleado (numempl, nombre, edad, oficina, titulo, contrato, jefe, cuota, ventas) VALUES (101, 'Antonio Viguer', 45, 12, 'Representante', '2006-10-20', 104, 300000, 305000);
INSERT INTO empleado (numempl, nombre, edad, oficina, titulo, contrato, jefe, cuota, ventas) VALUES (102, 'Alvaro Jaumes', 48, 21, 'Representante', '2006-12-10', 108, 350000, 474000);
INSERT INTO empleado (numempl, nombre, edad, oficina, titulo, contrato, jefe, cuota, ventas) VALUES (103, 'Juan Rovira', 29, 12, 'Representante', '2007-03-01', 104, 275000, 286000);
INSERT INTO empleado (numempl, nombre, edad, oficina, titulo, contrato, jefe, cuota, ventas) VALUES (104, 'Jose Gonzalez', 33, 12, 'Dir Ventas', '2007-05-19', 106, 200000, 143000);
INSERT INTO empleado (numempl, nombre, edad, oficina, titulo, contrato, jefe, cuota, ventas) VALUES (105, 'Vicente Pantall', 37, 13, 'Representante', '2008-01-12', 104, 350000, 368000);
INSERT INTO empleado (numempl, nombre, edad, oficina, titulo, contrato, jefe, cuota, ventas) VALUES (106, 'Luis Antonio', 52, 11, 'Dir General', '2008-06-14', NULL, 275000, 299000);
INSERT INTO empleado (numempl, nombre, edad, oficina, titulo, contrato, jefe, cuota, ventas) VALUES (107, 'Jorge Gutierrez', 49, 22, 'Representante', '2008-11-14', 108, 300000, 186000);
INSERT INTO empleado (numempl, nombre, edad, oficina, titulo, contrato, jefe, cuota, ventas) VALUES (108, 'Ana Bustamante', 62, 21, 'Dir Ventas', '2009-10-12', 106, 350000, 361000);
INSERT INTO empleado (numempl, nombre, edad, oficina, titulo, contrato, jefe, cuota, ventas) VALUES (109, 'Maria Sunta', 31, 11, 'Representante', '2016-10-12', 106, 300000, 392000);
INSERT INTO empleado (numempl, nombre, edad, oficina, titulo, contrato, jefe, cuota, ventas) VALUES (110, 'Juan Victor', 41, NULL, 'Representante', '2010-01-13', 104, NULL, 760000);

#
# Table structure for table oficina
#

CREATE OR REPLACE TABLE oficina (
  oficina INTEGER NOT NULL,
  ciudad VARCHAR(30) NOT NULL,
  region VARCHAR(30) NOT NULL,
  dir INTEGER NULL,
  objetivo INTEGER NOT NULL,
  ventas INTEGER NULL,
  CONSTRAINT PRIMARY KEY (oficina)
);

#
# Dumping data for table oficina
#

INSERT INTO oficina (oficina, ciudad, region, dir, objetivo, ventas) VALUES (11, 'Valencia', 'Este', 106, 575000, 693000);
INSERT INTO oficina (oficina, ciudad, region, dir, objetivo, ventas) VALUES (12, 'Alicante', 'Este', 104, 800000, 735000);
INSERT INTO oficina (oficina, ciudad, region, dir, objetivo, ventas) VALUES (13, 'Castellon', 'Este', 105, 350000, 368000);
INSERT INTO oficina (oficina, ciudad, region, dir, objetivo, ventas) VALUES (21, 'Badajoz', 'Oeste', 108, 725000, 836000);
INSERT INTO oficina (oficina, ciudad, region, dir, objetivo, ventas) VALUES (22, 'A Coruña', 'Oeste', 108, 300000, 186000);
INSERT INTO oficina (oficina, ciudad, region, dir, objetivo, ventas) VALUES (23, 'Madrid', 'Centro', 108, 0, 0);
INSERT INTO oficina (oficina, ciudad, region, dir, objetivo, ventas) VALUES (24, 'Madrid', 'Centro', 108, 250000, 150000);
INSERT INTO oficina (oficina, ciudad, region, dir, objetivo, ventas) VALUES (26, 'Pamplona', 'Norte', NULL, 0, NULL);
INSERT INTO oficina (oficina, ciudad, region, dir, objetivo, ventas) VALUES (28, 'Valencia', 'Este', NULL, 900000, NULL);

#
# Table structure for table pedido
#

CREATE OR REPLACE TABLE pedido (
  codigo INTEGER NOT NULL,
  num_pedido INTEGER NOT NULL,
  fecha_pedido DATE NOT NULL,
  cliente INTEGER NOT NULL,
  rep INTEGER NOT NULL,
  fab VARCHAR(5) NOT NULL,
  producto VARCHAR(50) NOT NULL,
  cantidad INTEGER NOT NULL,
  importe DECIMAL(19,4) NOT NULL,
  CONSTRAINT PRIMARY KEY (codigo)
);

#
# Dumping data for table 'pedido'
#

INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (1, 110036, '2016-01-02', 2107, 110, 'aci', '4100z', 9, 22500);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (2, 110036, '2016-01-02', 2117, 106, 'rei', '2a44l', 7, 31500);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (3, 112963, '2016-05-10', 2103, 105, 'aci', '41004', 28, 3276);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (4, 112968, '2010-01-11', 2102, 101, 'aci', '41004', 34, 3978);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (5, 112975, '2016-02-11', 2111, 103, 'rei', '2a44g', 6, 2100);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (6, 112979, '2009-10-12', 2114, 108, 'aci', '4100z', 6, 15000);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (7, 112983, '2016-05-10', 2103, 105, 'aci', '41004', 6, 702);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (8, 112987, '2016-01-01', 2103, 105, 'aci', '4100y', 11, 27500);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (9, 112989, '2016-12-10', 2101, 106, 'fea', '114', 6, 1458);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (10, 112992, '2010-04-15', 2118, 108, 'aci', '41002', 10, 760);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (11, 112993, '2016-03-10', 2106, 102, 'rei', '2a45c', 24, 1896);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (12, 112997, '2016-04-04', 2124, 107, 'bic', '41003', 1, 652);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (13, 113003, '2016-02-05', 2108, 109, 'imm', '779', 3, 5625);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (14, 113007, '2016-01-01', 2112, 108, 'imm', '773c', 3, 2925);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (15, 113012, '2016-05-05', 2111, 105, 'aci', '41003', 35, 3745);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (16, 113013, '2016-08-06', 2118, 108, 'bic', '41003', 1, 652);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (17, 113024, '2016-07-04', 2114, 108, 'qsa', 'xk47', 20, 7100);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (18, 113027, '2016-02-05', 2103, 105, 'aci', '41002', 54, 4104);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (19, 113034, '2016-11-05', 2107, 110, 'rei', '2a45c', 8, 632);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (20, 113042, '2016-01-01', 2113, 101, 'rei', '2a44r', 5, 22500);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (21, 113045, '2016-07-02', 2112, 108, 'rei', '2a44r', 10, 45000);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (22, 113048, '2016-02-02', 2120, 102, 'imm', '779', 2, 3750);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (23, 113049, '2016-04-04', 2118, 108, 'qsa', 'xk47', 2, 776);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (24, 113051, '2016-07-06', 2118, 108, 'qsa', 'xk47', 4, 1420);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (25, 113055, '2010-04-01', 2108, 101, 'aci', '4100x', 6, 150);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (26, 113057, '2016-11-01', 2111, 103, 'aci', '4100x', 24, 600);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (27, 113058, '2009-07-04', 2108, 109, 'fea', '112', 10, 1480);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (28, 113062, '2016-07-04', 2124, 107, 'bic', '41003', 10, 2430);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (29, 113065, '2016-06-03', 2106, 102, 'qsa', 'xk47', 6, 2130);
INSERT INTO pedido (codigo, num_pedido, fecha_pedido, cliente, rep, fab, producto, cantidad, importe) VALUES (30, 113069, '2016-08-01', 2109, 107, 'imm', '773c', 22, 31350);

#
# Table structure for table producto
#

CREATE OR REPLACE TABLE producto (
  id_fab VARCHAR(5) NOT NULL,
  id_producto VARCHAR(50) NOT NULL,
  descripcion VARCHAR(50) NOT NULL,
  precio DECIMAL(19,4) NOT NULL,
  existencias INTEGER NOT NULL,
  CONSTRAINT PRIMARY KEY (id_fab, id_producto)
);

#
# Dumping data for table 'producto'
#

INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('aci', '41001', 'arandela', 58, 277);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('aci', '41002', 'bisagra', 80, 167);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('aci', '41003', 'art t3', 112, 207);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('aci', '41004', 'art 14', 123, 139);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('aci', '4100x', 'junta', 26, 37);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('aci', '4100y', 'extractor', 2888, 25);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('aci', '4100z', 'mont', 2625, 28);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('bic', '41003', 'manivela', 652, 3);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('bic', '41089', 'rodamiento', 225, 78);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('bic', '41672', 'plato', 180, 0);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('fea', '112', 'cubo', 148, 115);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('fea', '114', 'cubo', 243, 15);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('imm', '773c', 'reostato', 975, 28);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('imm', '775', 'reostato 2', 1425, 5);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('imm', '779', 'reostato 3', 1875, 0);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('imm', '887h', 'caja clavos', 54, 223);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('imm', '887p', 'perno', 25, 24);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('imm', '887x', 'manivela', 475, 32);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('qsa', 'xk47', 'red', 355, 38);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('qsa', 'xk48', 'red', 134, 203);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('qsa', 'xk48a', 'red', 117, 37);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('rei', '2a44g', 'pas', 350, 14);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('rei', '2a44l', 'bomba l', 4500, 12);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('rei', '2a44r', 'bomba r', 4500, 12);
INSERT INTO producto (id_fab, id_producto, descripcion, precio, existencias) VALUES ('rei', '2a45c', 'junta', 79, 210);

# Foreign Keys

ALTER TABLE cliente ADD CONSTRAINT FOREIGN KEY (repclie) REFERENCES empleado(numempl);

ALTER TABLE empleado ADD CONSTRAINT FOREIGN KEY (oficina) REFERENCES oficina(oficina);

ALTER TABLE pedido ADD CONSTRAINT FOREIGN KEY (cliente) REFERENCES cliente(numclie);

ALTER TABLE pedido ADD CONSTRAINT FOREIGN KEY (rep) REFERENCES empleado(numempl);

ALTER TABLE pedido ADD CONSTRAINT FOREIGN KEY (fab,producto) REFERENCES producto(id_fab, id_producto);

ALTER TABLE oficina ADD CONSTRAINT FOREIGN KEY (dir) REFERENCES empleado(numempl);

CREATE INDEX idx_cliente_nombre ON cliente(nombre);

CREATE INDEX idx_empleado_nombre ON empleado(nombre);

CREATE INDEX idx_oficina_ciudad ON oficina(ciudad);

CREATE INDEX idx_pedido_num ON pedido(num_pedido);

CREATE INDEX idx_pedido_cliente ON pedido(cliente);