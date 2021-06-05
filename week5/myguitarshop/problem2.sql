select OrderDate,
year(OrderDate) as OrderYear,
day(OrderDate) as DayOnly,
dateadd(day, 30, OrderDate) as DueDate
from Orders