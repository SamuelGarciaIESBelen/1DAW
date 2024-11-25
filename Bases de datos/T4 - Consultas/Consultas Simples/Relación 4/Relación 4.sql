USE contactos;

# 1
SELECT nivelAcademico, COUNT(desempleado)
FROM contactos
WHERE desempleado = 1
GROUP BY nivelAcademico;

SELECT nivelAcademico, SUM(desempleado)
FROM contactos
GROUP BY nivelAcademico;

# 2
SELECT apellidos, nombre, YEAR(CURRENT_DATE) - YEAR(fechaNacimiento) AS edad
FROM contactos
WHERE sexo = 'Mujer' AND YEAR(CURRENT_DATE) - YEAR(fechaNacimiento) >= 25
ORDER BY apellidos, nombre;

# 3
SELECT apellidos, nombre
FROM contactos
WHERE desempleado = 1 AND (aficion1 = 'TV' OR aficion2 = 'TV')
ORDER BY apellidos, nombre;

# 4
SELECT poblacion, COUNT(id) num_personas
FROM contactos
GROUP BY poblacion
HAVING num_personas > 19
ORDER BY COUNT(id) DESC, poblacion;

# 5
SELECT poblacion, COUNT(id) desempleados_menores_25
FROM contactos
WHERE desempleado = 1 AND TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE()) < 25
GROUP BY poblacion
HAVING desempleados_menores_25 > 1;

# 6
SELECT apellidos, nombre
FROM contactos
WHERE sexo = 'Mujer' AND sexualidad = 'Heterosexual' AND poblacion = 'Tarragona'
		AND (aficion1 IN('Cine', 'Música') OR aficion2 IN('Cine', 'Música'))
		AND (YEAR(CURRENT_DATE) - YEAR(fechaNacimiento) <= 28);

# 7
SELECT AVG(YEAR(CURRENT_DATE) - YEAR(fechaNacimiento)) 'Edad media'
FROM contactos
WHERE sexo = 'Hombre' AND cabello = 'Calvo';

# 8 Numero de personas que hay en cada ciudad cuyo correo pertenece al dominio terra.es.
SELECT poblacion, COUNT(*) 'Número de personas'
FROM contactos
WHERE email LIKE '%terra.es'
GROUP BY poblacion;

# 9 Ingresos medios de las personas que tienen entre 15000 y 25000 euros ahorrados.
SELECT AVG(ingresosMensuales) 'Media ingresos'
FROM contactos
WHERE ahorros BETWEEN 15000 AND 25000;

# 10 Apellidos y nombre de las personas que tienen móvil pero no tienen fijo.
SELECT apellidos, nombre
FROM contactos
WHERE movil AND telefono IS NULL;

# 11 Número de personas solteras con hijos de Madrid que tengan unos ingresos anuales de al menos 20000 euros.
SELECT COUNT(*), apellidos, nombre
FROM contactos
WHERE estadoCivil = 'Soltero/a' AND hijos > 0 AND poblacion = 'Madrid' AND ingresosMensuales * 12 >= 20000;

# 12 Ingreso medio por cada edad en la que los ingresos medios sean superiores a 1000 euros.
SELECT YEAR(CURRENT_DATE) - YEAR(fechaNacimiento) Edad, AVG(ingresosMensuales) MediaIngresos
FROM contactos
GROUP BY Edad
HAVING MediaIngresos > 1000;