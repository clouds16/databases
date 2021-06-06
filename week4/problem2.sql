select ProductName, ListPrice
from Products
where ListPrice > (select avg(ListPrice) from Products)
order by 2 desc