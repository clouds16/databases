select ListPrice,
	DiscountPercent,
	round(((DiscountPercent / 100) * ListPrice), 2) as DiscountAmount
from Products





select OrderDate,
year(OrderDate) as OrderYear,
day(OrderDate) as DayOnly,
dateadd(day, 30, OrderDate) as DueDate
from Orders


select
CardNumber,
len(CardNumber) as CardNumberLegnth,
right(CardNumber, 4) as LastFourDigits,
'XXXX-XXXX-XXXX-' + right(CardNumber, 4) as FormattedNumber
from Orders

