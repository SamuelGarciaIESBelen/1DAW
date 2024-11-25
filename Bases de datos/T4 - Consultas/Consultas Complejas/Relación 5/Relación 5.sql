USE empleados;

# 1.1
SELECT oficina.oficina, ciudad, numempl, nombre
FROM oficina JOIN empleado USING(oficina)
WHERE region = 'Este';

# 1.2
SELECT oficina.oficina, ciudad, numempl, nombre
FROM oficina LEFT JOIN empleado USING(oficina)
WHERE region = 'Este';

# 2
SELECT num_pedido, importe, nombre, limite_credito
FROM pedido P JOIN cliente C ON numclie = cliente;

# 3
SELECT empleado.*, ciudad, region
FROM empleado LEFT JOIN oficina USING(oficina)
ORDER BY nombre;

# 4
SELECT oficina.*, nombre
FROM oficina LEFT JOIN empleado USING(oficina)
WHERE objetivo > 600000 AND (numempl = dir OR numempl IS NULL);

# 5
SELECT empleado.nombre "Nombre empleado", cliente.nombre "Nombre cliente", pedido.*
FROM pedido JOIN empleado JOIN cliente ON cliente = numclie AND rep = numempl
WHERE importe > 25000;

# 6
SELECT *
FROM empleado JOIN pedido ON numempl = rep
WHERE contrato = fecha_pedido;

# 7
SELECT E.*, J.numempl Num_jefe, J.nombre Nombre_jefe, J.cuota Cuota_jefe
FROM empleado E JOIN empleado J ON J.numempl = E.jefe
WHERE E.cuota > J.cuota;

# 8
SELECT DISTINCT *
FROM empleado JOIN pedido ON rep = numempl
WHERE importe > 10000 OR cuota < 10000;