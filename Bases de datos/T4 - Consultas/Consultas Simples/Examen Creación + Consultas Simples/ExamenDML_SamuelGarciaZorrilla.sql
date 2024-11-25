USE ejemplos;

# EJERCICIO 1
SELECT nomap, salario + IFNULL(comision, 0) AS sueldo
FROM empleados
WHERE dep_no = 30 AND salario + IFNULL(comision, 0) > 2000
ORDER BY oficio DESC, nomap;

# EJERCICIO 2
SELECT nomap, dep_no, fecha_alta
FROM empleados
GROUP BY dep_no
HAVING fecha_alta = MIN(fecha_alta)
ORDER BY dep_no ASC;

# EJERCICIO 3
SELECT MAX(salario + IFNULL(comision, 0)) sueldo_max, AVG(salario + IFNULL(comision, 0)) sueldo_medio,
			MIN(salario + IFNULL(comision, 0)) sueldo_min, COUNT(*) num_empleados
FROM empleados
WHERE dep_no IN(10, 20);

# EJERCICIO 4
SELECT nomap nombre, salario # FALTA SUSTITUIR POR ASTERISCOS
FROM empleados
WHERE dep_no % 2 = 0;

# EJERCICIO 5
SELECT nomap, TIMESTAMPDIFF(YEAR, fecha_alta, CURRENT_DATE()) años_trabajados
FROM empleados
WHERE TIMESTAMPDIFF(YEAR, fecha_alta, CURRENT_DATE()) > 20;

# EJERCICIO 6
SELECT dep_no, AVG(salario) media_salario, COUNT(*) num_empleados
FROM empleados
GROUP BY dep_no
HAVING num_empleados > 2;

# EJERCICIO 7
SELECT SUM(IFNULL(comision, 0)), dep_no
FROM empleados
WHERE oficio = 'Vendedor';

# EJERCICIO 8
SELECT DISTINCT oficio
FROM empleados
WHERE oficio <> 20 OR oficio <> 30;

SELECT DISTINCT oficio
FROM empleados
WHERE oficio NOT IN(20, 30);

# EJERCICIO 9
SELECT nomap, dep_no
FROM empleados
WHERE nomap LIKE '%mar%'
ORDER BY dep_no ASC;

# EJERCICIO 10
SELECT dep_no, AVG(salario)
FROM empleados
WHERE comision IS NOT NULL
GROUP BY dep_no;