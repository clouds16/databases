
select DateAdded,
	format(cast(DateAdded as date), 'MM/dd/yyyy') as Addasdate,
	cast(DateAdded as time(0)) as Addastime,
	format(cast(DateAdded as date), 'M') as Addaschar
from Products;