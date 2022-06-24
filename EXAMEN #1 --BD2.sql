-----------CREACION DE LA TABLA---------------------
CREATE TABLE TBL_ASCENSOS_20162530034 (
CODIGO_ASCENSO NUMBER PRIMARY KEY NOT NULL,
CODIGO_EMPLEADO NUMBER NOT NULL,
DESCRIPCION VARCHAR2(500) NOT NULL,
FECHA_ASCENSO TIMESTAMP NOT NULL,
CANTIDAD_AUMENTO NUMBER
);

CREATE SEQUENCE SQ_TBL_ASCENSOS_20162530034
START WITH 1
INCREMENT BY 1;
--CONSULTAS PARA VERIFICAR SI FUNCIONA BIEN.
select * from emp;

select * from TBL_ASCENSOS_20162530034;
----------------CODIGO FUNCIONAL----------------------
DECLARE
  type tabla_empleados is table of EMP%rowtype index by pls_integer;
  datos_empleados tabla_empleados;
  cantidadLineas number(10);
  indice number(10):=0;

  
BEGIN
   
  SELECT EMP.EMPNO,EMP.ENAME,EMP.JOB,EMP.MGR, EMP.HIREDATE, EMP.SAL,EMP.COMM,EMP.DEPTNO bulk collect into datos_empleados FROM EMP WHERE EXTRACT(MONTH FROM
    TO_DATE(EMP.HIREDATE, 'DD-MON-RR')) != 06 AND EXTRACT(YEAR FROM
    TO_DATE(EMP.HIREDATE, 'DD-MON-RR')) = 1981  and MGR=7698 ;
    cantidadLineas:=sql%rowcount;
    
  for iteracion in 1..cantidadLineas loop
    insert into TBL_ASCENSOS_20162530034 values (SQ_TBL_ASCENSOS_20162530034.nextval,datos_empleados(indice +1).EMPNO,
     'EL EMPLEADO CON CODIGO : '||datos_empleados(indice +1).EMPNO||' NOMBRE: '||datos_empleados(indice +1).ENAME||' CODIGO TRABAJO: '||datos_empleados(indice +1).JOB||
      ' CODIGO JEFE: '||datos_empleados(indice +1).MGR||' CON SALARIO: '||datos_empleados(indice +1).SAL||' Y TRAJABA EN EL DEPARTAMENTO#: '||datos_empleados(indice +1).DEPTNO,SYSTIMESTAMP,
      NULL);
      if(indice<cantidadLineas) then
          indice:=indice+1;
        end if;
  END LOOP;
END;
----------------FIN CODIGO FUNCIONAL----------------------
----EXPERIMENTO RARO ------------------
DECLARE
  type fila is record(
    codigoEmpleado EMP.EMPNO%type,
    nombreEmpleado EMP.ENAME%type,
    codigoTrabajo EMP.JOB%type,
    codigoJefe EMP.MGR%type,
    fechaContratacion EMP.HIREDATE%type,
    salario EMP.SAL%type,
    comision EMP.COMM%type,
    numeroDepa EMP.DEPTNO%type
  );
  
BEGIN
    
SELECT * FROM EMP WHERE EXTRACT(MONTH FROM
  TO_DATE(EMP.HIREDATE, 'DD-MON-RR')) != 06 AND EXTRACT(YEAR FROM
  TO_DATE(EMP.HIREDATE, 'DD-MON-RR')) = 1981  and MGR=7698 ;
END;
-----------FIN EXPERIMENTO RARO ------------------

   
   
  