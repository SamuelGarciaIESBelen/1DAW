USE ejemplos;

# CONSULTAS MULTITABLA

# Producto cartesiano de las tablas departamento y empleados

SELECT * FROM departamentos, empleados;

SELECT departamentos.dep_no, emp_no FROM departamentos, empleados;


##########################################################################################################################################################


# COMBINACIÓN O JOIN DE TABLAS INTERNA

# INNER JOIN en la cláusula WHERE (clave foránea = clave primaria)

SELECT *
FROM departamentos, empleados
WHERE departamentos.dep_no = empleados.dep_no;

SELECT *
FROM departamentos D, empleados E
WHERE D.DEP_NO = E.DEP_NO;

	# Consulta: Nombre de los empleados que trabajan en ventas
	SELECT nomap
	FROM departamentos D, empleados E
	WHERE D.DEP_NO = E.DEP_NO AND DNOMBRE = 'VENTAS';


# INNER JOIN en la cláusula FROM (clave foránea = clave primaria)

SELECT *
FROM departamentos D JOIN empleados E ON D.DEP_NO = E.DEP_NO;

	# Consulta: Nombre de los empleados que trabajan en ventas
	SELECT nomap
	FROM departamentos D JOIN empleados E ON D.DEP_NO = E.DEP_NO
	WHERE DNOMBRE = 'VENTAS';
	

# NATURAL JOIN (mismo nombre en los campos de unión)

SELECT * FROM departamentos JOIN empleados USING(dep_no); # Solo muestra el campo repetido una vez

	# Consulta: Nombre de los empleados que trabajan en ventas
	SELECT nomap
	FROM departamentos JOIN empleados USING(dep_no)
	WHERE dnombre = 'Ventas';

SELECT * FROM departamentos NATURAL JOIN empleados; # Busca solo el campo que se repita, ÚNICAMENTE CUANDO SOLO SE REPITE UN CAMPO

	# Consulta: Nombre de los empleados que trabajan en ventas
	SELECT nomap
	FROM departamentos NATURAL JOIN empleados
	WHERE DNOMBRE = 'VENTAS';


##########################################################################################################################################################


# COMBINACIÓN O JOIN DE TABLAS EXTERNA (OUTER JOIN)

SELECT *
FROM empleados LEFT JOIN departamentos USING (dep_no);

SELECT *
FROM empleados RIGHT JOIN departamentos USING (dep_no);


##########################################################################################################################################################


# COMBINACIÓN REFLEXIVA

# Mostrar los empleados junto a sus jefes, ordenados por jefe

SELECT E.nomap Empleado, J.nomap Jefe
FROM empleados E, empleados J
WHERE E.DIRECTOR = J.EMP_NO
ORDER BY Jefe;


##########################################################################################################################################################


# EJEMPLOS DE OPERADORES DE CONJUNTOS
USE empleados;

# OPERADOR UNION

# Ejemplo 1: Unimos una tabla consigo misma usando los mismos campos
SELECT nombre, oficina FROM empleado WHERE oficina = 12
UNION
SELECT nombre, oficina FROM empleado WHERE oficina = 11;
	
# Ejemplo 2: Unimos una tabla consigo misma usando distintos campos
SELECT numempl FROM empleado
UNION
SELECT jefe FROM empleado
ORDER BY numempl; # Para comprobar fácilmente que no haya repetidos

# Repetimos la consulta mostrando los resultados repetidos
SELECT numempl FROM empleado
UNION ALL
SELECT jefe FROM empleado
ORDER BY numempl;

# Ejemplo 3: Unimos dos tablas
SELECT nombre FROM cliente
UNION
SELECT nombre FROM empleado;

# Añadimos una columna, indicando qué es cada cosa
SELECT nombre, 'Cliente' FROM cliente
UNION
SELECT nombre, 'Empleado' FROM empleado;

# Añadimos un alias para que el nombre de la segunda consulta tenga más sentido
SELECT nombre, 'Cliente' Categoría FROM cliente
UNION
SELECT nombre, 'Empleado' FROM empleado;


# OPERADOR INTERSECT

# Ejemplo 1: Muestra los empleados de la oficina 12 que han realizado algún pedido
SELECT numempl FROM empleado WHERE oficina = 12
INTERSECT
SELECT rep FROM pedido;

# Ejemplo 2: Muestra los empleados que trabajen como representantes y vendan más de 35000
SELECT nombre FROM empleado WHERE titulo = 'Representante'
INTERSECT
SELECT nombre FROM empleado WHERE ventas > 35000;


# OPERADOR DIFERENCIA

# Ejemplo: Clientes que no han hecho pedidos
SELECT numclie FROM cliente
EXCEPT
SELECT cliente FROM pedido
ORDER BY numclie;