USE [Spring2024];
GO

-- Enable ANSI_NULLS and QUOTED_IDENTIFIER for compatibility
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

-- Drop the procedure if it already exists
IF OBJECT_ID('dbo.spInsertDelete', 'P') IS NOT NULL
    DROP PROCEDURE dbo.spInsertDelete;
GO

-- =============================================
-- Author: Robert Lovelace 
-- Procedure: spInsertDelete
-- Description: 
--   Inserts a new employee into the Employee table 
--   and deletes a product from the Product table based on ID and name.
-- Parameters:
--   @ID          = Employee ID
--   @FirstName   = Employee first name
--   @ProductID   = Product ID to delete
--   @ProductName = Product name to delete
-- =============================================
CREATE PROCEDURE dbo.spInsertDelete
    @ID INT,
    @FirstName VARCHAR(100),
    @ProductID INT,
    @ProductName VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert employee into Employee table
    INSERT INTO Employee (Id, FirstName)
    VALUES (@ID, @FirstName);

    -- Delete product from Product table matching both ID and name
    DELETE FROM Product
    WHERE ProductID = @ProductID AND ProductName = @ProductName;
END
GO

-- Example execution
-- EXEC dbo.spInsertDelete @ID = 1, @FirstName = 'Alice', @ProductID = 101, @ProductName = 'Mouse';
