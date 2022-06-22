--PARTE #1 USO DE CURSORES. TAMBIEN USO DE %NOTFOUND %ROWCOUNT
DECLARE
  nombre_producto PRODUCTS.PRODUCT_NAME%type;
  cursor cnombre_producto is select product_name from  products;
  
BEGIN
  open cnombre_producto;
  loop
    fetch cnombre_producto into nombre_producto;
    exit when cnombre_producto%notfound;
    dbms_output.put_line('EL NOMBRE DEL PRODUCTO ES : '||nombre_producto);
    dbms_output.put_line('LA CANTIDAD DE REGISTROS ES : '||cnombre_producto%rowcount);
  end loop;
  close cnombre_producto;

END;

--ACTIVANDO SALIDA ESTANDAR
SET SERVEROUTPUT ON;