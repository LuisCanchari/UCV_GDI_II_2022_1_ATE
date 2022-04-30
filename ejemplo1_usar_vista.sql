/**USO DE VISTAS*/
--1. consultar vista vista_empleados
select * from vista_empleados

--2. infomarmacion de las vistas
exec sp_help 'vista_empleados'
exec sp_helptext 'vista_empleados';

--3.consultar vista vista_productos filtra solo las bebidas
select * from vista_productos
where categoria = 'Beverages';

--3.consultar vista vista_productos que cuenta la cantidad por categoria 
select categoria, count(*) cantidad
from vista_productos
group by categoria;

