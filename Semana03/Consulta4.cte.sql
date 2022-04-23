/**Subconsultas*/

Select c.codigo, c.nombre, c.apellido
from 
(Select e.EmployeeID codigo, e.FirstName nombre, e.LastName apellido from Employees e) c
where c.codigo > 5

/**CTE*/

with tablita(codigo, nombre, apellido) as
(
	Select e.EmployeeID codigo, e.FirstName nombre, e.LastName apellido 
	from Employees e
)

select * from tablita


