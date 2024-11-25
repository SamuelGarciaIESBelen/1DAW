USE jardineria;

# 1. Muestra los clientes que han hecho algún pedido y los clientes que no,
# distinguiendo con un literal ambos casos. Ordena los resultados por nombre de cliente.
SELECT nombre_cliente, 'Sí' Pedidos
FROM cliente
WHERE codigo_cliente IN (SELECT codigo_cliente
									FROM pedido)
UNION
SELECT nombre_cliente, 'No'
FROM cliente
WHERE codigo_cliente NOT IN (SELECT codigo_cliente
										FROM pedido)
ORDER BY nombre_cliente;

# 2. Muestra el código de los clientes de Madrid que han hecho algún pedido, sin usar subconsultas. Ordena los resultados crecientemente.
SELECT codigo_cliente
FROM cliente
WHERE ciudad = 'Madrid'
INTERSECT
SELECT codigo_cliente
FROM pedido
ORDER BY codigo_cliente ASC;

# 3. Para cada empleado, muestra su jefe directo, el jefe de su jefe, y el jefe del jefe de su jefe,
# indicando en un columna si es el jefe, el jefe de su jefe... Ordena los resultados por nombre de empleado.
SELECT e.nombre empleado, j.nombre jefe, 'Jefe' AS 'Nivel Jefe'
FROM empleado e JOIN empleado j ON j.codigo_empleado = e.codigo_jefe
UNION
SELECT e.nombre empleado, j2.nombre jefe, 'Jefe del jefe' AS 'Nivel Jefe'
FROM empleado e JOIN empleado j ON j.codigo_empleado = e.codigo_jefe
		JOIN empleado j2 ON j2.codigo_empleado = j.codigo_jefe
UNION
SELECT e.nombre empleado, j3.nombre jefe, 'Jefe del jefe del jefe' AS 'Nivel Jefe'
FROM empleado e JOIN empleado j ON j.codigo_empleado = e.codigo_jefe
		JOIN empleado j2 ON j2.codigo_empleado = j.codigo_jefe
		JOIN empleado j3 ON j3.codigo_empleado = j2.codigo_jefe
ORDER BY empleado;

# 4. Repite la consulta anterior pero añadiendo una columna que indique de qué nivel es el jefe que tiene.
# Un jefe sera de nivel 1 si no tiene jefes, nivel 2 si depende de un jefe de nivel 1, y así sucesivamente.
# A partir del nivel 3, los niveles se muestran como >3. Ordena los resultados por nombre de empleado.
# Te puedes apoyar en vistas para solucionar el ejercicio.
CREATE OR REPLACE VIEW niveles as
	SELECT e.nombre, e.codigo_empleado, 1 Nivel
	FROM empleado e
	WHERE codigo_jefe IS NULL
	UNION 
	SELECT e.nombre, e.codigo_empleado, 2
	FROM empleado e JOIN empleado j ON e.codigo_jefe = j.codigo_empleado 
	WHERE j.codigo_jefe IS NULL
	UNION
	SELECT e.nombre, e.codigo_empleado, 3
	FROM empleado e JOIN empleado j ON e.codigo_jefe = j.codigo_empleado 
			JOIN empleado j2 ON j.codigo_jefe = j2.codigo_empleado					 
	WHERE j2.codigo_jefe IS NULL
	UNION
	SELECT e.nombre, e.codigo_empleado, '>3'
	FROM empleado e JOIN empleado j ON e.codigo_jefe = j.codigo_empleado 
			JOIN empleado j2 ON j.codigo_jefe = j2.codigo_empleado					 
	WHERE j2.codigo_jefe IS NOT NULL;

SELECT e.nombre empleado, j.nombre jefe, "Jefe" NivelJefe,
	(SELECT nivel FROM niveles n WHERE j.codigo_empleado = n.codigo_empleado) Nivel
FROM empleado e JOIN empleado j ON e.codigo_jefe = j.codigo_empleado					
UNION
SELECT e.nombre empleado, j2.nombre jefe, "Jefe del Jefe" NivelJefe,
	(SELECT nivel FROM niveles n WHERE j2.codigo_empleado = n.codigo_empleado) Nivel
FROM empleado e JOIN empleado j ON e.codigo_jefe = j.codigo_empleado 
					 JOIN empleado j2 ON j.codigo_jefe = j2.codigo_empleado
UNION
SELECT e.nombre empleado, j3.nombre jefe, "Jefe del Jefe del Jefe" NivelJefe, 
	(SELECT nivel FROM niveles n WHERE j3.codigo_empleado = n.codigo_empleado) Nivel
FROM empleado e JOIN empleado j ON e.codigo_jefe = j.codigo_empleado 
					 JOIN empleado j2 ON j.codigo_jefe = j2.codigo_empleado
					 JOIN empleado j3 ON j2.codigo_jefe = j3.codigo_empleado
ORDER BY 1;

# 5. Muestra los clientes que son de Madrid y no han hecho pedidos.
# No puedes utilizar más de una condición en el where.
SELECT nombre_cliente
FROM cliente
WHERE ciudad = 'Madrid'
EXCEPT
SELECT nombre_cliente
FROM cliente
WHERE codigo_cliente IN (SELECT codigo_cliente
									FROM pedido);

# 6. Repite la consulta anterior, pero en este caso muestra también a los clientes
# de Madrid que sí han hecho pedidos, distinguiendo a ambos con una columna
# que indique si han hecho pedidos o no. Ordena los resultados por nombre de cliente.
(
SELECT nombre_cliente, 'No' Pedidos
FROM cliente
WHERE ciudad = 'Madrid'
EXCEPT
SELECT nombre_cliente, 'No'
FROM cliente
WHERE codigo_cliente IN (SELECT codigo_cliente
									FROM pedido)
)
UNION
(
SELECT nombre_cliente, 'Sí' Pedidos
FROM cliente
WHERE ciudad = 'Madrid'
EXCEPT
SELECT nombre_cliente, 'Sí'
FROM cliente
WHERE codigo_cliente NOT IN (SELECT codigo_cliente
										FROM pedido)
)
ORDER BY nombre_cliente;