use MyGuitarShop

select ListPrice,
	DiscountPercent,
	round(((DiscountPercent / 100) * ListPrice), 2) as DiscountAmount
from Products
