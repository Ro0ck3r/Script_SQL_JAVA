--USO DE BULk COLLECT
DECLARE
--creando variabble record de tipo fila
  type fila is record(
  codigo_categoria CATEGORIES.CATEGORY_ID%type,
  nombre_categoria CATEGORIES.CATEGORY_NAME%type
  );
--creando una tabla de tip[o fila donde cada registro tendra los 2 campos antes espeficicados en la variable fila  
  type tabla_categorias is table of fila index by pls_integer;
  datos_categoria tabla_categorias;
  iteracion number(10):=0;

BEGIN
--HACIENDO USO DEL BULK COLLECT PARA PODER HACER USO DEL INTO CON VARIOS REGISTROS
  select CATEGORIES.CATEGORY_ID, CATEGORIES.CATEGORY_NAME bulk collect into datos_categoria from categories;
  dbms_output.put_line('LA CANTIDAD DE REGISTROS ES: '||SQL%ROWCOUNT);
  
  while(iteracion<SQL%ROWCOUNT) loop
  dbms_output.put_line('EL CODIGO DE LA CATEGORIA ES: '|| datos_categoria(iteracion+1).codigo_categoria);
  dbms_output.put_line('EL NOMBRE DE LA CATEGORIA ES: '|| datos_categoria(iteracion+1).nombre_categoria);
  iteracion:= iteracion+1;
  
  end loop;

END;