USE empresa;

# 1. Muestra el nombre de empleado, el número de departamento y la extensión telefónica de los empleados que NO trabajan en Atocha.
# (Subconsultas)
SELECT nomem, numde, extel
FROM temple
WHERE numde IN (SELECT numde
					FROM tdepto
					WHERE numce IN (SELECT numce
										FROM tcentr
										WHERE senas NOT LIKE '%Atocha%'));

# 2. Muestra el nombre de centro, el nombre de departamento y el número de empleados que trabajan en ese departamento
# de aquellos departamentos que no estén en Alcalá (En BBDD Alcala). Ponle alias a las columnas.
SELECT nomce Centro, nomde Departamento, COUNT(*) Empleados
FROM tcentr JOIN tdepto USING (numce) JOIN temple USING (numde)
WHERE senas NOT LIKE '%Alcala%'
GROUP BY nomde;

# 3. Modifica el ejercicio anterior para que muestre también los centros donde no hay departamentos ni empleados.
SELECT nomce Centro, nomde Departamento, COUNT(numem) Empleados
FROM tcentr LEFT JOIN tdepto USING (numce) LEFT JOIN temple USING (numde)
WHERE senas NOT LIKE '%Alcala%'
GROUP BY nomde;

# 4. Muestra el nombre de los jefes que trabajan en la sede central y no tienen hijos. (Subconsultas).
SELECT nomem
FROM temple
WHERE numhi = 0 AND numem IN (SELECT direc
										FROM tdepto)
		AND numde IN (SELECT numde
							FROM tdepto
							WHERE numce IN (SELECT numce
												FROM tcentr
												WHERE nomce = 'Sede central'));

# 5. Muestra el nombre de jefe y el número de departamento de aquellos jefes que dependen de otros departamentos
# cuyos empleados ganan menos que los empleados que trabajan en el departamento del que no depende nadie. (Subconsultas).
SELECT nomem, numde
FROM temple
WHERE numem IN (SELECT direc
					FROM tdepto
					WHERE depde IN (SELECT numde
										FROM temple
										GROUP BY numde
										HAVING SUM(salar + IFNULL(comis, 0)) < (SELECT SUM(salar + IFNULL(comis, 0))
																							FROM temple
																							WHERE numde = (SELECT numde
																												FROM tdepto
																												WHERE depde IS NULL))));

# 6. Muestra el nombre de centro, el nombre de departamento, el nombre del jefe del departamento y el nombre del empleado
# de los directores en propiedad, añadiendo una columna llamada 'Preferencia' que diga 'Preferencia mañana' para aquellos
# empleados que tengan hijos, y 'Sin preferencia' para aquellos empleados que no tengan hijos. Usa alias para todas las columnas.
# Ordénalos por nombre de centro, nombre de departamento, nombre de director y nombre de empleado.
# No puedes apoyarte en estructuras auxiliares para resolver este ejercicio.
SELECT nomce Centro, nomde Departamento, j.nomem Jefe, e.nomem Empleado, 'Preferencia mañana' Preferencia
FROM tcentr JOIN tdepto USING (numce) JOIN temple e USING (numde) JOIN temple j ON (j.numem = direc)
WHERE tidir = 'P' AND e.numhi > 0
UNION
SELECT nomce, nomde, j.nomem, e.nomem, 'Sin preferencia'
FROM tcentr JOIN tdepto USING (numce) JOIN temple e USING (numde) JOIN temple j ON (j.numem = direc)
WHERE tidir = 'P' AND e.numhi = 0
ORDER BY 1, 2, 3, 4;

# 7. Hallar el apellido y el nombre del empleado, separado en columnas, los años trabajados y el número de hijos de aquellos
# trabajadores que están en el departamento de 'PERSONAL' u 'ORGANIZACIÓN' y cuyo departamento está en Madrid. (Subconsultas).
SELECT SUBSTRING_INDEX(nomem, ', ', 1) Apellido, SUBSTRING_INDEX(nomem, ', ', -1) Nombre,
		TIMESTAMPDIFF(YEAR, FECIN, CURDATE()) 'Años trabajados', numhi 'Hijos'
FROM temple
WHERE numde IN (SELECT numde
					FROM tdepto
					WHERE nomde IN('Personal', 'Organización'))
		AND numde IN (SELECT numde
							FROM tdepto
							WHERE numce IN (SELECT numce
												FROM tcentr
												WHERE senas LIKE '%Madrid%'));