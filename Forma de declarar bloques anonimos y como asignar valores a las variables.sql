--estructura para declarar un bloque anonimo

declare
--declaracion de variable y asignar un valor a una varible
nombre_completo varchar2(100):='Gustavo Gamero';

begin
-- OJO ASI SE MANDA A IMPRIMIR A LA CONSOLA Y SIEMPRE RECORDAR PONER PUNTO Y COMA
  dbms_output.put_line('El nombre de la persona es: '|| nombre_completo );
end;


--OJO HABILITAR LA SALIDA DE DATOS ESTANDAR
SET SERVEROUTPUT ON;