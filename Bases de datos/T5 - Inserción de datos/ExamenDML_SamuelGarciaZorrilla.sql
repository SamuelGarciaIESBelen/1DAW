USE empresa;

# 1. Crea una tabla llamada GastosSalarios donde figure el nombre del centro, el nombre del departamento, y la suma de los sueldos
# de los empleados que trabajan en él, sin contar a los directores del departamento. Ponle alias a las columnas.
CREATE OR REPLACE TABLE GastosSalarios
	SELECT nomce Centro, numde Depto, SUM(salar + IFNULL(comis, 0)) 'Suma Sueldos'
	FROM tcentr JOIN tdepto USING (numce) JOIN temple USING (numde)
	WHERE numem <> direc
	GROUP BY numde;

# 2. Crea una vista donde aparezca el nombre de departamento y el presupuesto por empleado, sin contar al director del departamento.
CREATE OR REPLACE VIEW presuDepto AS
	SELECT nomde Departamento, presu / COUNT(numem) 'Presupuesto por empleado'
	FROM tdepto JOIN temple USING (numde)
	WHERE numem <> direc
	GROUP BY nomde;

# 3. Actualiza la tabla temple asignándole una comisión de 10€ por año trabajado en la empresa, a aquellos empleados sin comisión.
UPDATE temple
SET comis = 10 * TIMESTAMPDIFF(YEAR, fecin, CURDATE())
WHERE comis IS NULL;

# 4. Actualiza los departamentos cuyos presupuestos son mayores al 80% del sueldo que cobran los empleados de dicho departamento,
# reduciendo su presupuesto en la suma de la media del sueldo de los empleados de RRHH más la suma del sueldo de los empleados de
# organización.
UPDATE tdepto
SET presu = presu - ((SELECT AVG(salar + IFNULL(comis, 0))
							FROM temple
							WHERE numde = (SELECT numde
												FROM tdepto
												WHERE nomde = 'RRHH')) + (SELECT SUM(salar + IFNULL(comis, 0))
																					FROM temple
																					WHERE numde = (SELECT numde
																										FROM tdepto
																										WHERE nomde = 'Organización')))
WHERE presu > (SELECT SUM(salar + IFNULL(comis, 0)) * 0.8
					FROM temple
					WHERE temple.numde = tdepto.numde);

# 5. Empieza una nueva transacción. Borra a aquellos empleados que cobran (sin contar la comisión) más que la media de la empresa,
# y además, la media de hijos también es superior, o a aquellos empleados que lleven trabajando más de 40 años en la empresa.
# Comprueba que se ha realizado correctamente y, a continuación, acepta la transacción.
BEGIN;

# Para comprobar que ha funcionado, salen 35 resultados antes del borrado y 20 después
SELECT COUNT(*) FROM temple;

DELETE FROM temple
WHERE (salar > (SELECT AVG(salar) FROM temple) AND numhi > (SELECT AVG(numhi) FROM temple))
		OR TIMESTAMPDIFF(YEAR, fecin, CURDATE()) > 40;

ROLLBACK;

# 6. Inserta en la tabla TCENTR los siguientes datos, usando un solo comando:
INSERT INTO tcentr VALUES (50, 'I+D 2', 'C. GRANADA, 30, MADRID'),
									(60, 'PROMOCIÓN', 'C. KENTIA, 10, MADRID');