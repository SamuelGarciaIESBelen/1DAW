USE empresa;

# EJERCICIO 1
SELECT AVG(salar) 'Salario medio', AVG(TIMESTAMPDIFF(YEAR, fecna, CURDATE())) 'Edad media', 'Sí' Comisión
FROM temple
WHERE comis IS NOT NULL
UNION
SELECT AVG(salar) 'Salario medio', AVG(TIMESTAMPDIFF(YEAR, fecna, CURDATE())) 'Edad media', 'No' Comisión
FROM temple
WHERE comis IS NULL;

# EJERCICIO 2
SELECT nomem, salar / numhi 'Salario por hijo', 'Sí' Hijos
FROM temple
WHERE comis IS NULL AND numhi > 0
UNION
SELECT nomem, salar, 'No' Hijos
FROM temple
WHERE comis IS NULL AND numhi = 0
ORDER BY nomem;

# EJERCICIO 3
# Efectuar una explosión de la organización de departamentos. Es decir, para cada departamento, obtener su nombre, el de los que dependen de él y el nivel al que dependen.
# Si un departamento depende directamente de otro, este nivel será 1; si depende de uno que depende directamente de un segundo, éste será 2; y así sucesivamente.
# Se considerará que un departamento depende de sí mismo a nivel 0. La primera columna del resultado será el nombre de un departamento,
# la segunda el de un departamento que depende de él, y la tercera el nivel al que depende. Considerar un máximo de 3 niveles de dependencia (del 0 al 2).
# Presentar el resultado por orden alfabético. Si de un departamento no depende ningún otro, aparecerá al menos dependiendo de sí mismo a nivel 0.
SELECT d1.nomde Departamento, d1.depde 'Depende de', 0 Nivel
FROM tdepto d1
WHERE d1.depde IS NULL
UNION
SELECT d2.nomde, d2.depde, 1
FROM tdepto d1 JOIN tdepto d2 ON d1.numde = d2.depde
WHERE d1.depde IS NULL
UNION
SELECT d3.nomde, d3.depde, 2
FROM tdepto d1 JOIN tdepto d2 JOIN tdepto d3 ON d1.numde = d2.depde AND d2.numde = d3.depde
WHERE d1.depde IS NULL
ORDER BY Nivel