select * from estudiantes;

set SERVEROUTPUT on;

/*Ejercicio 1*/ /*Cursores implicitos*/
declare
    v_nombre varchar2(50);
    v_apellido varchar2(50);
    v_dni varchar2(50) := '00000000T';
begin
    select nombre, apellidos into v_nombre, v_apellido from estudiantes where dni = v_dni;
    DBMS_OUTPUT.PUT_LINE(v_nombre || ',' || v_apellido);
end;
/

/*Ejercicio 2*/

declare
    v_dni varchar2(50);
    v_apellido varchar2(50);

begin
    select dni, apellidos into v_dni, v_apellido from estudiantes where nombre = 'Blanca';
    DBMS_OUTPUT.PUT_LINE(v_dni || ',' || v_apellido);
    
    exception
        when too_many_rows then
        DBMS_OUTPUT.PUT_LINE('Fallo');
end;
/

/*Ejercicio 3*/ /*Cursores explicitos*/

declare
    cursor c_nombre is select nombre, apellidos, dni from estudiantes;
    v_nombre estudiantes.nombre%type;
    v_apellidos estudiantes.apellidos%type;
    v_dni estudiantes.dni%type;
begin
    open c_nombre;
    fetch c_nombre into v_nombre, v_apellidos, v_dni;
    
    DBMS_OUTPUT.PUT_LINE('Nombre del estudiante: ' || v_nombre);

    
    CLOSE c_nombre;
end;
/

/*Ejercicio 4*/

declare
    cursor c_nombre is select nombre, apellidos, dni from estudiantes;
    v_nombre estudiantes.nombre%type;
    v_apellidos estudiantes.apellidos%type;
    v_dni estudiantes.dni%type;
    v_contador int := 0;
begin
    open c_nombre;
    loop
        fetch c_nombre into v_nombre, v_apellidos, v_dni;
        exit when c_nombre%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Nombre del estudiante: ' || v_nombre || ', Apellidos :' || v_apellidos || ', DNI : ' || v_dni);
        v_contador := v_contador + 1;
    end loop;
    
    close c_nombre;
    
    DBMS_OUTPUT.PUT_LINE('Numero de filas recuperadas: ' || v_contador);
end;
/

/*Ejercicio 5*/

declare
    cursor c_nombre is select nombre, fecha_nacimiento from estudiantes;
    v_nombre estudiantes.nombre%type;
    v_fecha estudiantes.fecha_nacimiento%type;
    v_contador int := 0;

begin
    open c_nombre;
    fetch c_nombre into v_nombre, v_fecha;
    while c_nombre%FOUND LOOP
        fetch c_nombre into v_nombre, v_fecha;
        DBMS_OUTPUT.PUT_LINE('Nombre del estudiante: ' || v_nombre || ', Fecha de nacimiento :' || v_fecha);
        v_contador := v_contador + 1;
    end loop;
    
    close c_nombre;
    
    DBMS_OUTPUT.PUT_LINE('Numero de filas recuperadas: ' || v_contador);
    
end;
/

/*Ejercicio 6*/

declare
    cursor c_nombre is select nombre, apellidos, fecha_nacimiento from estudiantes;
    v_nombre estudiantes.nombre%type;
    v_apellidos estudiantes.apellidos%type;
    v_fecha estudiantes.fecha_nacimiento%type;
    v_contador int := 0;


begin
    
    for estudiante in c_nombre loop
        v_nombre := estudiante.nombre;
        v_apellidos := estudiante.apellidos;
        v_fecha := estudiante.fecha_nacimiento;
        
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_nombre);
        DBMS_OUTPUT.PUT_LINE('Apellidos: ' || v_apellidos);
        DBMS_OUTPUT.PUT_LINE('Fecha de nacimiento: ' || v_fecha);
        
        v_contador := v_contador + 1;
    end loop;
    
    
    
    DBMS_OUTPUT.PUT_LINE('Numero de filas recuperadas: ' || v_contador);
        
end;
/
