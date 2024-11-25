use tienda;

# 1
SELECT nombre nombre_producto, ROUND(precio, 2) euros, ROUND(precio * 1.08, 2) dólares
FROM producto;

# 2
SELECT *
FROM producto
WHERE codigo_fabricante IN(1, 3, 5);

# 3
SELECT *
FROM fabricante
WHERE nombre LIKE '%w%';

# 4
SELECT nombre
FROM fabricante
WHERE CHAR_LENGTH(nombre) = 4;

# 5
SELECT nombre, precio
FROM producto
WHERE precio >= 180
ORDER BY precio DESC, nombre;

# 6
SELECT COUNT(*) 'Número de fabricantes'
FROM fabricante;

# 7
SELECT codigo_fabricante, MIN(precio) 'Precio mínimo', MAX(precio) AS "Precio máximo", AVG(precio) AS Precio_Medio, COUNT(*) numProductosCrucial
FROM producto
WHERE codigo_fabricante = 6;

# 8
SELECT codigo_fabricante, COUNT(*) num_productos
FROM producto
GROUP BY codigo_fabricante
ORDER BY num_productos DESC;

# 9
SELECT codigo_fabricante, MAX(precio) AS "Precio máximo", MIN(precio) 'Precio mínimo', AVG(precio) AS Precio_Medio, COUNT(*) numProductos
FROM producto
GROUP BY codigo_fabricante
HAVING Precio_Medio > 200;

# 10
SELECT codigo_fabricante, COUNT(*) num_productos
FROM producto
WHERE precio >= 220
GROUP BY codigo_fabricante
HAVING num_productos > 1;