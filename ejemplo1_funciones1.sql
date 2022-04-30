--funciones
SELECT COUNT(DISTINCT region) FROM oficinas;
select * from Customers
select * from Products

SELECT COUNT (DISTINCT City) FROM Customers
select * from Products order by UnitPrice;
SELECT SUM(ALL UnitPrice) 
FROM Products;

SELECT P.CategoryID, SUM(ALL P.UnitPrice) 
FROM Products P
GROUP BY P.CategoryID;


SELECT 
P.PRODUCTID, P.UnitPrice, P.CategoryID, 
SUM(UnitPrice) OVER (PARTITION BY CATEGORYID)
FROM Products P
--ORDER BY P.ProductID
--GROUP BY P.CategoryID;

select * from SUM (UnitPrice) OVER( PARTITION BY categoryid ORDER BY categoryid)  
FROM Products;

