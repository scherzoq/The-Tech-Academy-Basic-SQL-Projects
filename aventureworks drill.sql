/* Stored procedure drill, step 77 */
USE AdventureWorks2014
GO
CREATE PROCEDURE Sales.uspGetSalesYTD @CustomerID int = NULL, @StoreName nvarchar(50) = NULL
AS
SELECT b.CustomerID, b.StoreID, a.Name, a.SalesPersonID, c.SalesYTD
FROM Sales.Store a
INNER JOIN Sales.Customer b ON b.StoreID = a.BusinessEntityID
INNER JOIN Sales.SalesPerson c ON c.BusinessEntityID = a.SalesPersonID
WHERE b.CustomerID = ISNULL(@CustomerID,CustomerID)
OR a.Name LIKE '%' + ISNULL(@StoreName,Name) + '%'
GO
