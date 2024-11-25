USE ejemplos;

# 1. Recuperar los empleados que tengan algún cliente a su cargo.
SELECT nomap
FROM empleados
WHERE emp_no IN (SELECT DISTINCT vendedor_no
						FROM clientes);

# 2. Recuperar los clientes que tengan algún pedido de 3 unidades.
SELECT nombre
FROM clientes
WHERE cliente_no IN (SELECT cliente_no
							FROM pedidos
							WHERE unidades = 3);

# 3. Hallar todos los datos de los productos cuya media de unidades pedidas sea superior a la media de unidades pedidas en todos los pedidos.
SELECT *
FROM productos
WHERE producto_no IN (SELECT producto_no
							FROM pedidos
							GROUP BY pedido_no
							HAVING AVG(unidades) > (SELECT AVG(unidades)
															FROM pedidos));

# 4. Obtener los empleados cuyo sueldo (SALARIO + COMISION) sea superior a la media de su oficio.
SELECT nomap
FROM empleados e
WHERE salario + IFNULL(comision, 0) > (SELECT AVG(salario + IFNULL(comision, 0))
													FROM empleados o
													WHERE e.oficio = o.oficio
													GROUP BY oficio);

# 5. Obtener los datos de los clientes que tienen como vendedor a ALONSO.
SELECT *
FROM clientes
WHERE vendedor_no IN (SELECT emp_no
							FROM empleados
							WHERE nomap LIKE '%Alonso%');

# 6. Obtener el APELLIDO y OFICIO de los empleados que trabajan en el departamento de ventas.
SELECT SUBSTRING_INDEX(nomap, ' ', -1) apellido, oficio
FROM empleados
WHERE dep_no = (SELECT dep_no
					FROM departamentos
					WHERE dnombre = 'Ventas');

# 7. Hallar los datos de los clientes que han hecho algún pedido del producto SILLA DIRECTOR MOD. BUFALO.
SELECT *
FROM clientes
WHERE cliente_no IN (SELECT cliente_no
							FROM pedidos
							WHERE producto_no = (SELECT producto_no
														FROM productos
														WHERE descripcion = 'SILLA DIRECTOR MOD. BUFALO'));

# 8. Recuperar aquellos productos de los que no se ha realizado ningún pedido nunca.
SELECT *
FROM productos
WHERE producto_no NOT IN (SELECT producto_no FROM pedidos);

# 9. Mostrar los datos de los empleados que tienen mayor SALARIO que el resto de empleados de su departamento.
SELECT *
FROM empleados e1
WHERE salario = (SELECT MAX(salario)
    					FROM empleados e2
    					WHERE e1.dep_no = e2.dep_no);
SELECT *
FROM empleados
WHERE (salario, dep_no) IN (SELECT MAX(salario), dep_no
    									FROM empleados
    									GROUP BY dep_no);

# 10. Obtener todos los datos del departamento que más dinero le cuesta a la empresa, es decir,
# donde la suma de los sueldos (SALARIO + COMISION) es mayor que en el resto de departamentos.
CREATE OR REPLACE VIEW total_sueldos_dep AS
	SELECT dep_no, SUM(salario + IFNULL(comision, 0)) total_sueldos
	FROM empleados
	GROUP BY dep_no
	ORDER BY dep_no;

SELECT *
FROM departamentos
WHERE dep_no IN (SELECT dep_no
						FROM total_sueldos_dep
						WHERE total_sueldos = (SELECT MAX(total_sueldos)
														FROM total_sueldos_dep));

# 11. Encontrar los datos de los clientes que tienen como vendedor al empleado que menos gana en cada departamento.
CREATE OR REPLACE VIEW peor_vendedor_dep AS
	SELECT *
	FROM empleados e1
	WHERE salario = (SELECT MIN(salario)
    						FROM empleados e2
    						WHERE e1.dep_no = e2.dep_no)
	ORDER BY dep_no;

SELECT *
FROM clientes
WHERE vendedor_no IN (SELECT emp_no
							FROM peor_vendedor_dep);