--CREANDO OTRO TRIGGER QUE SE EJECUTA ANTES DE UN INSERT
CREATE OR REPLACE TRIGGER TG_INSERTA_BRANDS
BEFORE INSERT ON BRANDS
FOR EACH ROW

DECLARE

BEGIN
--TRIM PARA ELIMINAR ESPACIOS ENTRE CADENA DE CARACTERES. FUNCION UPPER ES PARA PONER TODOS LOS CARRECRTES EN MAYUSCULA.
  :NEW.BRAND_NAME:=TRIM(UPPER(:NEW.BRAND_NAME));
END;

-- PROBANDO EL TRIGGER ANTERIOR
--INGRESANDO UN ESPACIO AL UNICIO Y FINAL Y EN MINUSCULA
INSERT INTO BRANDS VALUES (15,' alpina ');

--CREANDO OTRO TRIGGER QUE SE EJECUTA ANTES DE UN UPDATE
CREATE OR REPLACE TRIGGER TG_UPDATE_BRANDS
BEFORE UPDATE ON BRANDS
FOR EACH ROW

DECLARE

BEGIN
--TRIM PARA ELIMINAR ESPACIOS ENTRE CADENA DE CARACTERES. FUNCION UPPER ES PARA PONER TODOS LOS CARRECRTES EN MAYUSCULA.
  :NEW.BRAND_NAME:=TRIM(UPPER(:NEW.BRAND_NAME));
END;

-- PROBANDO EL TRIGGER ANTERIOR
DECLARE

BEGIN
  UPDATE BRANDS SET BRAND_NAME= ' tn bike' WHERE BRAND_ID=13;
  commit;
END;