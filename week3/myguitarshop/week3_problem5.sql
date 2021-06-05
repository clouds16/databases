use MyWebDB;
alter table Users
alter column FirstName varchar(20) not null;

use MyWebDB;
update Users
set FirstName = null
where UserID = 1;

use MyWebDB;
update Users
set FirstName = 'thisissomstringthatislongerthan20characters'
where UserID = 1;