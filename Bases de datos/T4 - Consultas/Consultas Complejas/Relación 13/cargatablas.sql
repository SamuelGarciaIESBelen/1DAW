DROP DATABASE IF EXISTS ejemplos;
CREATE DATABASE ejemplos ;

USE ejemplos;

CREATE OR REPLACE TABLE DEPARTAMENTOS(
	DEP_NO 			INT(2) PRIMARY KEY,
  	DNOMBRE 			VARCHAR(14),
  	LOCALIDAD 		VARCHAR(10)
);



CREATE OR REPLACE TABLE EMPLEADOS(
	EMP_NO 			INT(4) PRIMARY KEY,
  	NOMAP		 		VARCHAR(30),
  	OFICIO 			VARCHAR(10),
  	DIRECTOR 		INT(4),
  	FECHA_ALTA 		DATE,
  	SALARIO 			FLOAT(6,2),
  	COMISION 		FLOAT(6,2),
  	DEP_NO 			INT (2),
	CONSTRAINT FK_EMP_DIRECTOR FOREIGN KEY (DIRECTOR) REFERENCES EMPLEADOS(EMP_NO),
	CONSTRAINT FK_EMP_DEP_NO FOREIGN KEY (DEP_NO) REFERENCES DEPARTAMENTOS(DEP_NO)
);

CREATE TABLE CLIENTES(
	CLIENTE_NO				INTEGER(4) PRIMARY KEY,
 	NOMBRE 					VARCHAR(25),
 	LOCALIDAD    			VARCHAR(14),
 	VENDEDOR_NO  			INTEGER(4),
 	DEBE						NUMERIC(9,2),
	HABER					NUMERIC(9,2),
 	LIMITE_CREDITO    	NUMERIC(9,2),
	CONSTRAINT FK_CLI_EMP_NO FOREIGN KEY (VENDEDOR_NO) REFERENCES EMPLEADOS(EMP_NO) ON DELETE CASCADE
);


CREATE TABLE PRODUCTOS(
	PRODUCTO_NO  		INTEGER(4) PRIMARY KEY,
 	DESCRIPCION  		VARCHAR(30),
 	PRECIO_ACTUAL 		NUMERIC(8,2),
 	STOCK_DISPONIBLE	INTEGER(9)
);


CREATE TABLE PEDIDOS(
	PEDIDO_NO        INTEGER(4) PRIMARY KEY,
 	PRODUCTO_NO			INTEGER(4),
 	CLIENTE_NO 			INTEGER(4),
 	UNIDADES 	      INTEGER(4),
 	FECHA_PEDIDO     	DATE,
	CONSTRAINT FK_PEDIDOS_PRODUCTO_NO FOREIGN KEY (PRODUCTO_NO) REFERENCES PRODUCTOS(PRODUCTO_NO) ON DELETE CASCADE,
	CONSTRAINT FK_PEDIDOS_CLIENTE_NO FOREIGN KEY (CLIENTE_NO) REFERENCES CLIENTES(CLIENTE_NO) ON DELETE CASCADE 
);

# INSERCIÓN DE DATOS EN DEPARTAMENTOS

INSERT INTO DEPARTAMENTOS VALUES(10, 'CONTABILIDAD', 'BARCELONA');
INSERT INTO DEPARTAMENTOS VALUES(20, 'INVESTIGACION', 'VALENCIA');
INSERT INTO DEPARTAMENTOS VALUES(30, 'VENTAS',        'MADRID'); 
INSERT INTO DEPARTAMENTOS VALUES(40, 'PRODUCCION',    'SEVILLA');


# INSERCIÓN DE DATOS EN EMPLEADOS

INSERT INTO EMPLEADOS VALUES (7839,'JUAN REY','PRESIDENTE',NULL,'2001-11-17',6000,   NULL, 10);
INSERT INTO EMPLEADOS VALUES (7698,'MARTA GARRIDO', 'DIRECTOR',  7839,'2001-05-01',3850.12,NULL, 30);
INSERT INTO EMPLEADOS VALUES (7782,'MIGUEL MARTINEZ','DIRECTOR',  7839,'2001-06-09',2450,   NULL, 10);
INSERT INTO EMPLEADOS VALUES(7499,'DANIEL ALONSO', 'VENDEDOR',  7698,'2001-02-23',1400,   400,30);
INSERT INTO EMPLEADOS VALUES (7521,'PAULA LOPEZ', 'EMPLEADO',  7782,'2001-05-01',1350.50,NULL,10);      
INSERT INTO EMPLEADOS VALUES (7654,'SARA MARTIN', 'VENDEDOR',  7698,'2001-09-28',1500,   1600, 30);
INSERT INTO EMPLEADOS VALUES (7844,'FRANCISCO CALVO', 'VENDEDOR',  7698,'2002-09-08',1800,   0,    30);
INSERT INTO EMPLEADOS VALUES (7876,'FRANCISCO GIL', 'ANALISTA',  7782,'2002-05-06',3350,   NULL, 20);
INSERT INTO EMPLEADOS VALUES (7900,'LIDIA JIMENEZ', 'EMPLEADO',  7782,'2003-03-24',1400,   NULL, 20);	

# INSERCIÓN DE DATOS EN CLIENTES
INSERT INTO CLIENTES VALUES (101, 'DISTRIBUCIONES GOMEZ', 'MADRID', 7499, 0,0,5000);
INSERT INTO CLIENTES VALUES (102, 'LOGITRONICA S.L', 'BARCELONA', 7654,0,0,5000);
INSERT INTO CLIENTES VALUES (103, 'INDUSTRIAS LACTEAS S.A.', 'LAS ROZAS', 7844,0,0, 10000);
INSERT INTO CLIENTES VALUES (104, 'TALLERES ESTESO S.A.', 'SEVILLA', 7654, 0, 0, 5000);
INSERT INTO CLIENTES VALUES (105, 'EDICIONES SANZ', 'BARCELONA', 7499, 0,0,5000);
INSERT INTO CLIENTES VALUES (106, 'SIGNOLOGIC S.A.', 'MADRID', 7654,0,0,5000);
INSERT INTO CLIENTES VALUES (107, 'MARTIN Y ASOCIADOS S.L.', 'ARAVACA' , 7844,0,0, 10000);
INSERT INTO CLIENTES VALUES (108, 'MANUFACTURAS ALI S.A.', 'SEVILLA', 7654, 0, 0, 5000);

# INSERCIÓN DE DATOS EN PRODUCTOS

INSERT INTO PRODUCTOS VALUES(10,'MESA DESPACHO MOD. GAVIOTA', 550, 50);
INSERT INTO PRODUCTOS VALUES (20, 'SILLA DIRECTOR MOD. BUFALO', 670, 25);
INSERT INTO PRODUCTOS VALUES (30, 'ARMARIO NOGAL DOS PUERTAS', 460, 20);
INSERT INTO PRODUCTOS VALUES (40, 'MESA MODELO UNIÓN',340, 15);
INSERT INTO PRODUCTOS VALUES (50, 'ARCHIVADOR CEREZO',1050, 20);
INSERT INTO PRODUCTOS VALUES (60, 'CAJA SEGURIDAD MOD B222', 280, 15);
INSERT INTO PRODUCTOS VALUES (70, 'DESTRUCTORA DE PAPEL A3',450, 25);
INSERT INTO PRODUCTOS VALUES (80, 'MODULO ORDENADOR MOD. ERGOS', 550, 25);

# INSERCIÓN DE DATOS EN PEDIDOS

INSERT INTO PEDIDOS VALUES(1000, 20, 103, 3, '1999-10-06');
INSERT INTO PEDIDOS VALUES(1001, 50, 106, 2, '1999-10-06');
INSERT INTO PEDIDOS VALUES(1002, 10, 101, 4, '1999-10-07');
INSERT INTO PEDIDOS VALUES(1003, 20, 105, 4, '1999-10-16');
INSERT INTO PEDIDOS VALUES(1004, 40, 106, 8, '1999-10-20');
INSERT INTO PEDIDOS VALUES(1005, 30, 105, 2, '1999-10-20');
INSERT INTO PEDIDOS VALUES(1006, 70, 103, 3, '1999-11-03');
INSERT INTO PEDIDOS VALUES(1007, 50, 101, 2, '1999-11-06');
INSERT INTO PEDIDOS VALUES(1008, 10, 106, 6, '1999-11-16');
INSERT INTO PEDIDOS VALUES(1009, 20, 105, 2, '1999-11-26');
INSERT INTO PEDIDOS VALUES(1010, 40, 102, 3, '1999-12-08');
INSERT INTO PEDIDOS VALUES(1011, 30, 106, 2, '1999-12-15');
INSERT INTO PEDIDOS VALUES(1012, 10, 105, 3, '1999-12-06');
INSERT INTO PEDIDOS VALUES(1013, 30, 106, 2, '1999-12-06');
INSERT INTO PEDIDOS VALUES(1014, 20, 101, 4, '1999-01-07');
INSERT INTO PEDIDOS VALUES(1015, 70, 105, 4, '1999-01-16');
INSERT INTO PEDIDOS VALUES(1017, 20, 105, 6, '1999-01-20');


