set serveroutput on;

-- 1. Haz un programa que te muestre el nombre, el código de los clientes y el límite de crédito y actualice el límite de crédito
-- de todos los clientes en un 5%. Hay que volver a mostrar los clientes después de modificar el crédito. La actualización hay que resolverla con cursores.
DECLARE
    cursor c_clientes is select nombre, cliente_no, limite_credito from clientes for update;
BEGIN
    for it in c_clientes loop
        update clientes
        set limite_credito = limite_credito * 1.05
        where current of c_clientes;
        dbms_output.put_line('Nombre: ' || it.nombre || ' | Código: ' || it.cliente_no || ' | Crédito: ' || it.limite_credito);
    end loop;
    
    dbms_output.put_line('');
    dbms_output.put_line('Aumentamos el límite de crédito un 5%');
    dbms_output.put_line('');
    
    for it in c_clientes loop
        dbms_output.put_line('Nombre: ' || it.nombre || ' | Código: ' || it.cliente_no || ' | Crédito: ' || it.limite_credito);
    end loop;
END;
/

-- 2. Crea una tabla llamada pedidos_clientes donde muestres el nombre de los productos de los pedidos de los distintos clientes.
-- Crea un programa que inserte en dicha tabla todos los productos de los pedidos de los clientes y los muestre. No se pueden crear cursores para resolver el problema.
drop table pedidos_clientes;
create table pedidos_clientes (
    nombre_cliente  varchar2(25),
    pedido          numeric(4),
    descripcion     varchar2(30)
);

BEGIN
    insert into pedidos_clientes
        select nombre, pedido_no, descripcion
        from clientes join pedidos using (cliente_no) join productos using (producto_no);
    
    for it in (select * from pedidos_clientes) loop
        dbms_output.put_line('Nombre: ' || it.nombre_cliente || ' | Pedido: ' || it.pedido || ' | Descripción: ' || it.descripcion);
    end loop;
END;
/

-- 3. Crear un programa que incremente en un 5% el salario de los empleados de un departamento introducido por teclado, y a continuación muestre por pantalla
-- el nombre, el sueldo y el departamento de dichos empleados, una vez actualizados.
DECLARE
    cursor c_sueldo(dept number) is select *
                        from empleados
                        where dep_no = dept
                        for update;
    dept number;
BEGIN
    dept := &departamento;
    
    for it in c_sueldo(dept) loop
        update empleados
        set salario = salario * 1.05
        where current of c_sueldo;
    end loop;
    
    for it in (select * from empleados where dep_no = dept) loop
        dbms_output.put_line('Nombre: ' || it.apellido || ' | Sueldo: ' || (it.salario + NVL(it.comision, 0)) || ' | Depto: ' || it.dep_no);
    end loop;
END;
/

-- 4. Codificar el programa PL/SQL que solicite por pantalla un número de departamento y calcule la suma total de los salarios y comisiones de ese departamento.
-- Después inserta la tupla correspondiente en la tabla TOTALES, previamente creada. Tendréis que controlar que el departamento exista. Si no existe,
-- se elevará un mensaje de error, terminando la ejecución del programa.
drop table totales;
create table totales (
    deptno  number(3),
    total   number(10, 2)
);

DECLARE
    cursor c_dept(dept number) is select dep_no, salario, comision
                                    from empleados
                                    where dep_no = dept;
    reg c_dept%ROWTYPE;
    total number := 0;
    
    no_existe exception;
BEGIN
    open c_dept(&dept);
    
    fetch c_dept into reg;
    
    if c_dept%NOTFOUND then
        raise no_existe;
    end if;
    
    while c_dept%FOUND loop
        total := total + reg.salario + NVL(reg.comision, 0);
        insert into totales values (reg.dep_no, total);
    end loop;
EXCEPTION
    when no_existe then
        dbms_output.put_line('El departamento no existe');
END;
/