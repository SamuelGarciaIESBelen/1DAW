USE empresa;

# 1. Listado telefónico de los empleados del departamento 121 incluyendo nombre del empleado,
# número del empleado y extensión telefónica, ordenado por orden alfabético descendente.
SELECT nomem, numem, extel
FROM temple
WHERE numde = 121
ORDER BY nomem DESC;

# 2. Salario y nombre de los empleados sin hijos por orden decreciente de salario y por orden alfabético dentro del salario.
SELECT nomem, salar
FROM temple
WHERE numhi = 0
ORDER BY salar DESC, nomem;

# 3. En una campaña de ayuda familiar se ha decidido dar a los empleados una paga extra de 30 euros por hijo, a partir del
# tercero inclusive. Obtener por orden alfabético para estos empleados: nombre y salario total que van a cobrar incluyendo esta paga extra.
SELECT nomem, salar + (30 * numhi) paga_incluida
FROM temple
WHERE numhi >= 3
ORDER BY nomem;

# 4. Obtener por orden alfabético los nombres y comisiones de los empleados del departamento 110, sólo para los empleados que tengan comisión.
SELECT nomem, comis
FROM temple
WHERE numde = 110 AND comis IS NOT NULL
ORDER BY nomem;

# 5. Hallar cuántos departamentos hay y el presupuesto anual medio de ellos.
SELECT COUNT(*) num_deptos, AVG(presu) media_presu
FROM tdepto;

# 6. Hallar la masa salarial anual (salario más comisión) de la empresa (se suponen 14 pagas anuales).
SELECT SUM(salar + IFNULL(comis, 0)) * 14 masa_salarial_anual
FROM temple;

# 7. Hallar cuántos empleados han ingresado en el año actual (esta consulta debe funcionar siempre sin importar cuál es el año actual).
SELECT COUNT(*)
FROM temple
WHERE YEAR(fecin) = YEAR(CURRENT_DATE());

# 8. Hallar la diferencia entre el salario más alto y el salario más bajo.
SELECT MAX(salar) - MIN(salar) diferencia
FROM temple;

# 9. Agrupando por departamento y número de hijos, hallar cuántos empleados hay en cada grupo,
# ordenando el resultado por departamento primero y por número de hijos después.
SELECT numde, numhi, COUNT(*) empleados
FROM temple
GROUP BY numde, numhi
ORDER BY numde, numhi;

# 10. Para los departamentos cuyo salario medio supera los 1800 euros, hallar cuántas extensiones telefónicas tienen.
SELECT numde, COUNT(extel) extensiones_telef
FROM temple
GROUP BY numde
HAVING AVG(salar) > 1800;

# 11. Listado de los empleados que no pertenecen a alguno de estos de partamentos: 102, 121. Ordenar el listado ascendentemente.
SELECT nomem
FROM temple
WHERE numde NOT IN (102, 121)
ORDER BY nomem;