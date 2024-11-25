USE empleados;

# 1
SELECT id_fab, id_producto, descripcion, precio, precio * 1.21 'precio con IVA' FROM producto;

# 2
SELECT num_pedido, fab, producto, cantidad, importe FROM pedido;

# 3
SELECT nombre, contrato, DATEDIFF(CURRENT_DATE(), contrato) AS dias_trabajando, YEAR(CURRENT_DATE()) - edad AS fecha_nac FROM empleado;

# 4
SELECT * FROM cliente ORDER BY repclie, nombre;

# 5
SELECT * FROM oficina ORDER BY region, ciudad, oficina DESC;

# 6
SELECT * FROM pedido ORDER BY fecha_pedido;

# 7
SELECT * FROM pedido WHERE MONTH(fecha_pedido) = 3;

# 8
SELECT numempl FROM empleado WHERE oficina;

# 9
SELECT oficina FROM oficina WHERE dir IS NULL;

# 10
SELECT * FROM oficina WHERE region IN('Norte','Este') ORDER BY region DESC;

# 11
SELECT * FROM empleado WHERE nombre LIKE 'Juan%';

# 12
SELECT * FROM producto WHERE id_producto LIKE '%x';

# 13
SELECT AVG(precio) AS 'Precio medio' FROM producto;

# 14
SELECT AVG(precio) AS 'Precio medio' FROM producto WHERE existencias > 0;

# 15
SELECT AVG(precio) 'Precio medio' FROM producto WHERE existencias > 0 AND (id_fab LIKE 'aci' OR id_fab LIKE 'bic');

# 16
SELECT COUNT(oficina) 'Número de oficinas' FROM oficina;

# 17
SELECT COUNT(numempl) 'Número de empleados con ventas > 150k' FROM empleado WHERE ventas > 150000;

# 18
SELECT COUNT(numclie) 'Número de clientes del empleado 101' FROM cliente WHERE repclie = 101;

# 19
SELECT MAX(limite_credito) 'Mayor crédito' FROM cliente;

# 20
SELECT MAX(ventas) 'Importe máximo', MIN(ventas) 'Importe mínimo' FROM empleado;

# 21
SELECT SUM(ventas) 'Ventas totales' FROM empleado;

# 22
SELECT SUM(ventas) 'Ventas totales' FROM empleado WHERE oficina IN(11, 12);

# 23
SELECT AVG(cuota) 'Cuota media', AVG(ventas) 'Ventas medias' FROM empleado;

# 24
SELECT AVG(importe) 'Importe medio', SUM(importe) 'Importe total', SUM(importe) / SUM(cantidad) 'Precio medio de venta' FROM pedido;

# 25
SELECT AVG(precio) 'Precio medio de los productos de aci' FROM producto WHERE id_fab = 'aci';

# 26
SELECT SUM(importe) 'Importe total de los pedidos de Vicente' FROM pedido WHERE rep = 105;

# 27
SELECT COUNT(codigo) 'Pedidos con valor mayor a 25000' FROM pedido WHERE importe > 25000;