USE empresa;

# 1. Crear una tabla llamada "PERSONAL" con el nombre, la extensión telefónica, el número de departamento y el director (número)
# de los empleados que trabajan en el departamento de personal, y llamar a las columnas nombre, extension, departamento y director.
# Hacer un select del nombre de la nueva tabla para comprobar que se han creado bien las columnas.
CREATE OR REPLACE TABLE PERSONAL
	SELECT nomem nombre, extel extension, numde departamento, direc director
	FROM temple e JOIN tdepto d USING (numde)
	WHERE nomde = 'Personal';

SELECT * FROM personal;

# 2. Crear una vista con los departamentos y los centros a los que pertenece cada uno, mostrando el número de centro,
# el nombre de centro, el nombre y el número de departamento, y ordenándolos crecientemente por número de centro y luego
# por número de departamento. Ponle alias a las columnas.
CREATE OR REPLACE VIEW depCentro AS
	SELECT numce 'Nº Centro', nomce 'Centro', numde 'Nº Dpto', nomde 'Departamento'
	FROM tcentr JOIN tdepto USING (numce)
	ORDER BY numce, numde;

# 3. Actualiza la tabla TDEPTO asignándole al presupuesto de finanzas la media de los presupuestos de los departamentos que
# están en Atocha.
UPDATE tdepto
SET presu = (SELECT AVG(presu)
				FROM tdepto
				WHERE numce IN (SELECT numce
									FROM tcentr
									WHERE senas LIKE '%Atocha%'))
WHERE nomde = 'Finanzas';

# 4. Actualiza la tabla TDEPTO incrementando el presupuesto de finanzas en la diferencia que existe
# entre el departamento de organización y el de personal.
UPDATE tdepto
SET presu = presu + ((SELECT presu FROM tdepto WHERE nomde = 'Organización') - (SELECT presu FROM tdepto WHERE nomde = 'Personal'))
WHERE nomde = 'Finanzas';

# 5. Inserta en la tabla TCENTR los siguientes datos, usando un solo comando:
INSERT INTO tcentr VALUES (30, 'I+D', 'C. GRANADA, 30, MADRID'), (40, 'PROMOCIÓN', 'C. KENTIA, 10, MADRID');

# 6. Empieza una nueva transacción. Borra todos los empleados que no trabajan en Atocha. Comprueba que se ha realizado
# correctamente, y a continuación aborta la transacción.
BEGIN;

SELECT * FROM temple; # Antes de realizar el borrado hay 34 empleados.

DELETE FROM temple
WHERE numde IN (SELECT numde FROM tdepto WHERE numce IN (SELECT numce FROM tcentr WHERE senas NOT LIKE '%Atocha%'));

SELECT * FROM temple; # Tras realizar el borrado hay 18 empleados.

ROLLBACK;