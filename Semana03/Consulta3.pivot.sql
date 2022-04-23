Select p.CategoryID, COUNT(*) from Products p
where CategoryID in (1,2)
group by p.CategoryID

Select p.CategoryID 
into #tmp
from Products p
where CategoryID in (1,2)

select * from #tmp
pivot (count(CategoryID) FOR CategoryID in ("1", "2", "3","4")) as cat

