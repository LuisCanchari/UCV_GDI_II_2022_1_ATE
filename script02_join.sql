/*Ejemplos JOIN*/
/**inner join*/
select p.ProductID, p.ProductName, c.CategoryName
from Categories AS c
inner join Products AS p
on c.CategoryID = p.CategoryID


