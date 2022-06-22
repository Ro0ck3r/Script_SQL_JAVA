--FORMA DE UTILIZAR UN SELECT INTO, ESTO SOLO ES PARA UN SOLO REGISTRO--
DECLARE
--CON ESTE COMANDO VA A TOMAR EL TIPO DE DATO COMO ESTA DEFINIDO EN LA TABLA--
  nombre products.product_name%TYPE;
BEGIN
  select product_name into nombre from products where PRODUCT_ID=1;
  dbms_output.put_line('EL NOMBRE DEL PRODUCTO CON ID 1 ES : '|| nombre);
END;
--FORMA DE UTILIZAR UN SELECT INTO PARA VARIAS REGISTROS HACIENDO USO DE UN CICL0--
DECLARE
--CON ESTE COMANDO VA A TOMAR EL TIPO DE DATO COMO ESTA DEFINIDO EN LA TABLA--
  nombre products.product_name%TYPE;
  iteracion number(10):=1;
  cantidad_productos number(10);
BEGIN
  select count (product_name)into cantidad_productos from PRODUCTS;
  
  loop
    exit when  iteracion>cantidad_productos;
    select product_name into nombre from products where PRODUCT_ID=iteracion;
    dbms_output.put_line('EL NOMBRE DEL PRODUCTO CON ID '||iteracion||' ES : '|| nombre);
    iteracion:=iteracion+1;
  end loop;
END;
--SELECT INTO CUANTO QUEREMOS RETORNAR VARIOS CAMPOS, OJO ESTO ES CUANDO QUEREMOS RETORNAR SOLO 1 ARTICULO--
DECLARE
  nombre PRODUCTS.PRODUCT_NAME%type;
  modelo PRODUCTS.MODEL_YEAR%type;
  precio PRODUCTS.LIST_PRICE%type;
BEGIN
  select PRODUCT_NAME,model_year,list_price into nombre,modelo,precio from PRODUCTS where PRODUCT_ID=1;
  dbms_output.put_line('EL NOMBRE DEL PRODUCTO CON ID 1 ES: '||nombre);
  dbms_output.put_line('EL MODELO DEL PRODUCTO CON ID 1 ES: '||modelo);
  dbms_output.put_line('EL PRECIO DEL PRODUCTO CON ID 1 ES: '||precio);
END;
--SELECT INTO CUANTO QUEREMOS RETORNAR MULTIPLES CAMPOS Y MULTIPLES REGISTROS--
DECLARE
  nombre PRODUCTS.PRODUCT_NAME%type;
  modelo PRODUCTS.MODEL_YEAR%type;
  precio PRODUCTS.LIST_PRICE%type;
  iteracion number(10):=1;
  cantidadRegistros number(10);
BEGIN
  select count (product_name) into cantidadRegistros from products;
  loop
    exit when iteracion>cantidadRegistros;
    select PRODUCT_NAME,model_year,list_price into nombre,modelo,precio from PRODUCTS where PRODUCT_ID=1;
    dbms_output.put_line('EL NOMBRE DEL PRODUCTO CON ID '||iteracion||'  ES: '||nombre);
    dbms_output.put_line('EL MODELO DEL PRODUCTO CON ID '||iteracion||'  ES: '||modelo);
    dbms_output.put_line('EL PRECIO DEL PRODUCTO CON ID '||iteracion||'  ES: '||precio);
  iteracion:=iteracion+1;
  end loop;
END;


set serveroutput on;


-- SE USA PARA DESCRIBIR UNA TABLA--
DESC PRODUCTS;


