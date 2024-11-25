# INSERCIONES

CREATE OR REPLACE DATABASE ejemplos2;
USE ejemplos2;

CREATE TABLE departamento (
	codigo	INT(3)			PRIMARY KEY,
	nombre	VARCHAR(15) 	NOT NULL
);

CREATE TABLE empleado (
	codigo		INT(5)			PRIMARY KEY,
	dni			CHAR(9)			UNIQUE,
	nombre		VARCHAR(20)		NOT NULL,
	apellido 	VARCHAR(40)		NOT NULL,
	direccion 	VARCHAR(100),
	fecha_alta	DATE,
	telefono		INT(9),
	cod_dep 		INT(3)			REFERENCES departamento(codigo) ON DELETE SET NULL
);


# INSERCIÓN SOBRE TODOS LOS CAMPOS DE LA TABLA
INSERT INTO departamento VALUES (10, 'RRHH');
INSERT INTO empleado VALUES (1, '12345678A', 'Marta', 'García', 'C/ Islas Canarias', '2005-02-03', NULL, NULL);

# INSERCIÓN INDICANDO SOLO ALGUNOS VALORES
INSERT INTO empleado (codigo, nombre, apellido) VALUES (2, 'Marga', 'Jurado');

# INSERCIÓN DE VARIAS FILAS AL MISMO TIEMPO
INSERT INTO empleado (codigo, nombre, apellido) VALUES (3, 'Mario', 'Vargas'),
																		(4, 'Cristóbal', 'Velázquez');
# VIOLACIÓN DE CLAVE PRIMARIA
INSERT INTO empleado (codigo, nombre, apellido) VALUES (1, 'Juan', 'Silva');

# VIOLACIÓN DE CLAVE FORÁNEA
INSERT INTO empleado (codigo, nombre, apellido, cod_dep) VALUES (5, 'Juan', 'Silva', 50);

##########################################################################################################################

# INSERCIÓN DE DATOS CON SELECT
USE ejemplos;

CREATE OR REPLACE TABLE vendedores (
	emp_no		INT(4)			PRIMARY KEY,
	nomap			VARCHAR(30),
	salario		FLOAT(6, 2),
	comision		DEC(6, 2),
	dep_no		INT(2),
	CONSTRAINT FK_VEND_DEP_NO FOREIGN KEY (dep_no) REFERENCES departamentos (dep_no)
);

INSERT INTO vendedores
	SELECT emp_no, nomap, salario, comision, dep_no
	FROM empleados
	WHERE oficio = 'Vendedor';

SELECT * FROM vendedores;

INSERT INTO vendedores (emp_no, nomap, salario, dep_no)
	SELECT emp_no, nomap, salario, dep_no
	FROM empleados
	WHERE oficio = 'Analista';


# CREACIÓN DE TABLAS

CREATE TABLE copia_empleados SELECT * FROM empleados;
SELECT * FROM copia_empleados;


# ACTUALIZACIÓN DE TABLAS

USE ejemplos;

# Actualización de toda la tabla (un 5% más de salario)
UPDATE empleados
SET salario = salario * 1.05;

# Incrementamos un 10% el salario de los analistas
UPDATE empleados
SET salario = salario * 1.1
WHERE oficio = 'Analista';

# Actualizamos el salario y la comisión de Francisco Calvo
UPDATE empleados
SET salario = 2000, comision = 100
WHERE nomap = 'Francisco Calvo';

# Violación de clave foránea al actualizar
UPDATE empleados
SET dep_no = 50
WHERE nomap = 'Paula Lopez';

# Violación de clave primaria al actualizar
UPDATE empleados
SET emp_no = 7499
WHERE emp_no = 7876;

# Actualización correcta. Habría que ver cómo se propagan las actualizaciones.
# En este caso no hay problema, porque no hay una clave foránea apuntando al campo.
UPDATE empleados
SET emp_no = 8000
WHERE emp_no = 7876;

# Actualización errónea porque afecta a otras claves foráneas.
# Debería tener un: ON UPDATE CASCADE / SET NULL.
UPDATE empleados
SET emp_no = 8001
WHERE emp_no = 7782;

#############################################################################################################################

# ELIMINACIÓN DE TABLAS

# Borramos una fila de la tabla
DELETE FROM empleados
WHERE nomap = 'Marga Jurado'; # Aunque no existe, no da fallo, simplemente lo ejecuta aunque no haga nada

DELETE FROM copia_empleados
WHERE emp_no = 7900;

# Hay que tener cuidado con las violaciones de clave foránea
DELETE FROM empleados
WHERE nomap = 'Marta Garrido';

# Borrado de una tabla
DELETE FROM vendedores;

#############################################################################################################################

# EJEMPLOS DE TRANSACCIONES

USE ejemplos;

# Hacemos una copia temporal de la tabla empleados
CREATE TABLE empleados_tem SELECT * FROM empleados;

# Ejemplo de rollback
BEGIN;
DELETE FROM empleados_tem WHERE oficio = 'Vendedor';
ROLLBACK;

# Ejemplo de commit
BEGIN;
DELETE FROM empleados_tem WHERE oficio = 'Vendedor';
COMMIT;

# Comprobamos que, efectivamente, no se pueden deshacer los cambios tras un commit
ROLLBACK;

#############################################################################################################################

# EJEMPLOS DE VISTAS ACTUALIZABLES

CREATE OR REPLACE VIEW v_empleados AS
	SELECT * FROM empleados;

INSERT INTO v_empleados (emp_no, nomap) VALUES (8001, 'JOSE FERNANDEZ'); # También se inserta en la tabla original

# Introducimos un Director a través de una vista de Vendedores, esto no debería poder hacerse
CREATE OR REPLACE VIEW v_vendedores AS
	SELECT * FROM empleados WHERE oficio = 'Vendedor';

INSERT INTO v_vendedores (emp_no, nomap, oficio) VALUES (8002,'ROSA GARCIA', 'DIRECTOR');

CREATE OR REPLACE VIEW v_vendedores AS
	SELECT * FROM empleados WHERE oficio = 'Vendedor' WITH CHECK OPTION;

INSERT INTO v_vendedores (emp_no, nomap, oficio) VALUES (8002,'ROSA GARCIA', 'DIRECTOR');
INSERT INTO v_vendedores (emp_no, nomap, oficio) VALUES (8003,'MARTA GARCIA', 'VENDEDOR');