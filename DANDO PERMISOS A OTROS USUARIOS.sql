--DANDOLE PRIVILEGIOS A UN USUARIO DISTINTO EN OTRA BASE DE DATOS
GRANT SELECT ON BD_CENSO.PAISES TO ADMINISTRADORES;
GRANT INSERT,UPDATE,DELETE ON BD_CENSO.PAISES TO ADMINISTRADORES;

--ELIMINANDO PROVILEGIOS A OTRO USUARIO
select * from DBA_SYS_PRIVS where grantee='ADMINISTRADORES';

select * from DBA_TAB_PRIVS where GRANTEE='ADMINISTRADORES';
--eliminar privilegio para poder crear, eliminar, modificar procedimientos.
REVOKE create any procedure, drop any procedure, alter any procedure from ADMINISTRADORES;
--eliminar privilegio para poder hacer SELECT 
REVOKE select on BD_CENSO.PAISES FROM ADMINISTRADORES;

--aqui estamos volviendo a dar los privilegios a el rol ADMINISTRADORES para crear procedimientos almacenados
GRANT CREATE ANY PROCEDURE, DROP ANY PROCEDURE, ALTER ANY PROCEDURE TO ADMINISTRADORES;

