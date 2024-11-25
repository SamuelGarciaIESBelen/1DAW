USE Pueblos;

# EJERCICIO 1
SELECT codigo, nombre FROM pueblos;

# EJERCICIO 2
SELECT codigo, nombre, pob_total, (pob_hombres + pob_mujeres) AS pob_total_calculada FROM pueblos;

# EJERCICIO 3
SELECT codigo, nombre, (vehiculos / pob_total) AS vehiculos_por_persona FROM pueblos;

# EJERCICIO 4
SELECT codigo, nombre, (lineas_tel / pob_total * 100) AS lineas_tel_por_persona FROM pueblos;

# EJERCICIO 5
SELECT * FROM pueblos WHERE codigo = '29067';

# EJERCICIO 6
SELECT * FROM pueblos WHERE codigo <> '29067';

# EJERCICIO 7
SELECT * FROM pueblos WHERE pob_total > 1000;

# EJERCICIO 8
SELECT * FROM pueblos WHERE pob_total < 10000;

# EJERCICIO 9
SELECT * FROM pueblos WHERE pob_total BETWEEN 1000 AND 10000;

# EJERCICIO 10
SELECT codigo, nombre, (vehiculos / pob_total * 100) AS vehiculos_por_persona FROM pueblos WHERE (vehiculos / pob_total * 100) > 10;

# EJERCICIO 11
SELECT codigo, nombre, (vehiculos / pob_total * 100) AS vehiculos_por_persona FROM pueblos WHERE (vehiculos / pob_total * 100) > 10 OR codigo = '29067';

# EJERCICIO 12
SELECT * FROM pueblos WHERE pob_total BETWEEN 100 AND 1000 OR pob_total > 10000;

# EJERCICIO 13
SELECT * FROM pueblos WHERE codigo IN ('29007','29078','29099');

# EJERCICIO 14
SELECT nombre, vehiculos
FROM pueblos
WHERE pob_total < 1000
ORDER BY vehiculos DESC;

# EJERCICIO 15
SELECT nombre, vehiculos
FROM pueblos
WHERE pob_total < 1000
ORDER BY vehiculos DESC, nombre;

# EJERCICIO 16
SELECT nombre, pob_total
FROM pueblos
WHERE nombre LIKE 'Al%' OR nombre LIKE 'Ben%';