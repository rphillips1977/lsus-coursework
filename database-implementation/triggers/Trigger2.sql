-- =============================================
-- Author: Robert Lovelace
-- Course: CSC 625 Database Implementation
-- Script: Trigger and Procedure Demonstration for INSERT/DELETE Auditing
-- Description:
--     - Creates two triggers on the Employee table: one for INSERT and one for DELETE
--     - Outputs affected rows for visibility
--     - Creates an audit table and a stored procedure to insert into it
--     - Demonstrates usage with INSERT, DELETE, and EXECUTE commands
-- Semester: Spring 2024
-- =============================================

USE Inclass;
GO

-- Trigger that fires on INSERT to the Employee table
CREATE TRIGGER trig2 ON Employee
FOR INSERT
AS 
BEGIN
    PRINT 'Inserted Trigger 2';
    -- Display inserted rows
    SELECT * FROM Inserted;
END;
GO

-- Trigger that fires on DELETE from the Employee table
CREATE TRIGGER trigDelete ON Employee
FOR DELETE
AS
BEGIN
    PRINT 'Deleted Trigger 1';
    -- Display deleted rows
    SELECT * FROM Deleted;
END;
GO

-- Delete sample rows
DELETE FROM Employee WHERE F_Name = 'Paul';
GO

DELETE FROM Employee WHERE F_Name = 'Robert';
GO

-- Display current Employee table
SELECT * FROM Employee;
GO

-- Insert a new employee
INSERT INTO Employee
VALUES ('Robert', 'Lovelace', '3184018025', 123456);
GO

-- Display updated Employee table
SELECT * FROM Employee;
GO

-- Create audit table for deleted employee records
CREATE TABLE Employee_Audit
(
    F_Name VARCHAR(50),
    L_Name VARCHAR(50),
    Phone_Number VARCHAR(10),
    Employee_ID INT
);
GO

-- Create stored procedure for logging deleted employee records
CREATE PROCEDURE spDeleted
    @F_Name VARCHAR(50), 
    @L_Name VARCHAR(50), 
    @Phone_Number VARCHAR(10), 
    @Employee_ID INT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Employee_Audit(F_Name, L_Name, Phone_Number, Employee_ID)
    VALUES (@F_Name, @L_Name, @Phone_Number, @Employee_ID);
END;
GO

-- Execute the stored procedure manually with sample data
EXECUTE spDeleted 'Thanks', 'Hello', '315564987', 123456;
GO

-- View audit records
SELECT * FROM Employee_Audit;
GO
