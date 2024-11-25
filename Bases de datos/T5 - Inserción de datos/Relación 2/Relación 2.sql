USE empleados;

# 1. Crear una tabla (llamada nempleado) que contenga las filas de la tabla empleado.
CREATE OR REPLACE TABLE nempleado SELECT * FROM empleado;

# 2. Crear una tabla (llamada noficina) que contenga las filas de la tabla oficina.
CREATE OR REPLACE TABLE noficina SELECT * FROM oficina;

# 3. Crear una tabla (llamada nproducto) que contenga las filas de la tabla producto.
CREATE OR REPLACE TABLE nproducto SELECT * FROM producto;

# 4. Crear una tabla (llamada npedido) que contenga las filas de la tabla pedido.
CREATE OR REPLACE TABLE npedido SELECT * FROM pedido;

# 5. Subir un 5% el precio de todos los productos del fabricante ACI.
UPDATE nproducto
SET precio = precio * 1.05
WHERE id_fab = 'aci';

# 6. Añadir una nueva oficina para la ciudad de Madrid, con el número de oficina 30,
# con un objetivo de 100000 euros y región Centro. Las ventas iniciales serán cero.
INSERT INTO noficina (oficina, ciudad, region, objetivo, ventas) VALUES (30, 'Madrid', 'Centro', 100000, 0);

# 7. Cambiar los empleados de la oficina 21 a la oficina 30.
UPDATE nempleado
SET oficina = 30
WHERE oficina = 21;

# 8. Eliminar los pedidos del empleado 105.
DELETE FROM npedido
WHERE rep = 105;

# 9. Eliminar las oficinas que no tengan empleados.
DELETE FROM noficina
WHERE oficina NOT IN (SELECT oficina
							FROM nempleado
							WHERE oficina IS NOT NULL);

# 10. Recuperar los precios originales de los productos a partir de la tabla nproducto. Sólo se puede utilizar una sentencia SQL.
UPDATE nproducto np
SET precio = (SELECT precio
					FROM producto p
					WHERE (np.id_fab, np.id_producto) = (p.id_fab, p.id_producto));

# 11. Recuperar las oficinas borradas a partir de la tabla noficina. Sólo se puede utilizar una sentencia SQL.
INSERT INTO noficina
	SELECT *
	FROM oficina
	WHERE oficina NOT IN (SELECT oficina FROM noficina);

# 12. Recuperar los pedidos borrados en el ejercicio 8 a partir de la tabla npedido. Sólo se puede utilizar una sentencia SQL.
INSERT INTO npedido
	SELECT *
	FROM pedido
	WHERE rep = 105;

# 13. Asignar los empleados de la oficina 30 a la oficina 21.
UPDATE nempleado
SET oficina = 21
WHERE oficina = 30;