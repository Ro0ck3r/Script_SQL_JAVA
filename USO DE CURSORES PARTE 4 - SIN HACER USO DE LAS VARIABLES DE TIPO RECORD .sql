DECLARE
--CREANDO UNA TABLA SIN HACER USO DEL VARIBALES DE TIPO RECORD. OSEA EN BASE A LOS REGISTROS DE LA BASE DE DATOS
  type tabla_categorias is table of categories%rowtype index by pls_integer;
  datos_categoria tabla_categorias;
  iteracion number(10):=0;

BEGIN
  select categories.category_id, CATEGORIES.CATEGORY_NAME bulk collect into datos_categoria from CATEGORIES;
  dbms_output.put_line('LA CANTIDAD DE REGISTROS ES: '|| sql%rowcount);
  
  while (iteracion<sql%rowcount) loop
  dbms_output.put_line('EL CODIGO DE LA CATEGORIA ES: '|| datos_categoria(iteracion+1).category_id);
  dbms_output.put_line('EL NOMBRE DE LA CATEGORIA ES: '|| datos_categoria(iteracion+1).category_name);
  iteracion:=iteracion+1;
  end loop;

END;

set SERVEROUTPUT ON;
