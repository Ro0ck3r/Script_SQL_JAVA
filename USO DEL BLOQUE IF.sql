--USO DEL BLOQUE IF
DECLARE
--DECLARACION DE VARIABLES
  resultado number(10,2);
  parametro number(1):=2;
  porcentaje number;
  salario number(10,2):=12000;
BEGIN
  DBMS_OUTPUT.PUT_LINE('EL AUMENTO PARA ESTE EMPLEADO ES: ');
  if (parametro=1) then
    porcentaje:=0.05;
    resultado:=porcentaje*salario;
  elsif(parametro=2) then
    porcentaje:=0.15;
    resultado:=porcentaje*salario;  
  else
    dbms_output.put_line('NO PODEMOS CALCULAR EL NUEVO SALARIO CON LOS DATOS INGRESADOS');
  
  end if;
  
  DBMS_OUTPUT.PUT_LINE(resultado);
END;

--HABILITANDO LA SALIDA DE DATOS ESTANDAR
set serveroutput ON;