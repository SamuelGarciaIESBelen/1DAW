# Creamos una base de datos sin opciones
CREATE DATABASE if NOT EXISTS ejemplos;
USE ejemplos;

# Modificamos la configuración de la BBDD añadiendo opciones
ALTER DATABASE ejemplos CHARACTER SET utf8mb4 COLLATE UTF8MB4_SPANISH_CI;

# Al crear la BBDD con la configuración quedaría así:
# CREATE DATABASE if NOT EXISTS ejemplos CHARACTER SET utf8mb4 COLLATE UTF8MB4_SPANISH_CI;

# Borramos la BBDD
# DROP DATABASE ejemplos;

#-----------------------------------------------------------------------------------------------------------------------------------------------------

# CREACIÓN DE TABLAS

CREATE TABLE consulta (
	cod_consulta	INTEGER 			PRIMARY KEY,
	id_med 			INTEGER 			NOT NULL,
	fecha 			DATE 				NOT NULL,
	diagnostico 	VARCHAR(200) 	NOT NULL,
	id_pac			INTEGER 			NOT NULL
);

# Creo una tabla análoga, esta vez con claves foráneas

CREATE TABLE medico (
	id_med	INTEGER	PRIMARY KEY
);

CREATE TABLE paciente (
	id_pac	INTEGER	PRIMARY KEY
);

CREATE TABLE consulta2 (
	cod_consulta 	INTEGER,
	nom_consulta	VARCHAR(30),
	id_med			INTEGER			NOT NULL,
	fecha				DATE 				NOT NULL,
	diagnostico 	VARCHAR(200),
	id_pac			INTEGER 			NOT NULL,
	CONSTRAINT PRIMARY KEY (cod_consulta),
	CONSTRAINT FOREIGN KEY FK_CONSULTA2_MEDICO_ID_MED(id_med) REFERENCES medico(id_med),
	CONSTRAINT FOREIGN KEY FK_CONSULTA2_PACIENTE_ID_PAC(id_pac) REFERENCES paciente(id_pac),
	INDEX IN_CONSULTA2_NOM_CONSULTA(nom_consulta)
);

/*
DROP TABLE consulta2;
DROP TABLE medico;
DROP TABLE paciente;
*/

# Vuelvo a crear la tabla poniéndole nombre a las descripciones
CREATE TABLE consulta3 (
	cod_consulta 	INTEGER,
	nom_consulta	VARCHAR(30),
	id_med			INTEGER			NOT NULL,
	fecha				DATE 				NOT NULL,
	diagnostico 	VARCHAR(200),
	id_pac			INTEGER 			NOT NULL,
	CONSTRAINT PRIMARY KEY (cod_consulta),
	CONSTRAINT fk_consulta3_medico_id_med FOREIGN KEY (id_med) REFERENCES medico(id_med),
	CONSTRAINT fk_consulta3_paciente_id_pac FOREIGN KEY (id_pac) REFERENCES paciente(id_pac)
);

# DROP TABLE consulta3;

CREATE TABLE consulta4 (
	cod_consulta 	INTEGER			PRIMARY KEY,
	nom_consulta	VARCHAR(30),
	id_med			INTEGER			REFERENCES medico(id_med),
	fecha				DATE 				NOT NULL,
	diagnostico 	VARCHAR(200),
	id_pac			INTEGER 			NOT NULL REFERENCES paciente(id_pac)
);

#-----------------------------------------------------------------------------------------------------------------------------------------------------

# MODIFICACIÓN DE TABLAS

ALTER TABLE consulta ADD COLUMN direccion VARCHAR(100);

ALTER TABLE consulta MODIFY COLUMN direccion VARCHAR(100) NOT NULL;

# Para cambiar el nombre a una columna hay que volver a definirla
ALTER TABLE consulta CHANGE COLUMN direccion dir VARCHAR(100) NOT NULL;

ALTER TABLE consulta ALTER COLUMN diagnostico SET DEFAULT "Ninguno";

ALTER TABLE consulta ALTER COLUMN diagnostico DROP DEFAULT;

ALTER TABLE consulta DROP COLUMN dir;

# Borramos la clave primaria de una tabla para añadirla posteriormente
ALTER TABLE consulta DROP COLUMN cod_consulta;
ALTER TABLE consulta ADD COLUMN cod_consulta INTEGER;
ALTER TABLE consulta ADD CONSTRAINT PRIMARY KEY (cod_consulta);

# Añadimos una clave foránea
ALTER TABLE consulta ADD CONSTRAINT FOREIGN KEY fk_consulta_medico_id_med(id_med) REFERENCES medico(id_med);

#-----------------------------------------------------------------------------------------------------------------------------------------------------

# BORRADO DE TABLAS

CREATE TABLE prueba1 (
	id		INT	NOT NULL PRIMARY KEY
);

CREATE TABLE prueba2 (
	id		INT	NOT NULL PRIMARY KEY,
	CONSTRAINT FOREIGN KEY fk_prueba2_prueba1_id(id)  REFERENCES prueba1(id)
);

# Esto no puede hacerse porque la primera tabla tiene elementos referenciados en la segunda, primero hay que eliminar la última de estas
DROP TABLE prueba1;
DROP TABLE prueba2;

#-----------------------------------------------------------------------------------------------------------------------------------------------------

# CREACIÓN DE ÍNDICES

# Modificamos la tabla consulta para crear un índice sobre un campo que vamos a insertar

ALTER TABLE consulta ADD COLUMN nom_consulta VARCHAR(100);
CREATE INDEX in_consulta_nom_consulta ON consulta(nom_consulta);

# Borramos el índice

DROP INDEX in_consulta_nom_consulta ON consulta;

#-----------------------------------------------------------------------------------------------------------------------------------------------------

#Comprobamos los usuarios que hay en la base de datos
USE mysql;
DESCRIBE user;

SELECT user FROM user; # Muestra únicamente los nombres de los usuarios (la columna user)
SELECT user, host FROM user; # Muestra las columnas user y host
SELECT * FROM user; # Muestra todos los campos

# CREACIÓN DE USUARIOS

CREATE user Samuel; # Cualquier máquina y sin clave
CREATE user Samuel@localhost;

DROP user Samuel; # Cualquier máquina y sin clave
DROP user Samuel@localhost;
# % es un comodín, Samuel es lo mismo que Samuel@'%'
CREATE user usuario@'%' IDENTIFIED BY 'miclave'; # Creamos un usuario que sirva en todas las máquinas con una contraseña
DROP user usuario@'%';
# Probamos a loguearnos con distintos usuarios en la PowerShell
# mysql -u Samuel -p
# mysql -u usuario -p miclave

# RENOMBRAR USUARIOS

RENAME user Samuel TO Samuelitos121;
DROP user Samuelitos121;

# AÑADIR CONTRASEÑAS

SET PASSWORD FOR Samuel = PASSWORD('Patata');
SET PASSWORD FOR Samuel = PASSWORD(''); # Si dejamos las comillas vacías le quitamos la contraseña

#-----------------------------------------------------------------------------------------------------------------------------------------------------

# DERECHOS DE ACCESO Y PRIVILEGIOS

SHOW GRANTS FOR Samuel; # Solo tiene privilegios de acceso
SHOW GRANTS FOR root@localhost; # Tiene todos los privilegios
SHOW GRANTS FOR usuario;

GRANT SELECT, INSERT, DELETE, UPDATE ON liga.colores TO Samuel WITH GRANT OPTION;
# Concedemos permisos de Select, Insert, Delete y Update en la tabla colores de la BBDD Liga al usuario Samuel,
# y le doy permiso para crear usuarios con estos mismos permisos

GRANT SELECT ON *.* TO Samuel; # Concedemos permisos de Consulta en toda la BBDD

REVOKE SELECT ON *.* FROM Samuel; # Eliminar permisos

FLUSH PRIVILEGES; # Cuando se han modificado a mano en la BBDD

GRANT SELECT ON liga.* TO usuario;
REVOKE SELECT ON liga.* from usuario;

# CREACIÓN DE ROLES

CREATE ROLE consulta;
GRANT SELECT ON liga.* TO consulta;
GRANT consulta TO usuario;
SET ROLE consulta;