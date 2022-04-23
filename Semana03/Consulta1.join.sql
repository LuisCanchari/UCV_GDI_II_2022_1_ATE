/**Listar los productos con sus nombres categorias*/
Select p.ProductID, p.ProductName, p.CategoryID, c.CategoryName , c.CategoryID
from Products p
right join Categories c
on p.CategoryID = c.CategoryID
order by c.CategoryID