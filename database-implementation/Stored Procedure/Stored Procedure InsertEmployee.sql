-- ================================================================
-- Author: Robert Lovelace
-- Course: CSC 625 Database Implementation
-- Assignment: Stored Procedure Development – Insert and Delete
-- Procedure Name: spInsertDelete
-- Description:
--     This SQL stored procedure performs two tasks:
--     1. Inserts a new employee into the Employee table.
--     2. Deletes a product from the Product table based on matching
--        ProductID and ProductName.
-- Semester: Spring 2024
-- ================================================================

USE [Spring2024];
GO

-- Enable ANSI_NULLS and QUOTED_IDENTIFIER for best practices
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

-- Drop the procedure if it already exists
IF OBJECT_ID('dbo.spInsertDelete', 'P') IS NOT NULL
    DROP PROCEDURE dbo.spInsertDelete;
GO

-- Create the stored procedure
CREATE PROCEDURE dbo.spInsertDelete
    @ID INT,
    @FirstName VARCHAR(100),
    @ProductID INT,
    @ProductName VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert a new employee record
    INSERT INTO Employee (Id, FirstName)
    VALUES (@ID, @FirstName);

    -- Delete a product record that matches both ID and name
    DELETE FROM Product
    WHERE ProductID = @ProductID AND ProductName = @ProductName;
END;
GO

-- ================================
-- Example Execution
-- ================================
-- EXEC dbo.spInsertDelete 
--     @ID = 1, 
--     @FirstName = 'Alice', 
--     @ProductID = 101, 
--     @ProductName = 'Mouse';