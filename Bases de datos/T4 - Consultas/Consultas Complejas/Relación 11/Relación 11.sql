USE jardineria;

# 1 El código del cliente, su nombre y los códigos de los pedidos que han realizado los clientes del representante de nombre Emmanuel
SELECT codigo_cliente, nombre_cliente, codigo_pedido
FROM cliente NATURAL JOIN pedido
WHERE codigo_empleado_rep_ventas IN (SELECT codigo_empleado
												FROM empleado
												WHERE nombre = 'Emmanuel');

# 2 Nombre de los empleados y el número de pedidos realizados por sus clientes, ordenado por el número de pedidos de menor a mayor
SELECT nombre, COUNT(*) pedidos_clientes
FROM empleado e JOIN cliente c ON codigo_empleado_rep_ventas = codigo_empleado
 JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
GROUP BY codigo_empleado
ORDER BY pedidos_clientes;

# 3 Nombre de aquellos clientes que hayan realizado al menos un pedido, ordenado alfabéticamente
SELECT nombre_cliente
FROM cliente
WHERE codigo_cliente IN (SELECT codigo_cliente
									FROM pedido)
ORDER BY nombre_cliente;

# 4 Todos los pedidos (código de pedido) del cliente Beragua con el importe total de cada pedido ordenados por el número de pedido
SELECT p.codigo_pedido, importe_total
FROM pedido p NATURAL JOIN factura f
WHERE p.codigo_cliente IN (SELECT codigo_cliente
									FROM cliente
									WHERE nombre_cliente = 'Beragua')
ORDER BY codigo_pedido;

# 5 Los pedidos con los códigos comprendidos en el rango 10-15 con el importe total de cada uno de ellos ordenado por el código de pedido
SELECT codigo_pedido, importe_total
FROM factura
WHERE codigo_pedido BETWEEN 10 AND 15
ORDER BY codigo_pedido;

# 6 Calcular los importes del pedido de mayor importe y del de menor importe de todos los pedidos realizados por los clientes
SELECT importe_total, 'Máximo' importe
FROM factura
WHERE importe_total = (SELECT MAX(importe_total)
								FROM factura)
UNION
SELECT importe_total, 'Mínimo' importe
FROM factura
WHERE importe_total = (SELECT MIN(importe_total)
								FROM factura);

# 7 Nombre del producto y el total de unidades pedidas de los productos de los cuales se hayan pedido más de 100 unidades
# ordenados por el número de unidades
SELECT nombre, SUM(cantidad) unidades_vendidas
FROM producto NATURAL JOIN detalle_pedido
WHERE cantidad > 100
GROUP BY nombre
ORDER BY unidades_vendidas;

# 8 Nombre de cada cliente que ha realizado algún pedido y la suma total del importe de todos los pedidos realizados por él,
# ordenado por el nombre del cliente
SELECT nombre_cliente, SUM(importe_total)
FROM cliente c NATURAL JOIN pedido p NATURAL JOIN factura f
GROUP BY nombre_cliente
ORDER BY nombre_cliente;

# 9 Nombre del producto y precio de venta al público del producto más caro
SELECT nombre, precio_venta
FROM producto
WHERE precio_venta = (SELECT MAX(precio_venta)
								FROM producto);

# 10 Nombre del cliente, número del pedido, base imponible del pedido (importe sin IVA), el importe del IVA (21%)
# y el total del pedido, para los pedidos con código 9, 10, 12 y 14
SELECT nombre_cliente, codigo_pedido, importe_total * 0.79 base_imponible, importe_total * 0.21 IVA, importe_total
FROM cliente c NATURAL JOIN pedido p NATURAL JOIN factura f
WHERE codigo_pedido IN(9, 10, 12, 14);

# 11 Códigos de las oficinas con pedidos pendientes y la cantidad de pedidos pendientes de cada una,
# ordenados por la cantidad de pedidos pendientes en orden descendiente
SELECT codigo_oficina, COUNT(*) pedidos_pendientes
FROM oficina JOIN 
ORDER BY pedidos_pendientes DESC;