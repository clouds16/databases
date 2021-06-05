use MyWebDB;
alter table Products
add ProductPrice numeric(5,2) default 9.99;

go
alter table Products
add DateProductAdded smalldatetime default getdate();