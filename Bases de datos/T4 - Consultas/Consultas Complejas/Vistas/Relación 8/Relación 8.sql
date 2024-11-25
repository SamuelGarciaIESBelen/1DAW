# BBDD JARDINERÍA
USE jardineria;

# 1
CREATE OR REPLACE VIEW Listin AS
	SELECT CONCAT(apellido1, " ", apellido2, ", ", nombre) nombre_completo, extension
	FROM empleado;

SELECT * FROM Listin;

# 2
CREATE OR REPLACE VIEW Pedpend AS
	SELECT codigo_pedido, fecha_pedido, nombre_cliente
	FROM pedido NATURAL JOIN cliente
	WHERE estado = 'Pendiente';

SELECT * FROM Pedpend;

# 3
CREATE OR REPLACE VIEW Stockb AS
	SELECT *
	FROM producto
	WHERE cantidad_en_stock < 25;

SELECT * FROM Stockb;

# 4
CREATE OR REPLACE VIEW Factura AS
	SELECT codigo_pedido, SUM(cantidad * precio_unidad) importe_total
	FROM detalle_pedido
	GROUP BY codigo_pedido;

SELECT * FROM Factura;

# 5
CREATE OR REPLACE VIEW Clientevip AS
	SELECT *
	FROM cliente
	WHERE codigo_cliente IN (SELECT codigo_cliente
									FROM pedido
									WHERE codigo_pedido IN (SELECT codigo_pedido
																	FROM Factura
																	WHERE importe_total > (SELECT AVG(importe_total)
																									FROM Factura)));
SELECT * FROM Clientevip;

# 6
CREATE OR REPLACE VIEW Distribucion AS
	SELECT ciudad, COUNT(*)
	FROM cliente
	GROUP BY ciudad;

SELECT * FROM Distribucion;

# 7
CREATE OR REPLACE VIEW Pedreal AS
	SELECT c.nombre_cliente, COUNT(p.codigo_pedido) pedidos_realizados
	FROM cliente c LEFT JOIN pedido p USING (codigo_cliente)
	GROUP BY codigo_cliente;

SELECT * FROM Pedreal;

CREATE OR REPLACE VIEW Pedreal2 AS
	SELECT nombre_cliente, (SELECT COUNT(*)
									FROM pedido
									WHERE codigo_cliente = cliente.codigo_cliente) AS pedidos
	FROM cliente;

SELECT * FROM Pedreal2;

# 8
CREATE OR REPLACE VIEW Comisiones AS
	SELECT nombre, SUM(importe_total* 0.05) comision
	FROM empleado e JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
		JOIN pedido p USING (codigo_cliente)
		JOIN factura f USING (codigo_pedido)
	GROUP BY codigo_empleado;

SELECT * FROM Comisiones;

# BBDD PROVEEDORES
USE proveedores;

# 1
CREATE OR REPLACE VIEW Prodbaratos AS
	SELECT *
	FROM articulo
	WHERE precio < (SELECT AVG(precio)
									FROM articulo);
SELECT * FROM Prodbaratos;

# 2
CREATE OR REPLACE VIEW RebajaPrimavera AS
	SELECT *, precio * 0.8 precio_primavera
	FROM articulo;

SELECT * FROM RebajaPrimavera;