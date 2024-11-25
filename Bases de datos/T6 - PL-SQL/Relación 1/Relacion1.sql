set serveroutput on;

-- 1 --
DECLARE
    numero numeric(2);

BEGIN
    numero := 22;
    dbms_output.put_line(numero);
END;
/

-- 2 --
DECLARE
    PI constant dec(5,4) := 3.1415;
    -- PI constant float := 3.1415;

BEGIN
    dbms_output.put_line(PI);
END;
/

-- 3 --
DECLARE 
    apellido empleados.apellido%TYPE;

BEGIN
    apellido := 'Zorrilla';
    dbms_output.put_line(apellido);
END;
/

-- 4 --
DECLARE
    salario empleados.salario%TYPE := 1200;
    
BEGIN
    dbms_output.put_line(salario || ' €');
END;
/

-- 5 --
DECLARE
    empleado empleados%ROWTYPE;
    
BEGIN
    dbms_output.put_line('Alright');
END;
/

-- 6 --
DECLARE
    TYPE datos_empleado IS RECORD (
        emp_no empleados.emp_no%TYPE,
        apellido empleados.apellido%TYPE);
    
    r_empleado datos_empleado;

BEGIN
    r_empleado.apellido := 'Zorrilla';
    dbms_output.put_line(r_empleado.apellido);
END;
/

-- 7 --
DECLARE
    CURSOR vendedor IS
        SELECT apellido, salario
        FROM empleados
        WHERE oficio = 'vendedor';

BEGIN
    dbms_output.put_line('Alright');
END;
/

-- 8 --
DECLARE
    CURSOR empleado (oficio empleados.oficio%type) IS
        SELECT apellido, salario
        FROM empleados
        WHERE oficio = oficio;

BEGIN
    -- open empleado('director');
    open empleado('&oficio');
    dbms_output.put_line('Ok');
END;
/

-- 9 --
DECLARE
    oficio empleados.oficio%TYPE;
BEGIN
    select e.oficio into oficio
    from empleados e
    where apellido = 'REY';
    
    dbms_output.put_line(oficio);
END;
/