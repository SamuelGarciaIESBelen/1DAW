USE motocicletas;

# 1 Muestra la fecha en la que ‘Manolo Montoro’ se compró la motocicleta. Haz una consulta que no use subconsultas y otra que sí las use
SELECT fecha_hora
FROM venta JOIN cliente ON nif_cliente = nif
WHERE nombre = 'Manolo' AND apellidos = 'Montoro';

SELECT fecha_hora
FROM venta
WHERE nif_cliente = (SELECT nif
							FROM cliente
							WHERE nombre = 'Manolo' AND apellidos = 'Montoro');
# 2 Obtener la relación de ventas realizadas antes del año 2000, ordenadas por fecha
SELECT *
FROM venta
WHERE YEAR(fecha_hora) < 2000
ORDER BY fecha_hora;

# 3 Muestra las calles en que vive más de un cliente. Haz versiones con y sin subconsultas
SELECT direccion, COUNT(*) clientes
FROM cliente
WHERE nif IN (SELECT nif_cliente
					FROM venta)
GROUP BY direccion
HAVING clientes > 1;

SELECT direccion, COUNT(*) clientes
FROM cliente JOIN venta ON nif = nif_cliente
GROUP BY direccion
HAVING clientes > 1;

# 4 Cuenta el número de motocicletas vendidas de cada marca, ordenando los resultados de mayor a menor número de ventas
SELECT fabricante, COUNT(*) ventas
FROM modelo
WHERE bastidor IN (SELECT bastidor_modelo
							FROM venta)
GROUP BY fabricante
ORDER BY ventas DESC;

# 5 Listar por orden alfabético de los apellidos y después por nombre, los nombres completos de todos los poseedores de una moto del tipo “Scooter”
SELECT apellidos, nombre
FROM cliente
WHERE nif IN (SELECT nif_cliente
					FROM venta
					WHERE bastidor_modelo IN (SELECT bastidor
														FROM modelo
														WHERE tipo = 'Scooter'))
ORDER BY apellidos, nombre;

# 6 Listar los empleados que se han comprado una motocicleta en ese mismo concesionario
SELECT nombre, apellidos
FROM comercial
WHERE nif IN (SELECT nif
					FROM cliente);

# 7 Muestra el precio medio de las motocicletas
SELECT ROUND(AVG(precio), 2) precio_medio
FROM modelo;

# 8 Mostrar las motos cuyo precio sobrepasa la media
SELECT *
FROM modelo
WHERE precio > (SELECT ROUND(AVG(precio), 2) precio_medio
						FROM modelo);

# 9 Obtener las motos fabricadas por el fabricante “KTM”
SELECT *
FROM modelo
WHERE fabricante = 'KTM';

# 10 Obtén un listado con los tipos de motocicleta y la facturación total que se ha realizado por cada uno,
# ordenando los tipos de mayor a menor facturación
SELECT tipo, SUM(precio) facturacion_total
FROM modelo
GROUP BY tipo
ORDER BY facturacion_total DESC;

# 11 Muestra los días en que se realizaron más de una venta
SELECT fecha_hora
FROM venta
GROUP BY fecha_hora
HAVING COUNT(*) > 1;