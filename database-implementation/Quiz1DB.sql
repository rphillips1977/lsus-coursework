CREATE DATABASE Quiz1db_Robert
SET NOCOUNT ON;
GO

USE Quiz1db_Robert

GO
SET NOCOUNT ON;
CREATE TABLE Stock
(
	Stock_ID VARCHAR(10) NOT NULL Primary Key,
	Stock_category VARCHAR(25),
	Stock_shelf VARCHAR(30),
	Stock_price DECIMAL(10, 2),
	Stock_quantity INT
)

GO
SET NOCOUNT ON;
CREATE TABLE Sales
(
	Transaction_ID INT NOT NULL Primary Key,
	CustomerID INT,
	Stock_ID VARCHAR(10),
	Sale_date DATETIME,
	Quantity INT
)

GO

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE PROCEDURE spInsertStock
@Stock_ID VARCHAR(25), @Stock_category VARCHAR(25), @Stock_shelf VARCHAR(25), @Stock_price DECIMAL(10, 2), @Stock_quantity INT
AS
BEGIN
SET NOCOUNT ON;
 Insert Into Stock (Stock_ID, Stock_category, Stock_shelf, Stock_price, Stock_quantity) 
values (@Stock_ID, @Stock_category, @Stock_shelf, @Stock_price, @Stock_quantity);
END

GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
SET NOCOUNT ON;
GO

CREATE PROCEDURE spInsertSales
@Transaction_ID INT, @CustomerID INT, @Stock_ID VARCHAR(10), @Sale_date DATETIME, @Quantity INT
AS
BEGIN
SET NOCOUNT ON;
 Insert Into Sales (Transaction_ID, CustomerID, Stock_ID, Sale_date, Quantity) 
 values (@Transaction_ID, @CustomerID, @Stock_ID, @Sale_date, @Quantity)
END

GO

CREATE PROCEDURE UpdateSalesQuantity
    @StockID VARCHAR(10), @Quantity INT
AS
BEGIN
SET NOCOUNT ON;
IF EXISTS (SELECT 1 FROM Sales WHERE Stock_ID = @StockID)
BEGIN
UPDATE Sales
SET Quantity = @Quantity
WHERE Stock_ID = @StockID;
PRINT 'Quantity updated successfully.';
END
ELSE
BEGIN
PRINT 'Record with Stock_ID ' + @StockID + ' does not exist in the Sales table.';
END
END
GO


EXECUTE spInsertStock '200', 'Technology', 'T54', '5.63', 1000000
SET NOCOUNT ON;
GO

EXECUTE spInsertStock '300', 'Pharmacy', 'P56', '6.36', 500000
SET NOCOUNT ON;

GO
EXECUTE spInsertStock '400', 'Pharmacy', 'P54', '7.36', 900
SET NOCOUNT ON;

GO
SET NOCOUNT ON;
EXECUTE spInsertStock '500', 'Retail', 'H56', '9.65', 100000

GO
SET NOCOUNT ON;
EXECUTE spInsertStock '600', 'Technology', 'H76', '100.65', 6000

GO
SET NOCOUNT ON;
EXECUTE spInsertStock '700', 'Retail', 'B86', '10.65', 7000

GO
SET NOCOUNT ON;
EXECUTE spInsertStock '800', 'Technology', 'H77', '105.65', 3000

GO
SET NOCOUNT ON;
EXECUTE spInsertStock '900', 'Pharmacy', 'T66', '105.65', 30000

GO
SET NOCOUNT ON;
EXECUTE spInsertStock '1000', 'Technology', 'F76', '206.65', 16000

GO
SET NOCOUNT ON;
EXECUTE spInsertStock '100', 'Retail', 'H43', '100.50', 1000

GO
SET NOCOUNT ON;
EXECUTE spInsertSales 1000, 11111, '100', '1977-09-20', 3

GO
SET NOCOUNT ON;
EXECUTE spInsertSales 2000, 22222, '100', '1990-09-24', 4

GO
SET NOCOUNT ON;
EXECUTE spInsertSales 3000, 33333, '200', '2001-10-24', 5

GO
SET NOCOUNT ON;
EXECUTE spInsertSales 4000, 44444, '300', '2024-01-24', 6

GO
SET NOCOUNT ON;
EXECUTE spInsertSales 5000, 55555, '600', '2000-06-17', 10

GO
SET NOCOUNT ON;
EXECUTE spInsertSales 6000, 66666, '800', '2021-10-24', 7

GO
SET NOCOUNT ON;
EXECUTE spInsertSales 7000, 77777, '900', '2019-06-14', 7

GO
SET NOCOUNT ON;
EXECUTE spInsertSales 8000, 88888, '1000', '2011-11-24', 15

GO
SET NOCOUNT ON;
EXECUTE spInsertSales 9000, 99999, '500', '2024-01-31', 17

GO
SET NOCOUNT ON;
EXECUTE spInsertSales 10000, 10001, '700', '2021-04-21', 10

GO
SET NOCOUNT ON;
SELECT * FROM Stock

GO
SET NOCOUNT ON;
SELECT *
FROM Sales
ORDER BY CustomerID;

GO
SET NOCOUNT ON;
SELECT
CustomerID,
SUM(Quantity * Stock_price) AS TotalSaleValue
FROM
Sales
JOIN
Stock ON Sales.Stock_ID = Stock.Stock_ID
WHERE
Sale_date = '2024-02-16'
GROUP BY
CustomerID
ORDER BY
CustomerID;

GO
SET NOCOUNT ON;
SELECT
    Sale_date,
    Stock_category,
    SUM(Quantity * Stock_price) AS SalesValue
FROM
    Sales
JOIN
    Stock ON Sales.Stock_ID = Stock.Stock_ID
GROUP BY
    Sale_date, Stock_category
ORDER BY
    Sale_date, Stock_category;
