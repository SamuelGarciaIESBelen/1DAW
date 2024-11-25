USE empleados;

# EJERCICIO 1
SELECT repclie, MAX(limite_credito)
FROM cliente
GROUP BY repclie;

# EJERCICIO 2
SELECT oficina, COUNT(numempl)
FROM empleado
WHERE oficina IS NOT NULL
GROUP BY oficina;

# EJERCICIO 3
SELECT rep, SUM(importe)
FROM pedido
WHERE importe > 30000
GROUP BY rep
ORDER BY importe;

# EJERCICIO 4
SELECT oficina, AVG(cuota)
FROM empleado
WHERE cuota BETWEEN 200000 AND 300000
GROUP BY oficina;

# EJERCICIO 5
SELECT oficina, AVG(cuota)
FROM empleado
WHERE (cuota BETWEEN 200000 AND 300000) AND titulo LIKE 'Representante'
GROUP BY oficina;