/*Write a SELECT statement that returns the same result set as this SELECT statement. Substitute a subquery in a WHERE clause for the inner join.
SELECT DISTINCT VendorName
FROM Vendors JOIN Invoices
          ON Vendors.VendorID = Invoices.VendorID
ORDER BY VendorName;
*/

select VendorName from Vendors where VendorID in (select VendorID from Invoices) 
order by VendorName



/*Write a SELECT statement that answers this question: Which invoices have a PaymentTotal that's greater than the average PaymentTotal for all paid invoices? Return the InvoiceNumber and InvoiceTotal for each invoice.
*/

select InvoiceNumber, InvoiceTotal from Invoices 
where PaymentTotal > (select AVG(PaymentTotal) from Invoices where PaymentTotal <> 0)


/*Write a SELECT statement that answers this question: Which invoices have a PaymentTotal that's greater than the median PaymentTotal for all paid invoices? (The median marks the midpoint in a set of values; an equal number of values lie above and below it.) Return the InvoiceNumber and InvoiceTotal for each invoice. Hint: Begin with the solution to exercise 2, then use the ALL keyword in the WHERE clause and code "TOP 50 PERCENT PaymentTotal" in the subquery.
*/

Select InvoiceNumber, Invoice Total from Invoices 
Where PaymentTotal > ALL ( select top 50 PERCENT PaymentTotal from Invoices where PaymentTotal <> 0 order by PaymentTotal



/*Write a SELECT statement that returns two columns from the GLAccounts table: AccountNo and Account Description. The result set should have one row for each account number that has never been used. Use a correlated subquery introduced with the NOT EXISTS operator. Sort the final result set by AccountNo.
*/
Select AccountNo , AccountDescription from GLAccounts where not exists (select * from InvoiceLineItems where InvoiceLineItems.AccountNo = GLAccounts.AccountNo) order by AccountNo




/*Write a SELECT statement that returns four columns: VendorName, InvoiceID, InvoiceSequence, and InvoiceLineItemAmount for each invoice that has more than one line item in the InvoiceLineItems table. Hint: Use a subquery that tests for InvoiceSequence > 1.
*/
Select VendorName , InvoiceID , InvoiceSequence, InvoiceLineAmount from Vendors join Invoices on Vendors.VendorID = Invoices.VendorID 
Join InvoiceLineItems on Invoices.InvoiceId = InvoiceLineItems.InvoiceID WHERE ( Select InvoiceID from InvoiceLineItems where InvoiceSequence >1 )



/*Write a SELECT statement that returns a single value that represents the sum of the largest unpaid invoices submitted by each vendor. Use a derived table that returns MAX(InvoiceTotal) grouped by VendorID, filtering for invoices with a balance due.
*/
Select SUM(InvoiceMax) as SumOfMax 
From (select VendorID , MAX(InvoiceTotal) as InvoiceMax from Invoices where InvoiceTotal - CreditTotal - PaymentTotal > 0 group by VendorID) as MaxInvoice



/*Write a SELECT statement that returns the name, city, and state of each vendor that's located in a unique city and state. In other words, don't include vendors that have a city and state in common with another vendor.
*/

Select VendorName, VendorCity, VendorState from Vendors where VendorState + VendorCity not in (Select VendorState + VendorCity from Vendors group by VendorState + VendorCity having Count(*) > 1) 




/*Write a SELECT statement that returns four columns: VendorName, InvoiceNumber, InvoiceDate, and InvoiceTotal. Return one row per vendor, representing the vendor's invoice with the earliest date.
*/
Select VendorName , InvoiceNumber,  InvoiceDate , InvoiceTotal From Invoices as Main join Vendors on Main.VendorID = Vendors.VendorID where InvoiceDate = ( Select Min(InvoiceDate) from Invoices as Secondary where Secondary.VendorId = Main.VendorID )


/*Rewrite exercise 6 so it uses a common table expression (CTE) instead of a derived table.
*/

With MaxInvoice as (Select VendorId , MAX(InvoiceTotal) as InvoiceMax from Invoices where InvoiceTotal - CreditTotal - PaymentTotal>0 group by VendorID) select SUM(InvoiceMax) as SumOfMaximums from MaxInvoice ;