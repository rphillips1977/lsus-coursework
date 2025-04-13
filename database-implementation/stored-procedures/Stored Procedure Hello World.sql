-- =============================================
-- Author:        Robert Lovelace
-- Course:        CSC 625 Database Implementation
-- Procedure:     spHello
-- Description:   Simple stored procedure that returns a "Hello, World!" message.
-- =============================================

-- If the procedure already exists, drop it
IF OBJECT_ID('spHello', 'P') IS NOT NULL
    DROP PROCEDURE spHello;
GO

-- Create the stored procedure
CREATE PROCEDURE spHello
AS
BEGIN
    -- Return a simple text message
    SELECT 'Hello, World!' AS Message;
END
GO

-- Execute the stored procedure
EXEC spHello;
GO
