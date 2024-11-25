# SUBCONSULTAS

USE ejemplos;

# Ejemplo 1: Obtener el nombre y el oficio de los empleados que empezaron a trabajar el mismo día que Marta Garrido

#SELECT nomap, oficio, fecha_alta
#FROM empleados
#WHERE fecha_alta = "2001-05-01";
# Sabiendo la fecha con anterioridad podemos hacer esto, pero lo normal es no saberla

SELECT nomap, oficio, fecha_alta
FROM empleados
WHERE fecha_alta = (SELECT fecha_alta
							FROM empleados
							WHERE nomap = 'Marta Garrido');

# Ejemplo 2: Obtener el nombre, oficio y salario de los empleados que ganan más dinero que Marta Garrido
SELECT nomap, oficio, salario
FROM empleados
WHERE salario > (SELECT salario
						FROM empleados
						WHERE nomap = 'Marta Garrido');


# REFERENCIAS EXTERNAS. CONSULTAS CORRELACIONADAS

# Ejemplo 3: Repetimos el ejemplo 1 pero sin mostrar en los resultados a Marta Garrido
SELECT nomap, oficio
FROM empleados E
WHERE fecha_alta = (SELECT fecha_alta
							FROM empleados
							WHERE nomap = 'Marta Garrido' AND E.NOMAP <> 'Marta Garrido');
							
# En este caso, esta consulta es equivalente a esta:
SELECT nomap, oficio
FROM empleados E
WHERE fecha_alta = (SELECT fecha_alta
							FROM empleados
							WHERE nomap = 'Marta Garrido')
AND E.NOMAP <> 'Marta Garrido';

# Ejemplo 4: Obtener el nombre, departamento, salario y oficio de los empleados que ganan más que Marta Garrido, pero tienen distinto oficio
SELECT nomap, dep_no, salario, oficio
FROM empleados
WHERE salario > (SELECT salario
						FROM empleados
						WHERE nomap = 'Marta Garrido')
		
		AND oficio <> (SELECT oficio
							FROM empleados
							WHERE nomap = 'Marta Garrido');

# LIMIT para limitar el número de filas que aparecen en la búsqueda


##########################################################################################################################################################


# SUBCONSULTAS QUE DEVUELVEN UNA FILA Y UNA COLUMNA (1F1C)
# En ellas usamos operadores relacionales <, >, <=, >=, =, <>

# Ejemplo 5: Obtener el salario de los vendedores cuyo departamento está en Madrid. Mostrar el nombre, departamento y salario.
SELECT nomap, dep_no, salario
FROM empleados
WHERE oficio = 'Vendedor' AND dep_no = (SELECT dep_no
													FROM departamentos
													WHERE localidad = 'Madrid');

# Ejemplo 6: Obtener el número de producto, la descripción y el total de unidades pedidas de los distintos productos
SELECT producto_no codigo, descripcion, (SELECT SUM(unidades)
														FROM pedidos
														WHERE pedidos.producto_no = productos.producto_no) AS total
FROM productos;


##########################################################################################################################################################


# SUBCONSULTAS QUE DEVUELVEN MUCHAS FILAS Y UNA COLUMNA (MF1C)
# No se pueden utilizar los operadores relacionales, en su lugar usaremos IN, NOT IN, ALL, ANY, EXISTS, NOT EXISTS

# OPERADOR IN. Equivale a = ANY
# Ejemplo 7: Obtener el salario de los vendedores cuyo departamento está en Madrid o Barcelona
SELECT nomap, dep_no, salario
FROM empleados
WHERE oficio = 'Vendedor' AND dep_no IN (SELECT dep_no
														FROM departamentos
														WHERE localidad IN('Madrid','Barcelona'));
														
# OPERADOR ANY. Debe ir acompañado de un operador relacional.

# OPERADOR NOT IN. Equivale a <> ALL
# Ejemplo 8: Obtener el salario de los empleados cuyo departamento no está en Madrid ni en Barcelona. Mostrar el nombre, departamento y salario
SELECT nomap, dep_no, salario
FROM empleados
WHERE dep_no NOT IN (SELECT dep_no
							FROM departamentos
							WHERE localidad IN('Madrid','Barcelona'));

# OPERADOR ALL
# Ejemplo 9: Obtener el nombre, departamento y salario de los empleados con mayor salario que los del departamento 20
SELECT nomap, dep_no, salario
FROM empleados
WHERE salario > ALL (SELECT salario
							FROM empleados
							WHERE dep_no = 20);

# OPERADOR EXISTS
# Ejemplo 10: Obtener el número y el nombre del departamento donde hay más de dos trabajadores
SELECT dep_no, dnombre
FROM departamentos D
WHERE EXISTS (SELECT *
					FROM empleados E
					WHERE D.dep_no = E.dep_no
					GROUP BY dep_no
					HAVING COUNT(*) > 2);


##########################################################################################################################################################


# SUBCONSULTAS QUE DEVUELVEN UNA FILA Y MUCHAS COLUMNAS (1FMC)
# Solo se puede utilizar el operador =

# Ejemplo 11: Obtener los empleados que pertenecen al mismo departamento y entraron en la empresa el mismo día que Marta Garrido
SELECT nomap, dep_no
FROM empleados
WHERE (dep_no, fecha_alta) = (SELECT dep_no, fecha_alta
										FROM empleados
										WHERE nomap = 'Marta Garrido');


##########################################################################################################################################################


# SUBCONSULTAS QUE DEVUELVEN MUCHAS FILAS Y MUCHAS COLUMNAS (MFMC)
# Se utilizan los operadores IN y NOT IN

# Ejemplo 12: Listar el empleado que tiene el mayor salario de cada departamento
SELECT dep_no, nomap, salario
FROM empleados
WHERE (salario, dep_no) IN (SELECT MAX(salario), dep_no
										FROM empleados
										GROUP BY dep_no);


##########################################################################################################################################################


# SUBCONSULTAS EN LA CLÁUSULA FROM
# Es obligatorio que la subconsulta tenga un alias

# Ejemplo 13: Muestra el departamento y la suma de los sueldos de sus empleados donde la suma de los sueldos sea mayor
SELECT dep_no, MAX(sm)
FROM (SELECT dep_no, SUM(salario) sm
		FROM empleados
		GROUP BY dep_no) AS suma_sueldos;

# EN MUCHOS CASOS SE PUEDE USAR UNA SUBCONSULTA O UN JOIN
# SIEMPRE QUE SE NECESITE MOSTRAR LA INFORMACIÓN DE VARIAS TABLAS SE USARÁ JOIN
# SIEMPRE QUE NO SEA NECESARIO, SE USARÁ UNA SUBCONSULTA PORQUE ES MÁS EFICIENTE