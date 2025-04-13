-- =============================================
-- Author:        Robert Lovelace
-- Semester:      Spring 2024
-- Description:   Creates a basic Employees database and table,
--                then retrieves all records from the table.
-- =============================================

-- Create the database
CREATE DATABASE db1003;
GO

-- Use the newly created database
USE db1003;
GO

-- =============================================
-- Table: Employees
-- Author:        Robert Lovelace
-- Semester:      Spring 2024
-- Description:   Stores basic employee information including first name, last name, and ID.
-- =============================================
CREATE TABLE Employees (
    FirstName VARCHAR(10),
    LastName VARCHAR(10),
    ID VARCHAR(10)
);
GO

-- =============================================
-- Query: Select all records from the Employees table
-- Author:        Robert Lovelace
-- Semester:      Spring 2024
-- =============================================
SELECT * FROM Employees;
GO
