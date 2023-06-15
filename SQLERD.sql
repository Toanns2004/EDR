CREATE DATABASE ERD

USE ERD


CREATE TABLE Manufacturer
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name VARCHAR(50),
	Address TEXT
)

INSERT INTO Manufacturer(Name,Address)
VALUES('Apple','Mỹ'),
('Sam Sung','Han Quoc'),
('Oppo','Trung Quoc')

SELECT *FROM Manufacturer

CREATE TABLE Products
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name VARCHAR(225),
	TheFirm_Id INT NOT NULL REFERENCES Manufacturer(Id),
	Price MONEY,
	Quantity INT 
)

INSERT INTO Products(Name,TheFirm_Id,Price,Quantity)
VALUES('Iphone11',1,1000,100),
('SamSungGalaxy',2,1200,50),
('Oppo A9',3,600,70)

SELECT *FROM Products;

CREATE TABLE Customers
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Name VARCHAR(50),
	Email VARCHAR(50),
	CCCD VARCHAR(15),
)

INSERT INTO  Customers (Name, Email, CCCD)
VALUES ('Peter', 'peter@gmail.com', '040213343534'),
('Tuan', 'tuan@gmail.com', '040243242342'),
('Son', 'son@gmail.com', '040242346234')

SELECT *FROM Customers


CREATE TABLE Staff
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name VARCHAR(50),
	Working_Time VARCHAR(50)
)	

INSERT INTO Staff(Name,Working_Time)
VALUES('Nguyen Thi Anh','6h-14h'),
('Nguyen Thi May','14h-22h')

SELECT *FROM Staff


CREATE TABLE Orders
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Customer_Id INT NOT NULL REFERENCES Customers(Id),
	Staff_Id INT NOT NULL REFERENCES Staff(Id),
	CreateDate DATETIME,
	Total MONEY
)

INSERT INTO Orders(Customer_Id, Staff_Id, CreateDate, Total)
VALUES(1,1 ,GETDATE(), 1200),
(2,1, GETDATE(), 1200),
(3,1, GETDATE(), 1000)

SELECT *FROM Orders


CREATE TABLE OrderDetails
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	OrderId INT NOT NULL REFERENCES Orders(Id),
	ProductId INT NOT NULL REFERENCES Products(Id),
	ProductQuantity INT NOT NULL
)
INSERT INTO OrderDetails(OrderId,ProductId,ProductQuantity)
VALUES
(2,3,2),
(3,1,1),
(1,2,1)

SELECT *FROM OrderDetails


