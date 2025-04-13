USE [Spring2024]
GO
/****** Object:  StoredProcedure [dbo].[spInsertEmployee]    Script Date: 2/3/2024 5:05:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE dbo.spInsertDelete
@ID INT, @FirstName varchar(100), @ProductID INT, @ProductName varchar(100)
AS
BEGIN
 Insert Into Employee (Id, FirstName) 
  values (@ID, @FirstName);

 Delete From Product (ProductID, ProductName)
 where @ProductID, @ProductName = 
END