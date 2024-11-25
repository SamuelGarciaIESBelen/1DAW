USE proveedores;

# EJERCICIO 1
SELECT nombre, localidad
FROM proveedor
WHERE cod_jefe IN (SELECT cod_jefe
						FROM proveedor
						WHERE nombre IN('Ernesto', 'Adolfo'));

SELECT p.nombre, p.localidad
FROM proveedor p JOIN proveedor j USING (cod_jefe)
WHERE j.nombre IN('Ernesto', 'Adolfo');

# EJERCICIO 2
SELECT nombre, localidad
FROM proveedor
WHERE localidad IN (SELECT localidad
							FROM proveedor
							WHERE cod_jefe = 11);

SELECT e.nombre, e.localidad
FROM proveedor e JOIN proveedor j USING (localidad)
WHERE j.cod_jefe = 11;

# EJERCICIO 3
SELECT nombre, localidad
FROM proveedor
WHERE cod_jefe = (SELECT cod_jefe
						FROM proveedor
						WHERE nombre LIKE 'Adolfo')
		AND localidad = (SELECT localidad
					  			FROM proveedor
					  			WHERE codigo = 12);

SELECT p1.nombre, p1.localidad
FROM proveedor p1 JOIN proveedor p2 ON p1.cod_jefe = p2.cod_jefe
	JOIN proveedor p3 ON p1.localidad = p3.localidad
WHERE p2.nombre LIKE 'Adolfo' AND p3.codigo = 12;

# EJERCICIO 4
SELECT a.codigo, a.denominacion, p2.nombre
FROM articulo a JOIN provart p1 ON a.codigo = p1.codigo_articulo
	JOIN proveedor p2 ON p1.codigo_proveedor = p2.codigo
WHERE a.precio > (SELECT MAX(precio)
						FROM articulo a JOIN provart p1 ON a.codigo = p1.codigo_articulo
							JOIN proveedor p2 ON p1.codigo_proveedor = p2.codigo
						WHERE p2.nombre LIKE 'Adolfo')
		AND p2.nombre NOT IN('Eduardo','Manuel');

# EJERCICIO 5
SELECT *
FROM articulo 
WHERE precio < (SELECT AVG(precio)
					 FROM articulo);
					 
# EJERCICIO 6
SELECT denominacion, precio, precio * 0.8 precio_rebajado
FROM articulo;

# EJERCICIO 7
SELECT COUNT(*) AS proveedores_distintos
FROM proveedor;

# EJERCICIO 8
SELECT AVG(precio) AS precio_medio_sin_Zodiac
FROM articulo
WHERE denominacion <> 'Zodiac';