use Northwind
/*Alias de columnas*/
select ProductID AS Codigo, UnitPrice AS Precio
from Products

/*Alias para tablas*/
Select Products.ProductName AS Producto, Categories.CategoryName AS Categoria
From Products
Inner join Categories
On Products.CategoryID = Categories.CategoryID

Select p.ProductName AS Producto, c.CategoryName AS Categoria
From Products AS p
Inner join Categories AS c
On p.CategoryID = c.CategoryID

