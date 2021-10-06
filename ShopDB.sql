
create database ShopDB


use ShopDB


CREATE TABLE Products
(
Id int primary key IDENTITY (1,1) NOT NULL,
[Name of Products]  nvarchar(100) NOT NULL,

Constraint CK_Name_of_Products Check([Name of Products] <>' ')
)


Insert into ShopDB.dbo.Products(ShopDB.dbo.Products.[Name of Products])
values
(N'DROBIMEX 250GR turkey'),
(N'ICELAND ESKIMO PLOMBİR 15% 80QR'),
(N'ANKARA 500GR MAKARON FIYONK'),
(N'3 JELANIYA 450GR KETCUP KABABLIG'),
(N'Bizim Tarla 500GR TOMAT PASTASI S/Q'),
(N'BONDUELLE 212ML KRASNAYA FASOL'),
(N'AZOVSKAYA 250GR XALVA PODSOLN.S ARAXISOM'),
(N'MPRO Sevimli Dad 1KG Kərə yağı'),
(N'Azərçay 100QR'),
(N'Karmen Un 1000QR')


CREATE TABLE Customers
(
Id int primary key IDENTITY (1,1) NOT NULL,
[Name of Customers]  nvarchar(100) NOT NULL,

Constraint CK_Name_of_Customers Check([Name of Customers] <>' ')
)


Insert into ShopDB.dbo.Customers(ShopDB.dbo.Customers.[Name of Customers])
values
(N'Customers_1'),
(N'Customers_2'),
(N'Customers_3'),
(N'Customers_4'),
(N'Customers_5'),
(N'Customers_6'),
(N'Customers_7'),
(N'Customers_8'),
(N'Customers_9'),
(N'Customers_10')


CREATE TABLE DetailsofOrder
(
Id int primary key IDENTITY (1,1) NOT NULL,
[isCash] bit NOT NULL,
DateOrder datetime NOT NULL
)


Insert into ShopDB.dbo.DetailsofOrder(ShopDB.dbo.DetailsofOrder.isCash, ShopDB.dbo.DetailsofOrder.DateOrder)
values
(1,'2020-12-12'),
(0,'2021-12-12'),
(1,'2020-02-10'),
(0,'2021-01-11'),
(1,'2020-10-01'),
(0,'2021-11-02'),
(1,'2020-05-10'),
(1,'2021-12-18'),
(0,'2020-12-09'),
(0,'2021-08-22')


CREATE TABLE Orders
(
Id int primary key IDENTITY (1,1) NOT NULL,

[CustomersId for Orders] int  NOT NULL,
[ProductsId for Orders] int  NOT NULL,
[DetailsofOrder for Orders] int  NOT NULL,

Constraint FK_CustomersIdforOrders Foreign key ([CustomersId for Orders]) References Customers(Id) On Delete CASCADE On Update CASCADE,
Constraint FK_ProductsIdforOrders Foreign key ([ProductsId for Orders]) References Products(Id) On Delete CASCADE On Update CASCADE,
Constraint FK_DetailsofOrders Foreign key ([DetailsofOrder for Orders]) References DetailsofOrder(Id) On Delete CASCADE On Update CASCADE,
)


Insert into ShopDB.dbo.Orders(ShopDB.dbo.Orders.[CustomersId for Orders], ShopDB.dbo.Orders.[ProductsId for Orders], ShopDB.dbo.Orders.[DetailsofOrder for Orders])
values
(1,1,1),
(1,2,3),
(2,3,2),
(2,4,4),
(3,5,5),
(3,6,7),
(4,7,6),
(4,8,8),
(5,9,1),
(5,10,3),
(6,1,4),
(6,2,3),
(7,3,2),
(7,4,1),
(8,6,1),
(8,5,4),
(9,6,10),
(10,5,5)







