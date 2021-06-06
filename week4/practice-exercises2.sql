/*
Write SELECT INTO statements to create two test tables named VendorCopy and InvoiceCopy that are complete copies of the Vendors and Invoices tables. If VendorCopy and InvoiceCopy already exist, first code two DROP TABLE statements to delete them.
*/

Select * Into InvoiceCopy from Invoices 
Select * into VendorCopy from Vendors 




/*
Write an INSERT statement that adds a row to the InvoiceCopy table with the following values:
VendorID: 32
InvoiceTotal: $434.58
TermsID: 2
InvoiceNumber: AX-014-027
PaymentTotal: $0.00
InvoiceDueDate: 07/8/12
InvoiceDate: 6/21/12
CreditTotal: $0.00
PaymentDate: null

*/

Insert InvoiceCopy Values(32,'AX-014-027', 434.58, 0,0,2,'2012-07-08', NULL) 



/*Write an INSERT statement that adds a row to the VendorCopy table for each non-California vendor in the Vendors table. (This will result in duplicate vendors in the VendorCopy table.)
*/
Insert VendorCopy Select VendorName, VendorAddress1 , VendorAddress2, VendorCity, VendorState, VendorZipCode, VendorPhone, VendorContactLName, VendorContactFName, DefaultTermsID, DefaultAccountNo from Vendors where VendorState != 'CA'




/*Write an UPDATE statement that modifies the VendorCopy table. Change the default account number to 403 for each vendor that has a default account number of 400.
*/
Update VendorCopy Set DefaultAccountNo = 403 
Where DefaultAccountNo = 400




/*Write an UPDATE statement that modifies the InvoiceCopy table. Change the PaymentDate to today's date and the PaymentTotal to the balance due for each invoice with a balance due. Set today's date with a leteral date string, or use the GETDATE() function.
*/
Update InvoiceCopy set PaymentDate = GETDATE(), PaymentTotal = InvoiceTotal - CreditTotal where InvoiceTotal - CreditTotal - PaymentTotal > 0 




/*Write an UPDATE statement that modifies the InvoiceCopy table. Change TermsID to 2 for each invoice that's from a vendor with a DefaultTermsID of 2. Use a subquery.
*/
Update InvoiceCopy set TermsID = 2 Where VendorID in (Select VendorID from VendorCopy where DefaultTermsID = 2)




/*Solve exercise 6 using a join rather than a subquery.
*/
Update InvoiceCopy set TermsID =2 From InvoiceCopy Join VendorCopy on InvoiceCopy.VendorID = VendorCopy.VendorID Where DefaultTermsID = 2





/*Write a DELETE statement that deletes all vendors in the state of Minnesota from the VendorCopy table.
*/
Delete VendorCopy where VendorState = 'MN'




/*Write a DELETE statement for the VendorCopy table. Delete the vendors that are located in states frmo which no vendor has ever sent an invoice. Hint: Use a subquery coded with "SELECT DISTINCT VendorState" introduced with the NOT IN operator.
*/
Delete VendorCopy where VendorState not in ( Select DISTINCT VendorState from VendorCopy join InvoiceCopy on VendorCopy.VendorID = InvoiceCopy.VendorID)
