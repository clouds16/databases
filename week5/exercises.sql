SELECT VendorContactFName + ' ' +
         LEFT(VendorContactLName, 1) + '.' AS Contact,
       SUBSTRING(VendorPhone,7,8) AS Phone
--Also acceptable:
--     REPLACE(VendorPhone,'(559) ','') AS Phone
FROM Vendors
WHERE LEFT(VendorPhone,4) = '(559'
ORDER BY Contact;





USE AP;

SELECT InvoiceNumber,
       InvoiceTotal - CreditTotal - PaymentTotal AS Balance
FROM Invoices
WHERE InvoiceTotal - CreditTotal - PaymentTotal > 0 AND
      InvoiceDueDate < GETDATE() + 30;







SELECT InvoiceNumber,
       InvoiceTotal - CreditTotal - PaymentTotal AS Balance
FROM Invoices
WHERE InvoiceTotal - CreditTotal - PaymentTotal > 0 AND
      InvoiceDueDate <
 CAST(CAST(YEAR(GETDATE()) AS char(4)) + '-' +
      CAST(MONTH(GETDATE()) + 1 AS char(2)) + '-01' AS datetime) - 1;




USE AP;

SELECT
  CASE
    WHEN GROUPING(AccountDescription) = 1 THEN '*ALL*'
    ELSE AccountDescription
  END AS Account,
  CASE
    WHEN GROUPING(VendorState) = 1 THEN '*ALL*'
    ELSE VendorState
  END AS State,
  SUM(InvoiceLineItemAmount) AS LineItemSum
FROM GLAccounts JOIN InvoiceLineItems 
  ON GLAccounts.AccountNo = InvoiceLineItems.AccountNo
 JOIN Invoices
   ON InvoiceLineItems.InvoiceID =  Invoices.InvoiceID
 JOIN Vendors
   ON Invoices.VendorID = Vendors.VendorID
GROUP BY AccountDescription, VendorState WITH CUBE;





SELECT InvoiceNumber,
    InvoiceTotal - CreditTotal - PaymentTotal AS Balance, 
    RANK() OVER (ORDER BY InvoiceTotal - CreditTotal - 
        PaymentTotal DESC) As BalanceRank
FROM Invoices
WHERE InvoiceTotal - CreditTotal - PaymentTotal > 0 AND
    InvoiceDueDate < GETDATE() + 30;

/************************** Part 2 *************************/


CREATE VIEW InvoiceBasic
AS
SELECT VendorName, InvoiceNumber, InvoiceTotal
FROM  Vendors JOIN Invoices
  ON Vendors.VendorID = Invoices.VendorID;

SELECT *
FROM InvoiceBasic
WHERE VendorName LIKE '[N-P]%'
ORDER BY VendorName;




CREATE VIEW Top10PaidInvoices
AS
SELECT TOP 10 VendorName,
       MAX(InvoiceDate) AS LastInvoice,
       SUM(InvoiceTotal) AS SumOfInvoices
FROM  Vendors JOIN Invoices
  ON Vendors.VendorID = Invoices.VendorID
WHERE InvoiceTotal - CreditTotal - PaymentTotal = 0
GROUP BY VendorName
ORDER BY SUM(InvoiceTotal) DESC;






CREATE VIEW VendorAddress
AS
SELECT VendorID, VendorAddress1, VendorAddress2, VendorCity, VendorState, VendorZipCode
FROM Vendors;

SELECT *
FROM VendorAddress
WHERE VendorID = 4;

UPDATE VendorAddress
SET VendorAddress1 = '1990 Westwood Blvd',
    VendorAddress2 = 'Ste 260'
WHERE VendorID = 4;






SELECT *
FROM sys.foreign_keys;