select distinct CategoryName
from Categories
where CategoryID in
	(select CategoryID from Products)
order by CategoryName