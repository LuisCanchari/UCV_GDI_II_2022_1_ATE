/*Tabla temporal*/
Select e.FirstName, e.LastName, e.City 
into #EmpleadosResumen
from Employees e


Select * from #EmpleadosResumen

/*La tabla temporal solo existe para la sesi�n donde se cre�*/