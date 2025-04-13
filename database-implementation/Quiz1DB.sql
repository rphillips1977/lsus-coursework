-- =============================================
-- Author:        Robert Lovelace
-- Semester:      Spring 2024
-- Description:   Creates a stock and sales tracking database with related
--                tables, stored procedures, and data analysis queries.
-- =============================================

-- Create the database
CREATE DATABASE Quiz1db_Robert;
GO

-- Use the database
USE Quiz1db_Robert;
GO

-- =============================================
-- Table: Stock
-- Author:        Robert Lovelace
-- Semester:      Spring 2024
-- Description:   Stores inventory stock data including category, shelf, price, and quantity.
-- =============================================
CREATE TABLE Stock (
    Stock_ID VARCHAR(10) NOT NULL PRIMARY KEY,
    Stock_category VARCHAR(25),
    Stock_shelf VARCHAR(30),
    Stock_price DECIMAL(10, 2),
    Stock_quantity INT
);
GO

-- =============================================
-- Table: Sales
-- Author:        Robert Lovelace
-- Semester:      Spring 2024
-- Description:   Tracks customer sales including stock sold and quantity.
-- =============================================
CREATE TABLE Sales (
    Transaction_ID INT NOT NULL PRIMARY KEY,
    CustomerID INT,
    Stock_ID VARCHAR(10),
    Sale_date DATETIME,
    Quantity INT
);
GO

-- =============================================
-- Procedure: spInsertStock
-- Author:        Robert Lovelace
-- Semester:      Spring 2024
-- Description:   Inserts a new stock record into the Stock table.
-- =============================================
CREATE PROCEDURE spInsertStock
    @Stock_ID VARCHAR(25),
    @Stock_category VARCHAR(25),
    @Stock_shelf VARCHAR(25),
    @Stock_price DECIMAL(10, 2),
    @Stock_quantity INT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Stock (Stock_ID, Stock_category, Stock_shelf, Stock_price, Stock_quantity) 
    VALUES (@Stock_ID, @Stock_category, @Stock_shelf, @Stock_price, @Stock_quantity);
END;
GO

-- =============================================
-- Procedure: spInsertSales
-- Author:        Robert Lovelace
-- Semester:      Spring 2024
-- Description:   Inserts a new transaction into the Sales table.
-- =============================================
CREATE PROCEDURE spInsertSales
    @Transaction_ID INT,
    @CustomerID INT,
    @Stock_ID VARCHAR(10),
    @Sale_date DATETIME,
    @Quantity INT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Sales (Transaction_ID, CustomerID, Stock_ID, Sale_date, Quantity)
    VALUES (@Transaction_ID, @CustomerID, @Stock_ID, @Sale_date, @Quantity);
END;
GO

-- =============================================
-- Procedure: UpdateSalesQuantity
-- Author:        Robert Lovelace
-- Semester:      Spring 2024
-- Description:   Updates the quantity in the Sales table for a given Stock_ID.
--                If the Stock_ID doesn't exist, a message is printed.
-- =============================================
CREATE PROCEDURE UpdateSalesQuantity
    @StockID VARCHAR(10),
    @Quantity INT
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
END;
GO

-- =============================================
-- Sample Stock Inserts
-- =============================================
EXEC spInsertStock '200', 'Technology', 'T54', 5.63, 1000000;
EXEC spInsertStock '300', 'Pharmacy', 'P56', 6.36, 500000;
EXEC spInsertStock '400', 'Pharmacy', 'P54', 7.36, 900;
EXEC spInsertStock '500', 'Retail', 'H56', 9.65, 100000;
EXEC spInsertStock '600', 'Technology', 'H76', 100.65, 6000;
EXEC spInsertStock '700', 'Retail', 'B86', 10.65, 7000;
EXEC spInsertStock '800', 'Technology', 'H77', 105.65, 3000;
EXEC spInsertStock '900', 'Pharmacy', 'T66', 105.65, 30000;
EXEC spInsertStock '1000', 'Technology', 'F76', 206.65, 16000;
EXEC spInsertStock '100', 'Retail', 'H43', 100.50, 1000;
GO

-- =============================================
-- Sample Sales Inserts
-- =============================================
EXEC spInsertSales 1000, 11111, '100', '1977-09-20', 3;
EXEC spInsertSales 2000, 22222, '100', '1990-09-24', 4;
EXEC spInsertSales 3000, 33333, '200', '2001-10-24', 5;
EXEC spInsertSales 4000, 44444, '300', '2024-01-24', 6;
EXEC spInsertSales 5000, 55555, '600', '2000-06-17', 10;
EXEC spInsertSales 6000, 66666, '800', '2021-10-24', 7;
EXEC spInsertSales 7000, 77777, '900', '2019-06-14', 7;
EXEC spInsertSales 8000, 88888, '1000', '2011-11-24', 15;
EXEC spInsertSales 9000, 99999, '500', '2024-01-31', 17;
EXEC spInsertSales 10000, 10001, '700', '2021-04-21', 10;
GO

-- =============================================
-- Query: View all stock items
-- =============================================
SELECT * FROM Stock;
GO

-- =============================================
-- Query: View all sales sorted by customer ID
-- =============================================
SELECT * FROM Sales
ORDER BY CustomerID;
GO

-- =============================================
-- Query: Total sales value per customer on a specific date
-- Author:        Robert Lovelace
-- Semester:      Spring 2024
-- =============================================
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

-- =============================================
-- Query: Total sales value grouped by date and stock category
-- Author:        Robert Lovelace
-- Semester:      Spring 2024
-- =============================================
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
GO
