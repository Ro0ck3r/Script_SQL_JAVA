--USO DE VARIABLES DE TIPO RECORD
DECLARE

  type fila is record (
  nombre_producto PRODUCTS.PRODUCT_NAME%type, 
  nombre_categoria CATEGORIES.CATEGORY_NAME%type,
  anio_modelo PRODUCTS.MODEL_YEAR%type,
  id_categoria categories.category_id%type
  );
  cursor cdatos_producto is select PRODUCTS.PRODUCT_NAME, CATEGORIES.CATEGORY_NAME, PRODUCTS.MODEL_YEAR, categories.category_id from  products 
  inner join CATEGORIES on products.category_id=CATEGORIES.category_id ;
  datos_cursor fila;
  
BEGIN
  open cdatos_producto;
  loop
    fetch cdatos_producto into datos_cursor ;
    dbms_output.put_line('EL NOMBRE DEL PRODUCTO ES : '||datos_cursor.nombre_producto);
    dbms_output.put_line('EL NOMBRE DE LA CAGORIA ES ES : '||datos_cursor.anio_modelo);
    dbms_output.put_line('EL MODELO DEL PRODUCTO ES : '||datos_cursor.nombre_categoria);
    dbms_output.put_line('EL ID DE LA CATEGORIA DEL PRODUCTO ES: '||datos_cursor.id_categoria);
    
    --IMPRIMIR UN CAMBIO DE LINEA CON LA FUNCION CHR Y TENEMOS QUE MANDARLE DE COMO PARAMETRO 13 --
    dbms_output.put_line(chr(13));
    
    --SE PONE EL EXIT ANTES DE LA IMPRESION DE VALOR DE CURSOR PARA QUE ESTE NO REPITA SU ULTIMO VALOR--
    exit when cdatos_producto%notfound;
    dbms_output.put_line('EL VALOR DEL CURSOR ES: '||cdatos_producto%ROWCOUNT);

  end loop;
  
  close cdatos_producto;

END;