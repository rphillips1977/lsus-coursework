USE [Spring2024]
GO
/****** Object:  StoredProcedure [dbo].[spInsertEmployee]    Script Date: 2/3/2024 5:03:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE spInsertProduct
@ProductID INT, @ProductName varchar(255) output --output parameter being passed in
AS
BEGIN
 Insert Into Product (ProductID, ProductName) 
  values (@ProductID, @ProductName);
END
