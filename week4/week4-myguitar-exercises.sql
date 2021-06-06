

/* Problem 1*/

select distinct CategoryName
from Categories
where CategoryID in
	(select CategoryID from Products)
order by CategoryName

/* Problem 2*/
select ProductName, ListPrice
from Products
where ListPrice > (select avg(ListPrice) from Products)
order by 2 desc


/* Problem 3*/
select CategoryName
from Categories c
where not exists
	(select *
	from Products as p
	where p.CategoryID = c.CategoryID)




/*B1
------------------------------------------------------------------------*/
insert into categories 
(category_id, category_name)
values 
(default, 'Brass');

/*B2
------------------------------------------------------------------------*/
UPDATE categories 

SET 
    category_name = 'Woodwinds'
WHERE
    category_id = (select category_id from categories where category_name='Brass');



/* B3 */

DELETE FROM categories 
WHERE
    category_id = (select category_id from categories where category_name='Woodwinds');



/* C1

*/

select ListPrice,
	cast(ListPrice as decimal(18, 1)) as PriceFormat,
	convert(int, ListPrice) as PriceConvert,
	cast(ListPrice as Int) as PriceCast
from Products;


/* C2

*/

select DateAdded,
	format(cast(DateAdded as date), 'MM/dd/yyyy') as AddedDate,
	cast(DateAdded as time(0)) as AddedTime,
	format(cast(DateAdded as date), 'M') as AddedChar7
from Products;



