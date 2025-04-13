use Inclass

go

CREATE TRIGGER trig2 ON Employee
	FOR INSERT
AS 
Begin
PRINT 'Inserted Trigger 2' 

Select * from Inserted;
END

go

CREATE TRIGGER trigDelete ON Employee
	FOR DELETE
AS
Begin
PRINT 'Deleted Trigger 1'

Select * from Deleted;
END

Go

DELETE FROM Employee WHERE F_Name='Paul';
Go

DELETE FROM Employee Where F_Name='Robert';
GO

Select * FROM Employee;
GO

INSERT INTO Employee
VALUES ('Robert', 'Lovelace', '3184018025', 123456);
GO

Select * From Employee;
Go

CREATE TABLE Employee_Audit
(
F_Name VARCHAR(50),
L_Name VARCHAR(50),
Phone_Number VARCHAR(10),
Employee_ID INT
);

CREATE PROCEDURE spDeleted
@F_Name VARCHAR(50), @L_Name VARCHAR(50), @Phone_Number VARCHAR(10), @Employee_ID INT
AS
BEGIN
SET NOCOUNT ON
INSERT INTO Employee_Audit(F_Name, L_Name, Phone_Number, Employee_ID)
VALUES (@F_Name, @L_Name, @Phone_Number, @Employee_ID);
END


EXECUTE spDeleted 'Thanks', 'Hello', '315564987', 123456;




Select * From Employee_Audit;
