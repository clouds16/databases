use MyWebDB;
insert into Users
values 
	(1, 'johnsmith@gmail.com', 'John', 'Smith'),
	(2, 'janedoe@yahoo.com', 'Jane ', 'Doe'),
	(3, 'janedoe@yahoo.com', 'Jane', 'Doe');

go
insert into Products
values 
	(1, 'Local Music Volume1'),
	(2, 'Local Music Volume 1'), 
	(3, 'Local Music Volume 2');

go
insert into Downloads
values 
	(1, 1, getdate(), 'Pedals_are_falling.mp3', 2),
	(2, 2, getdate(), 'turn_signal.mp3', 1),
	(3, 2, getdate(), 'one_horse_town.mp3', 2);


go
select u.EmailAddress as email_address,
	u.FirstName as first_name,
	u.LastName as last_name,
	d.DownloadDate as download_date,
	d.FileName as filename,
	p.ProductName as product_name
from Downloads d
join Users u
on u.UserID = d.UserID
join Products p
on p.ProductID = d.UserID
order by EmailAddress desc, ProductName asc