----1) Get all the details from the person table including email ID, phone number, and phone number type

select p.FirstName,p.LastName,E.EmailAddress,e.EmailAddressID,pp.PhoneNumber,ph.Name from Person.Person P
inner join Person.EmailAddress E on P.BusinessEntityID=e.BusinessEntityID
inner join person.PersonPhone PP on e.BusinessEntityID=pp.BusinessEntityID
inner join Person.PhoneNumberType PH on pp.PhoneNumberTypeID=ph.PhoneNumberTypeID

 -----2) Get the details of the sales header order made in May 2011 

 select * from Sales.SalesOrderHeader where year(OrderDate) =2011 and MONTH(OrderDate)=5

 -----3) Get the details of the sales details order made in the month of May 2011---JOINS are not optimized way. But whenever we need any one column from another table as output then use Join only. 

 ----If you want to print only one table and the second table is just reference then go for Sub Query always

select SD.* from Sales.SalesOrderDetail SD join Sales.SalesOrderHeader SH on SD.SalesOrderID=SH.SalesOrderID
where year(SH.OrderDate)=2011 and MONTH (SH.OrderDate)=5

-----SUB QUERY-----Where clause & IN operater

select * from sales.SalesOrderDetail where SalesOrderID in 
(select SalesOrderID from sales.SalesOrderHeader where year(OrderDate)=2011 and MONTH(OrderDate)=5)


 -----4) Get the total sales made in May 2011 

select sum(linetotal) as Total_sales from sales.SalesOrderDetail where SalesOrderID in 
(select SalesOrderID from sales.SalesOrderHeader where year(OrderDate)=2011 and MONTH(OrderDate)=5)

----5) Get the total sales made in the year 2011 by month order by increasing sales 

select sum(SD.linetotal) as Total_sales,MONTH(So.orderdate) as Month from sales.SalesOrderDetail as SD 
inner join sales.SalesOrderHeader SO on SD.SalesOrderID=so.SalesOrderID
where YEAR(so.OrderDate)=2011
Group by MONTH(so.OrderDate)
order by Total_sales

----Get the total sales made to the customer with FirstName='Gustavo' and LastName ='Achong'

