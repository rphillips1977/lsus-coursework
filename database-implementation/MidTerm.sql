-- =============================================
-- Author:        Robert Lovelace
-- Semester:      Spring 2024
-- Description:   Creates the Fines database with tables, stored procedures,
--                and triggers to manage traffic fines based on speed slabs.
-- =============================================

-- Create the Fines database
CREATE DATABASE Fines;
GO

-- Use the Fines database
USE Fines;
GO

-- =============================================
-- Table: Fine_Slab
-- Author:        Robert Lovelace
-- Semester:      Spring 2024
-- Description:   Stores fine rates for different speed ranges.
-- =============================================
CREATE TABLE Fine_Slab (
    Minimum_of_slab INT PRIMARY KEY NOT NULL,
    Max_of_slab INT,
    Fine_rate INT
);
GO

-- =============================================
-- Table: Fines
-- Author:        Robert Lovelace
-- Semester:      Spring 2024
-- Description:   Stores traffic violation data and computed fines.
-- =============================================
CREATE TABLE Fines (
    Vehicle_ID VARCHAR(10) PRIMARY KEY NOT NULL,
    Time_stamp VARCHAR(50),
    Camera_ID VARCHAR(5),
    Speed INT,
    Fine DECIMAL(10,2)
);
GO

-- =============================================
-- Table: Fines_Log
-- Author:        Robert Lovelace
-- Semester:      Spring 2024
-- Description:   Logs deleted Fines records for auditing.
-- =============================================
CREATE TABLE Fines_Log (
    Log_ID INT IDENTITY PRIMARY KEY,
    Time_stamp VARCHAR(50),
    Descript VARCHAR(255)
);
GO

-- =============================================
-- Procedure: sp_fine
-- Author:        Robert Lovelace
-- Semester:      Spring 2024
-- Description:   Calculates and updates the fine for a vehicle
--                based on its speed and applicable fine slab.
-- =============================================
CREATE OR ALTER PROCEDURE sp_fine
    @Vehicle_ID VARCHAR(10),
    @Speed INT
AS
BEGIN
    DECLARE @Fine_rate INT;
    DECLARE @Fine DECIMAL(10,2);

    SELECT @Fine_rate = Fine_rate 
    FROM Fine_Slab 
    WHERE @Speed BETWEEN Minimum_of_slab AND Max_of_slab;

    IF @Fine_rate IS NOT NULL
    BEGIN
        SET @Fine = @Speed * @Fine_rate;

        UPDATE Fines
        SET Fine = @Fine
        WHERE Vehicle_ID = @Vehicle_ID;
    END
END;
GO

-- =============================================
-- Trigger: trg_UpdateFine
-- Author:        Robert Lovelace
-- Semester:      Spring 2024
-- Description:   Automatically calculates the fine when a record
--                is inserted into the Fines table.
-- =============================================
CREATE TRIGGER trg_UpdateFine
ON Fines
AFTER INSERT
AS
BEGIN
    DECLARE @Vehicle_ID VARCHAR(10);
    DECLARE @Speed INT;

    SELECT @Vehicle_ID = Vehicle_ID, @Speed = Speed
    FROM inserted;

    EXEC sp_fine @Vehicle_ID, @Speed;
END;
GO

-- =============================================
-- Trigger: trg_AfterDeleteFines
-- Author:        Robert Lovelace
-- Semester:      Spring 2024
-- Description:   Logs information when a record is deleted from the Fines table.
-- =============================================
CREATE TRIGGER trg_AfterDeleteFines
ON Fines
AFTER DELETE
AS
BEGIN
    INSERT INTO Fines_Log (Time_stamp, Descript)
    SELECT
        CONVERT(VARCHAR(50), GETDATE(), 120),
        'Deleted record for Vehicle_ID: ' + d.Vehicle_ID + 
        ', with Speed: ' + CAST(d.Speed AS VARCHAR) + 
        ', and Fine: ' + CAST(d.Fine AS VARCHAR)
    FROM deleted d;
END;
GO

-- =============================================
-- Sample Data: Fine_Slab entries
-- Author:        Robert Lovelace
-- Semester:      Spring 2024
-- =============================================
SET NOCOUNT ON;
INSERT INTO Fine_Slab VALUES (35, 44, 5);
GO
INSERT INTO Fine_Slab VALUES (45, 54, 6);
GO
INSERT INTO Fine_Slab VALUES (55, 65, 8);
GO
INSERT INTO Fine_Slab VALUES (66, 200, 12); -- Avoids overlap at 65
GO

-- =============================================
-- Sample Data: Fines entries
-- Author:        Robert Lovelace
-- Semester:      Spring 2024
-- Description:   Inserting violation records. Fines will be calculated via trigger.
-- =============================================
INSERT INTO Fines VALUES ('ABC1234', '06282023031012', 'CAM12', 43, NULL);
GO
INSERT INTO Fines VALUES ('ABC1235', '06282023031013', 'CAM12', 46, NULL);
GO
INSERT INTO Fines VALUES ('ABC1236', '06282023031014', 'CAM12', 49, NULL);
GO
INSERT INTO Fines VALUES ('PQT9998', '06282023031059', 'CAM13', 56, NULL);
GO
INSERT INTO Fines VALUES ('PQT9999', '06282023111054', 'CAM13', 70, NULL);
GO

-- =============================================
-- Delete Operation
-- Author:        Robert Lovelace
-- Semester:      Spring 2024
-- Description:   Deletes one record to test deletion logging trigger.
-- =============================================
DELETE FROM Fines
WHERE Time_stamp = '06282023031012';
GO

-- =============================================
-- Output Queries
-- Author:        Robert Lovelace
-- Semester:      Spring 2024
-- =============================================
SELECT * FROM Fine_Slab;
GO

SELECT * FROM Fines;
GO

SELECT * FROM Fines_Log;
GO
