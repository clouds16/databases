USE Myguitarshop;
GO
CREATE PROCEDURE spInsertProduct
@CategoryID int,   
@ProductCode varchar(50),
   @ProductName nvarchar(50),
   @ListPrice smallmoney,
   @DiscountPercent decimal