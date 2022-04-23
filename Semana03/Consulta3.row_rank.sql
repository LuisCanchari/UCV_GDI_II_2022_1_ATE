/**Consultas de ubicacion*/
Select row_number() over (order by p.productName),
p.ProductName, p.CategoryID, p.ProductID
from Products p
where p.CategoryID = 1
order by p.ProductName

Select row_number() over (partition by p.CategoryID order by p.productName),
p.ProductName, p.CategoryID, p.ProductID
from Products p
order by p.CategoryID

/**Rank*/
Select rank() over (order by p.categoryID),
p.ProductName, p.CategoryID, p.ProductID
from Products p


