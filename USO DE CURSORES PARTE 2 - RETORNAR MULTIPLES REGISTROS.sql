--USO DE CURSORES PARA IMPRIMIR VARIAS VARIABLES FORMA#1--
DECLARE
  nombre_producto PRODUCTS.PRODUCT_NAME%type;
  modelo_producto PRODUCTS.MODEL_YEAR%type;
  nombre_categoria CATEGORIES.CATEGORY_NAME%type;
  cursor cdatos_producto is select PRODUCTS.PRODUCT_NAME, CATEGORIES.CATEGORY_NAME, PRODUCTS.MODEL_YEAR from  products 
  inner join CATEGORIES on products.category_id=CATEGORIES.category_id ;
  
BEGIN
  open cdatos_producto;
  loop
    fetch cdatos_producto into nombre_producto,nombre_categoria , modelo_producto ;
    dbms_output.put_line('EL NOMBRE DEL PRODUCTO ES : '||nombre_producto);
    dbms_output.put_line('EL NOMBRE DE LA CAGORIA ES ES : '||nombre_categoria);
    dbms_output.put_line('EL MODELO DEL PRODUCTO ES : '||modelo_producto);
    
    --IMPRIMIR UN CAMBIO DE LINEA CON LA FUNCION CHR Y TENEMOS QUE MANDARLE DE COMO PARAMETRO 13 --
    dbms_output.put_line(chr(13));
    
    --SE PONE EL EXIT ANTES DE LA IMPRESION DE VALOR DE CURSOR PARA QUE ESTE NO REPITA SU ULTIMO VALOR--
    exit when cdatos_producto%notfound;
    dbms_output.put_line('EL VALOR DEL CURSOR ES: '||cdatos_producto%ROWCOUNT);

  end loop;
  
  close cdatos_producto;

END;

--ACTIVANDO SALIDA ESTANDAR
SET SERVEROUTPUT ON;
--USO DE CURSORES PARA IMPRIMIR VARIAS VARIABLES FORMA#2--
DECLARE

  cursor cdatos_producto is select PRODUCTS.PRODUCT_NAME, CATEGORIES.CATEGORY_NAME, PRODUCTS.MODEL_YEAR from  products 
  inner join CATEGORIES on products.category_id=CATEGORIES.category_id ;
  registro cdatos_producto%rowtype;
  
BEGIN
  open cdatos_producto;
  loop
    fetch cdatos_producto into registro ;
    dbms_output.put_line('EL NOMBRE DEL PRODUCTO ES : '||registro.product_name);
    dbms_output.put_line('EL NOMBRE DE LA CAGORIA ES ES : '||registro.model_year);
    dbms_output.put_line('EL MODELO DEL PRODUCTO ES : '||registro.category_name);
    
    --IMPRIMIR UN CAMBIO DE LINEA CON LA FUNCION CHR Y TENEMOS QUE MANDARLE DE COMO PARAMETRO 13 --
    dbms_output.put_line(chr(13));
    
    --SE PONE EL EXIT ANTES DE LA IMPRESION DE VALOR DE CURSOR PARA QUE ESTE NO REPITA SU ULTIMO VALOR--
    exit when cdatos_producto%notfound;
    dbms_output.put_line('EL VALOR DEL CURSOR ES: '||cdatos_producto%ROWCOUNT);

  end loop;
  
  close cdatos_producto;

END;





