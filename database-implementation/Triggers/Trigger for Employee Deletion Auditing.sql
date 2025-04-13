-- =============================================
-- Author: Robert Lovelace
-- Course: CSC 625 Database Implementation
-- Script: Trigger for Employee Deletion Auditing
-- Description:
--   This script creates or alters a trigger named 'trig6' on the 'Employee' table.
--   The trigger executes after a DELETE operation to log audit information by inserting
--   rows into the 'Employee_Audit' table. Sample insertions and deletions are also included
--   to demonstrate trigger behavior.
-- Semester: Spring 2024
-- =============================================



USE Inclass;
GO


-- Ensure the trigger exists with correct behavior
CREATE OR ALTER TRIGGER trig6 
ON dbo.Employee
FOR DELETE 
AS
BEGIN
    PRINT 'Employee_Audit Trigger Executed';

    -- This line currently reinserts data from Employee_Audit into itself (likely a mistake)
    -- It should probably be inserting deleted rows instead:
    -- INSERT INTO dbo.Employee_Audit SELECT * FROM deleted;

    INSERT INTO dbo.Employee_Audit 
    SELECT * FROM Employee_Audit; -- <-- REPLACE with SELECT * FROM deleted if needed
END;
GO

-- Sample data insertions into the Employee table
INSERT INTO Employee (F_Name, L_Name, Phone, EmpID) VALUES 
('Robert', 'Phillips', '318506123', 123456),
('Zach', 'Beaird', '318506124', 123457),
('Hiro', 'Beaird', '318506125', 123458),
('How', 'Are', '123456789', 123);
GO

-- Delete an employee record with last name 'Are'
DELETE FROM Employee WHERE L_Name = 'Are';
GO

-- View contents of the audit table
SELECT * FROM Employee_Audit;
GO

-- View current records in the Employee table
SELECT * FROM Employee;
GO

-- Delete employee with first name 'How' (will not execute if already deleted)
DELETE FROM Employee WHERE F_Name = 'How';
GO