USE empresa2;

# 1
SELECT nombre, localidad, debe
FROM clientes
WHERE vendedor_no IN (SELECT emp_no
							FROM empleados
							WHERE dep_no IN (SELECT dep_no
												FROM departamentos
												WHERE localidad <> 'Barcelona'))
		AND cliente_no IN (SELECT cliente_no
								FROM pedidos
								WHERE producto_no IN (SELECT producto_no
															FROM productos
															WHERE precio_actual < 1000));

# 2
SELECT DISTINCT nombre, c.localidad, debe, dnombre, precio_actual, descripcion
FROM clientes c JOIN empleados e ON vendedor_no = emp_no JOIN departamentos d USING (dep_no)
		JOIN pedidos p USING (cliente_no) JOIN productos pr USING (producto_no)
WHERE d.localidad <> 'Barcelona' AND precio_actual < 1000;

# 3
SELECT nomap, dep_no, salario
FROM empleados e
WHERE (dep_no, salario) IN (SELECT dep_no, salario
									FROM empleados e2
									WHERE e.nomap <> e2.nomap)
ORDER BY dep_no, salario;

# 4
SELECT pr.producto_no, COUNT(p.producto_no) num_productos
FROM productos pr LEFT JOIN pedidos p USING (producto_no)
GROUP BY producto_no;

# 5
SELECT dep_no, nomap, salario, (SELECT COUNT(*)
											FROM empleados e1
											WHERE e.dep_no = e1.dep_no) empleados
FROM empleados e
WHERE salario >= ALL (SELECT salario
							FROM empleados e2
							WHERE e.dep_no = e2.dep_no);

# 6
INSERT INTO empleados VALUES (7950, 'MARCOS GARCIA', 'VENDEDOR', 7698, '2015-02-15', 1400, 400, 30),
										(7951, 'JULIA PALMA', 'VENDEDOR', 7698, '2020-01-15', 1400, 300, 30);

# 7
CREATE TABLE productosClientes

# 8


# 9
