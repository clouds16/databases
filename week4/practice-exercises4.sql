/*Write a SELECT statement that returns four columns based on the InvoiceTotal column of the Invoices table:
Use the CAST function to return the first column as data type decimal with 2 digits to the right of the decimal point.
Use CAST to return the second column as a varchar.
Use the CONVERT function to return the third column as the same data type as the first column.
Use CONVERT to return the fourth column as a varchar, using style 1.*/

Select CAST(InvoiceTotal as decimal(17,2)) as CastAsDecimal, 
CAST(InvoiceTotal as varchar) as CastAsVarchar, 
CONVERT(decimal(17,2), InvoiceTotal ) as ConvertToDecimal, 
CONVERT(varchar , InvoiceTotal, 1) as ConvertToVarchar from Invoices



/*
Write a SELECT statement that returns four columns based on the InvoiceDate column of the Invoices table:
Use the CAST function to return the first column as data type varchar.
Use the CONVERT function to return the second and third columns as a varchar, using style 1 and style 10, respectively.
Use the CAST function to return the fourth column as data type real
*/

Select CAST(InvoiceDate as varchar) as CastAsVarchar, 
Convert(varchar, InvoiceDate,1 ) as ConvertToStyle1,
Convert(varchar, InvoiceDate, 10 ) as Style10,
CAST(InvoiceDAte as real) as Real
From Invoices