set serveroutput on;

-- 1. Actualiza las comisiones de todos los vendedores en un 5% de su sueldo. --
BEGIN
    update empleados
    set comision = NVL(comision, 0) + salario * 0.05
    where oficio = 'VENDEDOR';

    for it in (select * from empleados where oficio = 'VENDEDOR') loop
        dbms_output.put_line('Apellido: ' || it.apellido || ' | Oficio: ' || it.oficio || ' | Comisión: ' || it.comision);
    end loop;
END;
/

-- 1.5. Repite el ejercicio 1 usando cursores, aunque no sea necesario. --
DECLARE
    cursor c_v is select * from empleados where oficio = 'VENDEDOR' for update;
BEGIN
    for it in c_v loop
        update empleados
        set comision = NVL(comision, 0) + salario * 0.05
        where current of c_v;
    end loop;

    for it in c_v loop
        dbms_output.put_line('Apellido: ' || it.apellido || ' | Oficio: ' || it.oficio || ' | Comisión: ' || it.comision);
    end loop;
END;
/

-- 2. Muestra en pantalla el nombre de los trabajadores del departamento de contabilidad, así como su sueldo. --


-- 3. Crea una tabla llamada “gestión”, donde insertes el nombre de los clientes de la empresa y los vendedores que los atienden. --


-- 3.5. Repite el ejercicio 3, pero mostrando solo el número de trabajadores que indique el usuario desde teclado.
-- Haz una versión con un cursor parametrizado y otra donde lo controles con un bucle while.

-- CURSOR PARAMETRIZADO


-- BUCLE WHILE


-- 4. Crea una tabla llamada “empleados2” donde insertes el número de empleados de cada departamento. --


-- 5. En cada uno de los departamentos, decrementa el sueldo en un 5% del empleado con el sueldo más bajo. --


-- 6. Crea un programa que te pida el número de un empleado. Si ese empleado existe, se le añadirá 50€ a las comisiones que ya tenga.
-- Si no, se mostrará un mensaje de error, y se continuará la ejecución del programa. --


-- 7. Modificar el ejercicio anterior de manera que se detenga la ejecución del programa si ese empleado no existe. --
