-- ================================================================
-- Author: Robert Lovelace
-- Course: CSC 625 Database Implementation
-- Assignment: Stored Procedure Development – Insert Product
-- Procedure Name: spInsertProduct
-- Description:
--     This stored procedure inserts a new product into the Product table.
--     An OUTPUT parameter is included for potential use after insertion,
--     such as transformation, logging, or confirmation display.
-- Parameters:
--     @ProductID     INT     - The ID of the product to insert.
--     @ProductName   VARCHAR(255) OUTPUT - The name of the product.
-- Note:
--     The @ProductName OUTPUT parameter is declared for future extensibility,
--     but it is not currently being modified.
-- Semester: Spring 2024
-- ================================================================

USE [Spring2024];
GO

-- Enable best practice settings
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

-- Drop existing procedure if it exists
IF OBJECT_ID('dbo.spInsertProduct', 'P') IS NOT NULL
    DROP PROCEDURE dbo.spInsertProduct;
GO

-- Create the stored procedure
CREATE PROCEDURE dbo.spInsertProduct
    @ProductID INT,
    @ProductName VARCHAR(255) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert the product record
    INSERT INTO Product (ProductID, ProductName)
    VALUES (@ProductID, @ProductName);

    -- Optional: Modify the OUTPUT parameter (e.g., format or validation)
    -- SET @ProductName = UPPER(@ProductName); -- Example transformation
END;
GO

-- ================================
-- Example Execution (if needed):
-- ================================
-- DECLARE @Name VARCHAR(255) = 'Wireless Mouse';
-- EXEC dbo.spInsertProduct @ProductID = 501, @ProductName = @Name OUTPUT;
-- SELECT @Name AS ReturnedProductName;
