select ListPrice,
	cast(ListPrice as decimal(18, 1)) as Addasdecimal,
	convert(int, ListPrice) as Converttoprice,
	cast(ListPrice as Int) as Castasprice
from Products;