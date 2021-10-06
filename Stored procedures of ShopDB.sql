use ShopDB


-- sp_updateProduct


CREATE OR ALTER Procedure sp_updateProduct
@ProductId int,
@ProductName nvarchar(max)
AS
SET NOCOUNT ON
BEGIN
    IF(EXISTS
	(
     Select *
     from
     ShopDB.dbo.Products 
    )
    )
	BEGIN
	   UPDATE  ShopDB.dbo.Products 
       SET  ShopDB.dbo.Products.[Name of Products] = @ProductName
       where ShopDB.dbo.Products.Id=@ProductId
	END
END




EXEC sp_updateProduct 1, N'Azerçay'


select *from Products




-- sp_InsertProduct


CREATE OR ALTER Procedure sp_InsertProduct
@ProductName nvarchar(max)
AS
SET NOCOUNT ON
BEGIN
    IF(EXISTS
	(
     Select *
     from
     ShopDB.dbo.Products 
    )
    )
	BEGIN
      Insert into ShopDB.dbo.Products(ShopDB.dbo.Products.[Name of Products])
      values(@ProductName)
	END
    ELSE
	BEGIN
	  delete from ShopDB.dbo.Products;
      DBCC CHECKIDENT ('ShopDB.dbo.Products', RESEED, 0);
      Insert into ShopDB.dbo.Products(ShopDB.dbo.Products.[Name of Products])
      values(@ProductName)
	END
END




EXEC sp_InsertProduct N'Final çay'


select *from Products




-- sp_MaxIdProducts


CREATE OR ALTER Procedure sp_MaxIdProducts
@MaxId int output
AS
SET NOCOUNT ON
BEGIN
set @MaxId =(
  SELECT 
  Top(1) 
  Products.Id 
  FROM 
  Products ORDER BY Id DESC
  )
END




declare @max as int
EXEC sp_MaxIdProducts  @max output
Select @max as [Count]




-- sp_MinIdProducts


CREATE OR ALTER Procedure sp_MinIdProducts
@MinId int output
AS
SET NOCOUNT ON
BEGIN
set @MinId =(
  SELECT 
  Top(1) 
  Products.Id 
  FROM 
  Products ORDER BY Id ASC
  )
END




declare @min as int
EXEC sp_MinIdProducts  @min output
Select @min as [Count]




-- sp_deleteProduct


CREATE OR ALTER Procedure sp_deleteProduct
@ProductId int
AS
SET NOCOUNT ON
BEGIN
    IF(EXISTS
	(
     Select *
     from
     ShopDB.dbo.Products 
    )
    )
	BEGIN
	  DELETE FROM  ShopDB.dbo.Products 
	  WHERE ShopDB.dbo.Products.Id= @ProductId
	END
END




EXEC sp_deleteProduct 10


select *from Products




-- sp_updateCustomer


CREATE OR ALTER Procedure sp_updateCustomer
@CustomerId int,
@CustomerName nvarchar(max)
AS
SET NOCOUNT ON
BEGIN
    IF(EXISTS
	(
     Select *
     from
     ShopDB.dbo.Customers 
    )
    )
	BEGIN
	   UPDATE  ShopDB.dbo.Customers 
       SET  ShopDB.dbo.Customers.[Name of Customers] = @CustomerName
       where ShopDB.dbo.Customers.Id=@CustomerId
	END
END




EXEC sp_updateCustomer 1, N'Customers_5'


select *from Customers



-- sp_InsertCustomer


CREATE OR ALTER Procedure sp_InsertCustomer
@CustomerName nvarchar(max)
AS
SET NOCOUNT ON
BEGIN
    IF(EXISTS
	(
     Select *
     from
     ShopDB.dbo.Customers 
    )
    )
	BEGIN
      Insert into ShopDB.dbo.Customers(ShopDB.dbo.Customers.[Name of Customers])
      values(@CustomerName)
	END
	ELSE
	BEGIN
	  delete from ShopDB.dbo.Customers;
      DBCC CHECKIDENT ('ShopDB.dbo.Customers', RESEED, 0);
      Insert into ShopDB.dbo.Customers(ShopDB.dbo.Customers.[Name of Customers])
      values(@CustomerName)
	END
END




EXEC sp_InsertCustomer N'Customer_N'


select *from Products




-- sp_MaxIdCustomers


CREATE OR ALTER Procedure sp_MaxIdCustomer
@MaxId int output
AS
SET NOCOUNT ON
BEGIN
set @MaxId =(
  SELECT 
  Top(1) 
  Customers.Id 
  FROM 
  Customers ORDER BY Id DESC
  )
END




declare @max as int
EXEC sp_MaxIdCustomer  @max output
Select @max as [Count]




-- sp_MinIdCustomer


CREATE OR ALTER Procedure sp_MinIdCustomer
@MinId int output
AS
SET NOCOUNT ON
BEGIN
set @MinId =(
  SELECT 
  Top(1) 
  Customers.Id 
  FROM 
  Customers ORDER BY Id ASC
  )
END




declare @min as int
EXEC sp_MinIdCustomer  @min output
Select @min as [Count]




-- sp_deleteCustomer


CREATE OR ALTER Procedure sp_deleteCustomer
@CustomerId int
AS
SET NOCOUNT ON
BEGIN
    IF(EXISTS
	(
     Select *
     from
     ShopDB.dbo.Customers 
    )
    )
	BEGIN
	  DELETE FROM  ShopDB.dbo.Customers 
	  WHERE ShopDB.dbo.Customers.Id= @CustomerId
	END
END




EXEC sp_deleteCustomer 10


select *from Customers




-- sp_updateDetailsofOrder


CREATE OR ALTER Procedure sp_updateDetailsofOrder
@DateorderId int,
@iscash int,
@dateorder datetime
AS
SET NOCOUNT ON
BEGIN
    IF(EXISTS
	(
     Select *
     from
     ShopDB.dbo.DetailsofOrder 
    )
    )
	BEGIN
	   UPDATE  ShopDB.dbo.DetailsofOrder 
       SET  
	   ShopDB.dbo.DetailsofOrder.isCash = @iscash,
	   ShopDB.dbo.DetailsofOrder.DateOrder = @dateorder
       where ShopDB.dbo.DetailsofOrder.Id=@DateorderId
	END
END




EXEC sp_updateDetailsofOrder 1, 0, '2010-12-12 00:00:00.000'


select *from DetailsofOrder




-- sp_InsertDetailsofOrder


CREATE OR ALTER Procedure sp_InsertDetailsofOrder
@iscash bit,
@dateorder datetime
AS
SET NOCOUNT ON
BEGIN
    IF(EXISTS
	(
     Select *
     from
     ShopDB.dbo.DetailsofOrder 
    )
    )
	BEGIN
      Insert into ShopDB.dbo.DetailsofOrder(ShopDB.dbo.DetailsofOrder.isCash, ShopDB.dbo.DetailsofOrder.DateOrder)
      values(@iscash, @dateorder)
	END
    ELSE
	BEGIN
	  delete from ShopDB.dbo.DetailsofOrder;
      DBCC CHECKIDENT ('ShopDB.dbo.DetailsofOrder', RESEED, 0);
      Insert into ShopDB.dbo.DetailsofOrder(ShopDB.dbo.DetailsofOrder.isCash, ShopDB.dbo.DetailsofOrder.DateOrder)
      values(@iscash, @dateorder)
	END
END




EXEC sp_InsertDetailsofOrder  1, '2021-05-06'


select *from DetailsofOrder




-- sp_MaxIdDetailsofOrder


CREATE OR ALTER Procedure sp_MaxIdDetailsofOrder
@MaxId int output
AS
SET NOCOUNT ON
BEGIN
set @MaxId =(
  SELECT 
  Top(1) 
  DetailsofOrder.Id 
  FROM 
  DetailsofOrder ORDER BY Id DESC
  )
END




declare @max as int
EXEC sp_MaxIdDetailsofOrder  @max output
Select @max as [Count]




-- sp_MinIdDetailsofOrder


CREATE OR ALTER Procedure sp_MinIdDetailsofOrder
@MinId int output
AS
SET NOCOUNT ON
BEGIN
set @MinId =(
  SELECT 
  Top(1) 
  DetailsofOrder.Id 
  FROM 
  DetailsofOrder ORDER BY Id ASC
  )
END




declare @min as int
EXEC sp_MinIdDetailsofOrder  @min output
Select @min as [Count]




-- sp_deleteDetailsofOrder


CREATE OR ALTER Procedure sp_deleteDetailsofOrder
@DetailsofOrderId int
AS
SET NOCOUNT ON
BEGIN
    IF(EXISTS
	(
     Select *
     from
     ShopDB.dbo.DetailsofOrder
    )
    )
	BEGIN
	  DELETE FROM  ShopDB.dbo.DetailsofOrder 
	  WHERE ShopDB.dbo.DetailsofOrder.Id= @DetailsofOrderId
	END
END




EXEC sp_deleteDetailsofOrder 10


select *from DetailsofOrder






-- sp_updateOrder


CREATE OR ALTER Procedure sp_updateOrder
@OrderId int,
@CustumerId int,
@ProductId int,
@DetailsofOrderId int
AS
SET NOCOUNT ON
BEGIN
    IF(EXISTS
	(
     Select *
     from
     ShopDB.dbo.Orders 
	 Inner Join ShopDB.dbo.Customers
	 On
	 ShopDB.dbo.Customers.Id=ShopDB.dbo.Orders.[CustomersId for Orders]
	 Inner Join ShopDB.dbo.Products
	 On
	 ShopDB.dbo.Products.Id=ShopDB.dbo.Orders.[ProductsId for Orders]
	 Inner Join ShopDB.dbo.DetailsofOrder
	 On
	 ShopDB.dbo.DetailsofOrder.Id=ShopDB.dbo.Orders.[DetailsofOrder for Orders]
    )
    )
	BEGIN
	   UPDATE  ShopDB.dbo.Orders 
       SET  
	   ShopDB.dbo.Orders.[CustomersId for Orders] = @CustumerId,
	   ShopDB.dbo.Orders.[ProductsId for Orders] = @ProductId,
	   ShopDB.dbo.Orders.[DetailsofOrder for Orders] = @DetailsofOrderId
       where ShopDB.dbo.Orders.Id=@OrderId
	END
END




EXEC sp_updateOrder 4, 1, 4, 1


select *from Orders




-- sp_InsertOrder


CREATE OR ALTER Procedure sp_InsertOrder
@CustumerId int,
@ProductId int,
@DetailsofOrderId int
AS
SET NOCOUNT ON
BEGIN
  IF(EXISTS
	(
     Select *
     from
     ShopDB.dbo.Orders 
	 Inner Join ShopDB.dbo.Customers
	 On
	 ShopDB.dbo.Customers.Id=ShopDB.dbo.Orders.[CustomersId for Orders]
	 Inner Join ShopDB.dbo.Products
	 On
	 ShopDB.dbo.Products.Id=ShopDB.dbo.Orders.[ProductsId for Orders]
	 Inner Join ShopDB.dbo.DetailsofOrder
	 On
	 ShopDB.dbo.DetailsofOrder.Id=ShopDB.dbo.Orders.[DetailsofOrder for Orders]
    )
    )
	BEGIN
      Insert into ShopDB.dbo.Orders(ShopDB.dbo.Orders.[CustomersId for Orders], ShopDB.dbo.Orders.[ProductsId for Orders], ShopDB.dbo.Orders.[DetailsofOrder for Orders] )
      values(@CustumerId, @ProductId, @DetailsofOrderId)
	END
	ELSE
	BEGIN
	  delete from ShopDB.dbo.Orders;
      DBCC CHECKIDENT ('ShopDB.dbo.Orders', RESEED, 0);
      Insert into ShopDB.dbo.Orders(ShopDB.dbo.Orders.[CustomersId for Orders], ShopDB.dbo.Orders.[ProductsId for Orders], ShopDB.dbo.Orders.[DetailsofOrder for Orders] )
      values(@CustumerId, @ProductId, @DetailsofOrderId)
	END
END




EXEC sp_InsertOrder   1, 2,3


select *from Orders




-- sp_MaxIdOrder


CREATE OR ALTER Procedure sp_MaxIdOrder
@MaxId int output
AS
SET NOCOUNT ON
BEGIN
set @MaxId =(
  SELECT 
  Top(1) 
  Orders.Id 
  FROM 
  Orders ORDER BY Id DESC
  )
END




declare @max as int
EXEC sp_MaxIdOrder  @max output
Select @max as [Count]




-- sp_MinIdDetailsofOrder


CREATE OR ALTER Procedure sp_MinIdOrder
@MinId int output
AS
SET NOCOUNT ON
BEGIN
set @MinId =(
  SELECT 
  Top(1) 
  Orders.Id 
  FROM 
  Orders ORDER BY Id ASC
  )
END




declare @min as int
EXEC sp_MinIdOrder  @min output
Select @min as [Count]




-- sp_deleteOrder


CREATE OR ALTER Procedure sp_deleteOrder
@OrderId int
AS
SET NOCOUNT ON
BEGIN
    IF(EXISTS
	(
     Select *
     from
     ShopDB.dbo.Orders
    )
    )
	BEGIN
	  DELETE FROM  ShopDB.dbo.Orders 
	  WHERE ShopDB.dbo.Orders.Id= @OrderId
	END
END




EXEC sp_deleteOrder 2


select *from Orders