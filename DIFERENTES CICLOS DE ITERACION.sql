--CICLO LOOP ESTE CICLO SE CORRE AUN QUE SEA UNA UNICA VEZ
DECLARE
  iteracion number(3):=0;
  fecha date:=sysdate;

BEGIN
  loop
    exit when iteracion>3;
    dbms_output.put_line('EL CICLO ACTUAL ES EL NUMERO: '||iteracion);
    dbms_output.put_line(fecha);
    fecha:=sysdate+iteracion;
    iteracion:=iteracion+1;
  end loop;

END;
--------------------------------------------------------
--CICLO WHILE
DECLARE
  iteracion number(3):=0;
  fecha date:=sysdate;

BEGIN
  while (iteracion<3) loop
    dbms_output.put_line('EL CICLO ACTUAL ES EL NUMERO: '||iteracion);
    dbms_output.put_line(fecha);
    fecha:=sysdate+iteracion;
    iteracion:=iteracion+1;
  end loop;

END;
---------------------------------------------------------
--CICLO FOR
DECLARE
--no es necesario asignarle un valor para que funcione y tampoco es necesario crearla
  iteracion number(3);
  fecha date:=sysdate;

BEGIN
--OJO: EL VALOR FINAL Y INICIAL PUEDE SER SUSTITUIDO POR UNA VARIABLE
  for iteracion in 0..5 loop
    dbms_output.put_line('EL CICLO ACTUAL ES EL NUMERO: '||iteracion);
    dbms_output.put_line(fecha);
    fecha:=sysdate+iteracion;
  end loop;

END;




set serveroutput on;