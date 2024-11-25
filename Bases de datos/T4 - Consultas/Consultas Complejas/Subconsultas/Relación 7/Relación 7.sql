USE empleados;

# 1
SELECT id_producto, descripcion, existencias
FROM producto
WHERE id_fab = 'aci' AND existencias > (SELECT existencias
													FROM producto
													WHERE id_fab = 'aci' AND id_producto = 41004);

# 2
SELECT numempl, nombre, edad
FROM empleado
WHERE cuota > (SELECT AVG(cuota)
					FROM empleado);

# 3
SELECT COUNT(*) 'Empleados', AVG(edad) 'Edad Media'
FROM empleado
WHERE cuota > (SELECT AVG(cuota)
					FROM empleado);

# 4
SELECT *
FROM oficina O
WHERE objetivo > (SELECT SUM(cuota)
						FROM empleado E
						WHERE E.oficina = O.oficina);

# 5
SELECT nombre
FROM cliente
WHERE numclie IN (SELECT cliente
						FROM pedido
						WHERE producto LIKE '4100%'
								AND fecha_pedido BETWEEN '2010-01-01' AND '2010-04-15'); # De esta forma incluye ambos días

SELECT nombre
FROM cliente
WHERE numclie IN (SELECT cliente
						FROM pedido
						WHERE producto LIKE '4100%'
								AND (fecha_pedido > '2010-01-01' AND fecha_pedido < '2010-04-15')); # De esta forma no los incluye
# 6
SELECT numempl, nombre
FROM empleado E
WHERE numempl IN (SELECT rep
						FROM pedido
						WHERE importe > (E.cuota * 0.01));

# 7
SELECT numclie, nombre
FROM cliente
WHERE repclie IN (SELECT numempl
						FROM empleado
						WHERE nombre = 'Juan Rovira');

# 8
SELECT numempl, nombre, oficina
FROM empleado
WHERE oficina IN (SELECT oficina
						FROM oficina
						WHERE ventas > objetivo);

# 9
SELECT numempl, nombre, oficina
FROM empleado
WHERE oficina NOT IN (SELECT oficina
							FROM oficina
							WHERE dir = 108);

# 10 Listar los productos (codigo, codigo de fabricante y descripcion) para los cuales no se haya recibido ningún pedido de menos de 1000 euros.
SELECT id_producto, id_fab, descripcion
FROM producto
WHERE id_producto NOT IN (SELECT producto
									FROM pedido
									WHERE importe < 1000);

# 11 Listar las oficinas (oficina, ciudad) que tienen al menos un empleado cuya cuota represente más del 55% del objetivo de la oficina.
SELECT oficina, ciudad
FROM oficina
WHERE oficina IN (SELECT oficina
						FROM empleado
						WHERE cuota > (objetivo * 0.55));

# 12 Listar los empleados (numempl, nombre y edad) que no dirigen una oficina.
SELECT numempl, nombre, edad
FROM empleado
WHERE numempl NOT IN (SELECT dir
								FROM oficina
								WHERE dir);