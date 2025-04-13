--creates database fines
create database Fines

go

--uses the database fines
use Fines

go

--creates table Fine_Slab
CREATE TABLE Fine_Slab (
Minimum_of_slab INT PRIMARY KEY NOT NULL,
Max_of_slab INT,
Fine_rate INT
)

go

--creates table Fines
CREATE TABLE Fines(
Vehicle_ID VARCHAR (10) PRIMARY KEY NOT NULL,
Time_stamp VARCHAR (50),
Camera_ID VARCHAR(5),
Speed INT,
Fine DECIMAL (10,2)
)

go

--Creates table Fines_Log
CREATE TABLE Fines_Log(
Log_ID INT IDENTITY PRIMARY KEY,
Time_stamp VARCHAR (50),
Descript VARCHAR (255)
)

go

--Creates procedure that calculates the fine based on the min and max of the Fines table
CREATE OR ALTER PROCEDURE sp_fine
    @Vehicle_ID VARCHAR(10),
    @Speed INT
AS
BEGIN
    DECLARE @Fine_rate INT;
    DECLARE @Fine DECIMAL(10,2);

    -- Find the appropriate fine slab based on speed from the Fine_slab 
    SELECT @Fine_rate = Fine_rate 
    FROM Fine_Slab 
    WHERE @Speed BETWEEN Minimum_of_slab AND Max_of_slab;

    IF @Fine_rate IS NOT NULL
    BEGIN
        -- Calculate the fine
        SET @Fine = @Speed * @Fine_rate;

        -- Update the Fines table with the calculated fine
        UPDATE Fines
        SET Fine = @Fine
        WHERE Vehicle_ID = @Vehicle_ID;
    END
END;
GO


--Creates trigger to update the fine
CREATE TRIGGER trg_UpdateFine
ON Fines
AFTER INSERT
AS
BEGIN
    DECLARE @Vehicle_ID VARCHAR(10);
    DECLARE @Speed INT;

    -- Assuming only one record is inserted at a time
    SELECT @Vehicle_ID = Vehicle_ID, @Speed = Speed
    FROM inserted;

	--Calls the stored procedure sp_fine
	 EXEC sp_fine @Vehicle_ID, @Speed;
END;
GO

CREATE TRIGGER trg_AfterDeleteFines
ON Fines
AFTER DELETE
AS
BEGIN
    -- Insert log entry for each deleted record, with current timestamp and details
    INSERT INTO Fines_Log (Time_stamp, Descript)
    SELECT
        CONVERT(VARCHAR(50), GETDATE(), 120), -- Current timestamp in YYYY-MM-DD HH:MI:SS format
        'Deleted record for Vehicle_ID: ' + d.Vehicle_ID + ', with Speed: ' + CAST(d.Speed AS VARCHAR) + ', and Fine: ' + CAST(d.Fine AS VARCHAR)
    FROM deleted d;
END;
GO

GO


GO

SET NOCOUNT ON
INSERT INTO Fine_Slab
VALUES (35, 44, 5)

go

SET NOCOUNT ON
INSERT INTO Fine_Slab
VALUES (45, 54, 6)

go

SET NOCOUNT ON
INSERT INTO Fine_Slab
VALUES (55, 65, 8)

go

SET NOCOUNT ON
INSERT INTO Fine_Slab
VALUES (65, 200, 12)

go

SET NOCOUNT ON 
INSERT INTO Fines
Values ('ABC1234', '06282023031012', 'CAM12', 43, null)

go

SET NOCOUNT ON
INSERT INTO Fines
Values ('ABC1235', '06282023031013', 'CAM12', 46, null)

go

SET NOCOUNT ON
INSERT INTO Fines
Values ('ABC1236', '06282023031014', 'CAM12', 49, null)

go

SET NOCOUNT ON
INSERT INTO Fines
Values ('PQT9998', '06282023031059', 'CAM13', 56, null)

go

SET NOCOUNT ON
INSERT INTO Fines
Values ('PQT9999', '06282023111054', 'CAM13', 70, null)

go

SET NOCOUNT ON
DELETE FROM Fines
Where Time_stamp = '06282023031012';

go

SET NOCOUNT ON
SELECT * FROM Fine_Slab;

go

SET NOCOUNT ON
SELECT * FROM Fines;

go

SET NOCOUNT ON
Select * From Fines_Log;