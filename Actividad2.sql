select * from dept;
select* from emp;
/*1*/

create or replace procedure insertaDepartamento( v_deptno integer , v_dname varchar, v_loc varchar)
is
begin
    select deptno into v_deptno from dept where deptno = v_deptno;
    exception
        when no_data_found then
        insert into dept values (v_deptno, v_dname, v_loc);
end;
/

declare
    v_deptno integer;
    v_dname varchar2(50);
    v_loc varchar2(50);
begin
    v_deptno := 50;
    v_dname := 'Prueba';
    v_loc := 'Sevilla';
    insertaDepartamento(v_deptno, v_dname, v_loc);
end;
/

