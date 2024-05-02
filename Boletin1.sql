select * from estudiantes;


set SERVEROUTPUT on;

--Ejercicio 1

declare
    v_year int;
begin
    v_year := &Introduzca_numero;
    
    if mod(v_year,4) = 0 then
        DBMS_OUTPUT.PUT_LINE('El año es bisiesto');
    else
        DBMS_OUTPUT.PUT_LINE('El año no es bisiesto');
    end if;
end;
/

--Ejercicio 2

declare
    v_year int;
    fecha date;
    fecha1 date;
begin
    v_year :=  &Introduzca_numero;
    fecha := to_date('31/12/' || v_year);
    fecha1 := '01/01/'|| v_year;
    
    if fecha-fecha1+1 = 366 then
        DBMS_OUTPUT.PUT_LINE('El año es bisiesto');
    else
        DBMS_OUTPUT.PUT_LINE('El año no es bisiesto');
    end if;
    
end;
/
--Ejercicio 3

declare
    numero int := &numero;
    contP int := 1;
    contImp int := 1;
    TYPE NUMEROS IS TABLE OF INTEGER
    INDEX BY BINARY_INTEGER;
    NUMSP NUMEROS;
    NUMSIMP NUMEROS;
begin
 
    for i in 1..numero loop
        if mod(i,2)=0 then
            numsp(contp) := i;
            contp := contp +1;
        else
            numsimp(contImp) := i;
            contImp := contImp +1;
        end if;
    end loop;
 
    DBMS_OUTPUT.PUT_LINE('Números pares:');
    FOR j IN 1..NUMSP.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(NUMSP(j));
    END LOOP;

 
    DBMS_OUTPUT.PUT_LINE('Números impares:');
    FOR k IN 1..NUMSIMP.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(NUMSIMP(k));
    END LOOP;
end;
/

--Ejercicio 4

--Ejercicio 5

--Ejercicio 6

--Ejercicio 7

--Ejercicio 8

--Ejercicio 9

--Ejercicio 10

--Ejercicio 11

--Ejercicio 12

--Ejercicio 13

--Ejercicio 14

--Ejercicio 15

--Ejercicio 16

--Ejercicio 17

--Ejercicio 18

--Ejercicio 19

--Ejercicio 20

--Ejercicio 21

--Ejercicio 22

--Ejercicio 23

--Ejercicio 24

--Ejercicio 25

--Ejercicio 26

--Ejercicio 27

--Ejercicio 28

--Ejercicio 29

--Ejercicio 30

--Ejercicio 31

--Ejercicio 32

--Ejercicio 33

--Ejercicio 34

--Ejercicio 35

--Ejercicio 36

--Ejercicio 37

--Ejercicio 38

--Ejercicio 39

--Ejercicio 40

--Ejercicio 41

--Ejercicio 42
