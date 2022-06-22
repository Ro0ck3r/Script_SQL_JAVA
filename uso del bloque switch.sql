--USO DEL SWTICH O USO DE CASOS
DECLARE
--DECLARACION DE VARIABLES
  resultado number(10,2);
  parametro number(1):=1;
  porcentaje number;
  salario number(10,2):=12000;
BEGIN
  DBMS_OUTPUT.PUT_LINE('EL AUMENTO PARA ESTE EMPLEADO ES: ');
  case
    when (parametro=1) then
      dbms_output.put_line('CONDICION 1 , EMPLEADO CON 5 ANIOS TRABAJANDO');
      porcentaje:=0.05;
      resultado:=porcentaje*salario;
    when(parametro=2) then
      dbms_output.put_line('CONDICION 2 , EMPLEADO CON 10 ANIOS TRABAJANDO');
      porcentaje:=0.15;
      resultado:=porcentaje*salario;  
    else
    dbms_output.put_line('NO PODEMOS CALCULAR EL NUEVO SALARIO CON LOS DATOS INGRESADOS');
  
  end case;
  
  DBMS_OUTPUT.PUT_LINE(resultado);
END;

--HABILITANDO LA SALIDA DE DATOS ESTANDAR
set serveroutput ON;