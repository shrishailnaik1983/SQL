Create Database Customers 

Create Table Customers (CustomerID int,Customername Varchar(40),ContactName nVarchar(40),Address nVarchar(20),
City Varchar (20),Postalcode nvarchar(20),Country varchar(20))

Insert into Customers values (1,'Alfreds Futterkiste','Maria Anders','Obere Str. 57','Berlin',12209,'Germany')
Insert into Customers values (2,'Ana Trujillo Emparedados y helados','Ana Trujillo','Avda','M�xico D.F.',05021,'Mexico')
Insert into Customers values (3,'Antonio Moreno Taquer�a','Antonio Moreno','OMataderos 2312','M�xico D.F.',05023,'Mexico')
Insert into Customers values (4,'Around the Horn','Thomas Hardy','120 Hanover Sq.','London',1234,'UK')
Insert into Customers values (5,'Berglunds snabbk�p','Christina Berglund','Berguvsv�gen 8','Lule�',4567,'Sweden')

Create Procedure selectallCustomers
AS
Select * from Customers
Go;

EXEC selectallCustomers

---Stored Procedure With One Parameter

---Single Parameter

CREATE PROCEDURE SelectAllCustomersn @City nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City
GO

EXEC SelectAllCustomersn @city = "London";

----Stored Procedure with multiple parameters
 Create procedure Selectallcustomers2 @city nvarchar(30),@postalcode nvarchar(30)
 AS
 select * from Customers where City = @city and Postalcode=@postalcode
 Go

 EXEC Selectallcustomers2 @city="London",@postalcode=1234;
