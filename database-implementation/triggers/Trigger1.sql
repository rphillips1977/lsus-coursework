USE Inclass
GO

CREATE OR ALTER TRIGGER trig6 ON dbo.Employee
FOR DELETE 
AS
BEGIN
PRINT 'Employee_Audit'
INSERT INTO dbo.Employee_Audit SELECT * FROM Employee_Audit;
END

GO

INSERT INTO Employee values('Robert', 'Phillips', '318506123', 123456);
INSERT INTO Employee values('Zach', 'Beaird', '318506124', 123457);
INSERT INTO Employee values('Hiro', 'Beaird', '318506125', 123458);

GO

INSERT INTO Employee values('How', 'Are', '123456789', 123);


go

DELETE FROM Employee WHERE L_name = 'Are';


Select * From Employee_Audit;

select * from Employee;

Delete FROM Employee where F_Name = 'How';


