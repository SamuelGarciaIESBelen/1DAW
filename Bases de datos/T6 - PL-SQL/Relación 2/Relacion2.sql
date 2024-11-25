set serveroutput on;

-- 1. Actualiza las comisiones de todos los vendedores en un 5% de su sueldo. --
BEGIN
    update empleados
    set comision = NVL(comision, 0) + salario * 0.05
    where oficio = 'VENDEDOR';
    
    for reg in (select * from empleados where oficio = 'VENDEDOR') loop
        dbms_output.put_line('Apellido: ' || reg.apellido || ' | Oficio: ' || reg.oficio || ' | Comisión: ' || reg.comision);
    end loop;
END;
/

-- 1.5. Repite el ejercicio 1 usando cursores, aunque no sea necesario. --
DECLARE
    cursor comis is
                select *
                from empleados
                where oficio = 'VENDEDOR'
                for update;
BEGIN
    for it in comis loop
        update empleados
        set comision = NVL(comision, 0) + salario * 0.05
        where current of comis;
    end loop;
    
    for reg in (select * from empleados where oficio = 'VENDEDOR') loop
        dbms_output.put_line('Apellido: ' || reg.apellido || ' | Oficio: ' || reg.oficio || ' | Comisión: ' || reg.comision);
    end loop;
END;
/

-- 2. Muestra en pantalla el nombre de los trabajadores del departamento de contabilidad, así como su sueldo. --
DECLARE
    cursor c_emp_cont is
                        select *
                        from empleados
                        where dep_no = (select dep_no
                                        from departamentos
                                        where dnombre = 'CONTABILIDAD');
BEGIN
    for i in c_emp_cont loop
        dbms_output.put_line('Apellido: ' || i.apellido || ' | Sueldo: ' || (i.salario + NVL(i.comision, 0)));
    end loop;
END;
/

-- 3.1. Crea una tabla llamada “gestión”, donde insertes el nombre de los clientes de la empresa y los vendedores que los atienden. --
DROP TABLE gestion;
CREATE TABLE gestion (
    cliente     varchar2(25),
    vendedor    varchar2(8)
);

DECLARE
    cursor c_clien_vend is
                        select apellido, nombre
                        from empleados join clientes on emp_no = vendedor_no;
BEGIN
    for it in c_clien_vend loop
        insert into gestion values (it.nombre, it.apellido);
    end loop;
    
    for it in (select * from gestion) loop
        dbms_output.put_line('Cliente: ' || it.cliente || ' | Vendedor: ' || it.vendedor);
    end loop;
END;
/

-- 3.2. Crea una tabla llamada “gestión”, donde insertes el nombre de los clientes de la empresa y los vendedores que los atienden. --
DROP TABLE gestion;
CREATE TABLE gestion (
    nombre      varchar2(25),
    vendedor    varchar2(8)
);

BEGIN
    insert into gestion
        select c.nombre, v.apellido
        from clientes c join empleados v on (c.vendedor_no = v.emp_no);

    for reg in (select * from gestion) loop
        dbms_output.put_line(reg.nombre || ' ' || reg.vendedor);
    end loop;
END;
/

-- 3.5. Repite el ejercicio 3, pero mostrando solo el número de trabajadores que indique el usuario desde teclado.
-- Haz una versión con un cursor parametrizado y otra donde lo controles con un bucle while.

-- CURSOR PARAMETRIZADO
DECLARE
	CURSOR c_emp_cont (num NUMBER) IS 
                                    SELECT *
                                    FROM empleados
                                    WHERE dep_no = (SELECT dep_no
                                                    FROM departamentos
                                                    WHERE dnombre = 'CONTABILIDAD')
                                    AND ROWNUM <= num;
    reg c_emp_cont%ROWTYPE;
BEGIN
    OPEN c_emp_cont(&numero);
    FETCH c_emp_cont into reg;
    
    WHILE c_emp_cont%FOUND LOOP
		DBMS_OUTPUT.PUT_LINE('Nombre: ' || reg.apellido);
		DBMS_OUTPUT.PUT_LINE('Sueldo: ' || (reg.salario + NVL(reg.comision,0)));
		DBMS_OUTPUT.PUT_LINE('.');
        FETCH c_emp_cont into reg;
    END LOOP;
        
    CLOSE c_emp_cont;
END;
/

-- BUCLE WHILE
DECLARE
	CURSOR c_emp_cont  IS 
                        SELECT *
                        FROM empleados
                        WHERE dep_no = (SELECT dep_no
                                        FROM departamentos
                                        WHERE dnombre = 'CONTABILIDAD');
    reg c_emp_cont%ROWTYPE;
    num NUMBER;
    cont NUMBER;
BEGIN
    num := &numero;
    cont := 0;
    
    OPEN c_emp_cont;
    FETCH c_emp_cont into reg;
    
    WHILE c_emp_cont%FOUND and cont < num LOOP
		DBMS_OUTPUT.PUT_LINE('Nombre: ' || reg.apellido);
		DBMS_OUTPUT.PUT_LINE('Sueldo: ' || (reg.salario + NVL(reg.comision,0)));
		DBMS_OUTPUT.PUT_LINE('.');
        cont := cont + 1;
        FETCH c_emp_cont into reg;
    END LOOP;
    
    CLOSE c_emp_cont;
END;
/

-- 4. Crea una tabla llamada “empleados2” donde insertes el número de empleados de cada departamento. --
DROP TABLE empleados2;
CREATE TABLE empleados2 (
    dep_no  number(2),
    total   number(4)
);

DECLARE
    cursor c_emp is
                    select dep_no, count(*) num
                    from empleados
                    group by dep_no;
BEGIN
    for it in c_emp loop
        insert into empleados2 values (it.dep_no, it.num);
    end loop;
    
    for reg in (select * from empleados2) loop
        dbms_output.put_line('Departamento: ' || reg.dep_no || ' | Empleados: ' || reg.total);
    end loop;
END;
/

-- 5. En cada uno de los departamentos, decrementa el sueldo en un 5% del empleado con el sueldo más bajo. --
DECLARE
    cursor c_min_sueldo is
                        select dep_no, salario
                        from empleados E
                        where salario in (select min(salario)
                                            from empleados
                                            where E.dep_no = dep_no)
                        for update;
BEGIN
    for it in c_min_sueldo loop
        update empleados
        set salario = salario - it.salario * 0.05
        where current of c_min_sueldo;
    end loop;
    
    for reg in c_min_sueldo loop
        dbms_output.put_line('Empleado: ' || reg.dep_no || ' | Salario: ' || reg.salario);
    end loop;
END;
/

-- 6. Crea un programa que te pida el número de un empleado. Si ese empleado existe, se le añadirá 50€ a las comisiones que ya tenga.
-- Si no, se mostrará un mensaje de error, y se continuará la ejecución del programa. --
DECLARE
    num empleados.emp_no%type;
    filas number;
BEGIN
    num := '&numero_empleado';
    select count(*) into filas from empleados where emp_no = num;
    
    if filas = 0 then
        dbms_output.put_line('El empleado no existe');
    else
        update empleados
        set comision = NVL(comision, 0) + 50
        where emp_no = num;
    end if;
END;
/

-- 7. Modificar el ejercicio anterior de manera que se detenga la ejecución del programa si ese empleado no existe. --
DECLARE
    num empleados.emp_no%type;
    filas number;
    no_existe exception;
BEGIN
    num := '&numero_empleado';
    select count(*) into filas from empleados where emp_no = num;
    
    if filas = 0 then
        raise no_existe;
    end if;
    
    update empleados
    set comision = NVL(comision, 0) + 50
    where emp_no = num;
EXCEPTION
    when no_existe then
        dbms_output.put_line('El empleado no existe');
END;
/