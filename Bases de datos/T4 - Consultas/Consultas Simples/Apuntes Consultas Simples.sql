USE ejemplos;

# PRIMERA CLASE

# EJEMPLOS DE ALL Y DISTINCT

SELECT oficio FROM empleados; # Muestra todas las filas de una columna, por defecto tiene ALL en el comando, pero no es necesario ponerlo
SELECT DISTINCT oficio FROM empleados; # Muestra las filas repetidos solo una vez


# EJEMPLOS DE SELECCIÓN DE COLUMNAS

SELECT * FROM empleados; # Muestro todas las columnas de la tabla elegida
SELECT nomap, oficio FROM empleados; # Muestro las filas elegidas
SELECT salario + comision  FROM empleados; # Select con una expresión
SELECT salario + comision AS suelto_total FROM empleados; # Utilización de alias
SELECT salario + comision suelto_total FROM empleados; # La palabra reservada AS no es obligatoria
SELECT salario + comision "Suelto Total" FROM empleados; # Para usar espacios, es necesario el uso de comillas


# EJEMPLOS DE CONSULTA

SELECT * FROM empleados;

SELECT *
FROM empleados
WHERE oficio = 'DIRECTOR';

SELECT *
FROM empleados
WHERE oficio <> 'DIRECTOR';

SELECT *
FROM empleados
WHERE salario > 1500;

SELECT *
FROM empleados
WHERE salario + comision > 3000;

SELECT *
FROM empleados
WHERE salario + IFNULL(comision,0) > 3000;


# EJEMPLOS DE BETWEEN

SELECT *
FROM empleados
WHERE salario >= 1600 && salario <= 3000;

SELECT *
FROM empleados
WHERE salario BETWEEN 1600 AND 3000;


# EJEMPLOS DE IN

SELECT *
FROM empleados
WHERE oficio = 'DIRECTOR' || oficio = 'VENDEDOR';

SELECT *
FROM empleados
WHERE oficio IN('DIRECTOR','VENDEDOR');

SELECT *
FROM empleados
WHERE oficio NOT IN('DIRECTOR','VENDEDOR');


# EJEMPLOS DE LIKE

SELECT *
FROM empleados
WHERE nomap LIKE 'M%';

SELECT *
FROM empleados
WHERE nomap NOT LIKE 'M%';

SELECT *
FROM empleados
WHERE nomap LIKE '%MARTIN%';


#-----------------------------------------------------------------------------------------------------------------------------------------------------


# SEGUNDA CLASE
# MANEJO DE LOS VALORES NULOS

# OPERADORES ARITMÉTICOS

SELECT nomap, salario + comision FROM empleados; # Al sumar un entero con un valor nulo, se convierte en nulo
SELECT nomap, salario + IFNULL(comision,0) FROM empleados; # Para evitarlo, convertirmos el nulo en 0


# OPERADORES RELACIONALES

SELECT 10 = NULL;
SELECT 10 <> NULL;
SELECT 10 > NULL;

SELECT nomap
FROM empleados
WHERE comision IS NULL; # No da resultados por la evaluación de los nulos en los operadores relacionales

SELECT nomap
FROM empleados
WHERE comision IS NOT NULL;


# OPERADORES LÓGICOS

SELECT nomap, comision, dep_no
FROM empleados
WHERE comision = NULL OR dep_no > 20; # No sale el resultado esperado porque comision = NULL no es correcto

SELECT nomap, comision, dep_no
FROM empleados
WHERE comision IS NULL OR dep_no > 20;


# OPERADOR COALESCE

SELECT nomap, salario + COALESCE(comision,0) FROM empleados;


# FUNCIONES

SELECT CURRENT_DATE();
SELECT CURRENT_TIME();
SELECT CURRENT_TIMESTAMP();
SELECT ABS(-5);
SELECT CHAR_LENGTH('En el Cielo y en la Tierra, solo yo soy el honrado');
SELECT POSITION('hola' IN 'Dime hola');
SELECT POWER(5,2);
SELECT SQRT(4);
SELECT LOWER('En el Cielo y en la Tierra, solo yo soy el honrado');
SELECT UPPER('En el Cielo y en la Tierra, solo yo soy el honrado');
SELECT SUBSTRING('En el Cielo y en la Tierra, solo yo soy el honrado' FROM 1 FOR 26);


# ORDER BY

SELECT nomap, salario
FROM empleados
ORDER BY salario; # Por defecto ordena ascendentemente

SELECT nomap, salario
FROM empleados
ORDER BY 2; # Ordenamos por la posición de la columna

SELECT nomap, salario
FROM empleados
ORDER BY salario, nomap; # Ordenamos primero por salario, y en caso de que el valor se repita, ordenamos por nomap

SELECT nomap, salario + IFNULL(comision,0) AS salario_real
FROM empleados
ORDER BY salario_real; # Al usar alias, no puede tener comillas porque no lo ordena


#-----------------------------------------------------------------------------------------------------------------------------------------------------


# TERCERA CLASE
# FUNCIONES DE COLUMNA Y AGRUPACIÓN

SELECT AVG(salario) FROM empleados; # Media de los sueldos de todos los empleados
SELECT AVG(salario) FROM empleados WHERE dep_no = 10; # Media de los sueldos de los empleados del departamento 10

SELECT COUNT(*) FROM empleados; # Contar los empleados de la empresa
SELECT COUNT(*) FROM empleados WHERE dep_no = 10; # Contar los empleados del departamento 10
SELECT COUNT(comision) FROM empleados; # Contar todos los empleados que tienen comisión

SELECT MAX(salario) FROM empleados; # Salario máximo de la empresa
SELECT MAX(salario + IFNULL(comision,0)) Sueldo FROM empleados; # Salario máximo de la empresa, sumándole la comisión

SELECT MIN(salario) FROM empleados; # Salario mínimo de la empresa
SELECT MIN(salario + IFNULL(comision,0)) Sueldo FROM empleados; # Salario mínimo de la empresa, sumándole la comisión

SELECT SUM(salario) FROM empleados; # La suma de todos los salarios de la empresa
SELECT SUM(salario + IFNULL(comision,0)) Sueldo FROM empleados; # La suma de todos los salarios y comisiones de la empresa


# GROUP BY

# Salario máximo de cada departamento

SELECT dep_no, MAX(salario) 'Salario máximo'
FROM empleados
GROUP BY dep_no;


# Salario máximo de cada grupo de empleados de cada departamento

SELECT dep_no, oficio, MAX(salario) 'Salario máximo'
FROM empleados
GROUP BY dep_no, oficio;


# Salario máximo de cada grupo de empleados de cada departamento, exceptuando los directores

SELECT dep_no, oficio, MAX(salario) 'Salario máximo'
FROM empleados
WHERE oficio <> 'DIRECTOR'
GROUP BY dep_no, oficio;


# HAVING

# Con Having establecemos condiciones sobre las filas agrupadas

SELECT dep_no, MAX(salario) salario_maximo
FROM empleados
GROUP BY dep_no
HAVING salario_maximo > 3500;

# NO CONFUNDIR con establecer condiciones en el WHERE que se hace antes de la agrupación

SELECT dep_no, MAX(salario) salario_maximo
FROM empleados
WHERE dep_no <> 10
GROUP BY dep_no;