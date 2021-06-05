

create database MyWebDB;
go

use MyWebDB;

create table Users
(UserID			int			not null primary key,
EmailAddress		varchar(50)		null,
FirstName		varchar(50)		null,
LastName		varchar(50)		null);

create table Products
(ProductID		int			not null primary key,
ProductName		varchar(50)		null);

create table Downloads
(DownloadID		int			not null primary key,
UserID			int			not null references Users (UserID),
DownloadDate		smalldatetime		null,
FileName		varchar(50)		null,
ProductID		int			not null references Products (ProductID));

create index IX_Downloads_UserID
on Downloads (UserID);
create index IX_Downloads_ProductID
on Downloads (ProductID);