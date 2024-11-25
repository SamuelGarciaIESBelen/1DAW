set serveroutput on; -- ESTA LÍNEA SIEMPRE SE EJECUTA AL PRINCIPIO
-- Para poder crear un usuario nuevo: alter session set "_ORACLE_SCRIPT" = true;

DECLARE
    id SMALLINT;
    num id%TYPE := 5;

    TYPE reg IS RECORD (
        num tcentr.numce%TYPE,
        nom tcentr.nomce%TYPE
    );
    
    r_centro reg;
    
    -- Definición de un cursor estático simple
    CURSOR departamento IS
        SELECT numde, nomde FROM tdepto;
    
    -- Definición de un cursor estático parametrizado
    CURSOR empleado (dept NUMBER) IS
        SELECT numem, nomem
        FROM temple
        WHERE numde = dept; -- Utilizo el parámetro que le paso en la apertura

BEGIN
    id := 1;
    dbms_output.put_line(id);
    dbms_output.put_line(num);
    
    -- Doy valores al registro r_centro
    r_centro.num := 1;
    r_centro.nom := 'General';
    
    dbms_output.put_line(r_centro.num);
    dbms_output.put_line(r_centro.nom);
    
    -- Abro el cursor parametrizado
    OPEN empleados (&n);
END;
/

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

DECLARE
    num number;
BEGIN
    num := 5;
    if (num > 0) then
        dbms_output.put_line('Mayor que 0');
    elsif (num < 0) then
        dbms_output.put_line('Menor que 0');
    else
        dbms_output.put_line('Igual que 0');
    end if;
END;
/

-- -- --

BEGIN
    loop
        dbms_output.put_line('Ejecutando...');
    end loop;
END;
/

-- -- --

DECLARE
    num number;
BEGIN
    num := 1;
    while num<=100 loop
        dbms_output.put_line(num);
        num := num + 1;
    end loop;
END;
/

-- -- --

DECLARE
    num number;
BEGIN
    for i in 1..10 loop
        dbms_output.put_line(i);
    end loop;
END;
/

-- -- --

DECLARE
    cursor curdep is
        select numde, nomde from tdepto;
BEGIN
    for reg_dept in curdep loop
        dbms_output.put_line('Número: ' || reg_dept.numde || ' | Nombre: ' || reg_dept.nomde);
    end loop;
END;
/

-- -- --

BEGIN
    for reg_dept in (select numde, nomde from tdepto) loop
        dbms_output.put_line('Número: ' || reg_dept.numde || ' | Nombre: ' || reg_dept.nomde);
    end loop;
END;
/

-- -- --

DECLARE
    cursor curdep is
        select numde, nomde, presu from tdepto;

    reg_dept curdep%ROWTYPE;
BEGIN
    open curdep;
    
    fetch curdep into reg_dept;
    while curdep%FOUND loop
        dbms_output.put_line(reg_dept.nomde || ' | ' || reg_dept.presu);
        fetch curdep into reg_dept;
    end loop;
    
    close curdep;
END;
/

-- -- --

DECLARE
    nombre tdepto.nomde%type;
BEGIN
    select nomde into nombre
    from tdepto
    where numde = 100;
    
    dbms_output.put_line(nombre);
END;
/

CREATE TABLE numeros_departamentos (
    numde number(5)
);

BEGIN
    -- Inserto con select
    insert into numeros_departamentos
        select numde from tdepto;
    
    for reg in (select * from numeros_departamentos) loop
        dbms_output.put_line(reg);
    end loop;
END;
/
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

--- SENTENCIAS SELECT

-- Obtención de un único valor en una variable
DECLARE
    nombre temple.nomem%TYPE;
BEGIN
    select nomem into nombre
    from temple
    where numem = 110;
    
    dbms_output.put_line(nombre);
END;
/

-- Obtención de un único valor en varias variables
DECLARE
    nombre temple.nomem%TYPE;
    fecha temple.fecin%TYPE;
BEGIN
    select nomem, fecin into nombre, fecha
    from temple
    where numem = 110;

    dbms_output.put_line('Nombre: ' || nombre);
    dbms_output.put_line('Fecha de incorporación: ' || fecha);
END;
/

-- Obtención de todos los campos
DECLARE
    fila temple%ROWTYPE;
BEGIN
    select * into fila
    from temple
    where numem = 110;
    
    dbms_output.put_line('Nombre: ' || fila.nomem);
    dbms_output.put_line('Salario: ' || fila.salar);
END;
/

--- SENTENCIAS INSERT

DROP TABLE numeros_departamentos;
CREATE TABLE NUMEROS_DEPARTAMENTOS (
    numde number(5) primary key
);
/
BEGIN
    insert into numeros_departamentos values (1);
END;
/

-- Inserto múltiples filas con un select

BEGIN
    insert into numeros_departamentos
    select numde from tdepto;
    
    -- Mostramos la información de la tabla numeros_departamentos
    for reg in (select * from numeros_departamentos) loop
        dbms_output.put_line(reg.numde);
    end loop;
END;
/

-- SENTENCIAS UPDATE
BEGIN
     update temple set comis= 50 where comis is null;
     update temple set comis = null where comis = 50;
END;
/

BEGIN
    delete from numeros_departamentos
    where numde = 110;
END;
/

--- EXCEPCIONES

-- Ejemplo 1. Error de división por 0. No tratamos la excepción.
BEGIN
    update temple
    set salar = salar / 0;
END;
/

-- Ejemplo 2. Realizamos el tratamiento de la excepción.
BEGIN
    commit;
    update temple
    set salar = salar / 0;
EXCEPTION
    when zero_divide then rollback;
    dbms_output.put_line('No se puede dividir entre 0');
END;
/

-- Ejemplo 3. Excepciones de usuario
drop table emp_alt_sal;
create table emp_alt_sal (
    num number(5)
);

DECLARE
    emp_sal temple.salar%TYPE;
    emp_no temple.numem%TYPE;
    salario_muy_alto exception;
BEGIN
    select numem, salar into emp_no, emp_sal
    from temple
    where nomem = 'DURAN, LIVIA';
    
    if emp_sal * 1.05 > 2000 then
        raise salario_muy_alto;
    else
        update temple set salar = salar * 1.05
        where nomem = 'DURAN, LIVIA';
    end if;
EXCEPTION
    when no_data_found then dbms_output.put_line('El usuario no existe');
    when salario_muy_alto then
        insert into emp_alt_sal values (emp_no);
        commit;
END;
/

-- Creo una tabla para almacenar el número y el mensaje de error
DROP TABLE errores;
CREATE TABLE errores (
    num number,
    msg varchar2(100)
);

DECLARE
    err_num number;
    err_msg errores.msg%TYPE;
BEGIN
    update empleados
    set salario = salario / 0;
EXCEPTION
    when others then
        err_num := SQLCODE; -- Para capturar el código del error
        err_msg := substr(SQLERRM, 1, 100); -- Para capturar el mensaje del error
        insert into errores values (err_num, err_msg);
        commit;
END;
/

-- Bloques anidados y excepciones

DECLARE
    sueldo temple.salar%TYPE;
    comision temple.comis%TYPE;
    sueldo_total sueldo%TYPE;
    
    sueldo_erroneo exception;
    comision_erronea exception;
BEGIN
    sueldo := &sueldo;
    if sueldo < 0 then
        raise sueldo_erroneo;
    end if;
    
    comision := &comision;
    
    BEGIN
        if comision < 0 then
            raise comision_erronea;
        end if;
    EXCEPTION
        when comision_erronea then
            dbms_output.put_line('Comisión errónea');
            comision := 0;
    END;
    
    sueldo_total := sueldo + comision;
    dbms_output.put_line(sueldo_total);
EXCEPTION
    when sueldo_erroneo then
        dbms_output.put_line('El sueldo no puede ser negativo');
END;
/