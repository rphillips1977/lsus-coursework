USE [Spring2024];
GO

-- Ensure settings for compatibility
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

-- Drop the procedure if it already exists
IF OBJECT_ID('dbo.spInsertProduct', 'P') IS NOT NULL
    DROP PROCEDURE dbo.spInsertProduct;
GO

-- =============================================
-- Author: Robert Lovelace 
-- Procedure: spInsertProduct
-- Description:
--     Inserts a new product into the Product table.
-- Parameters:
--     @ProductID     = ID of the product to insert.
--     @ProductName   = Name of the product to insert (OUTPUT-capable).
-- Note:
--     OUTPUT parameter is declared, but not modified in this example.
-- =============================================
CREATE PROCEDURE dbo.spInsertProduct
    @ProductID INT,
    @ProductName VARCHAR(255) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert product into Product table
    INSERT INTO Product (ProductID, ProductName)
    VALUES (@ProductID, @ProductName);

    -- Optionally: Modify the output parameter (if needed)
    -- Example: SET @ProductName = UPPER(@ProductName);
END
GO
