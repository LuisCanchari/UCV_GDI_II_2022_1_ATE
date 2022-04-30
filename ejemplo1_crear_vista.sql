/**CREACION DE VISTAS*/
--1. Crear una vista para simplificar la informacion de empleados
CREATE VIEW vista_empleados
AS
(SELECT e.EmployeeID, e.FirstName, e.LastName, e.ReportsTo 
	FROM Employees e
);

go

--2. Vista con tres campos predefinidos

CREATE VIEW vista_productos (nombre, precio, categoria)
AS
(
	SELECT p.ProductName, p.UnitPrice, c.CategoryName
	FROM Products p
	INNER JOIN Categories c
	ON p.CategoryID = c.CategoryID
)



-- 3. Modificar vista
ALTER VIEW vista_productos (nombre, precio, categoria, limite)
AS
(
	SELECT p.ProductName, p.UnitPrice, c.CategoryName, P.ReorderLevel
	FROM Products p
	INNER JOIN Categories c
	ON p.CategoryID = c.CategoryID
)

--4 Eliminar vista
DROP VIEW vista_productos;



