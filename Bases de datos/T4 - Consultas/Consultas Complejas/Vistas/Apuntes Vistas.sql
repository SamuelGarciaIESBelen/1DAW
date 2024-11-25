# VISTAS

USE ejemplos;

CREATE VIEW vista_departamentos AS
	SELECT *
	FROM departamentos;
	
SELECT * FROM vista_departamentos;


# Creo una vista con tan solo una columna

CREATE VIEW nombre_departamentos AS
	SELECT dnombre
	FROM departamentos;

SELECT * FROM nombre_departamentos;

	
# Modifico la vista

# CREATE OR REPLACE nombre_departamentos AS
ALTER VIEW nombre_departamentos AS
	SELECT dnombre
	FROM departamentos
	WHERE dnombre LIKE '%on';

SELECT * FROM nombre_departamentos;


# Borro la vista

DROP VIEW nombre_departamentos, vista_departamentos;