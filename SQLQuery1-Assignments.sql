Create a customer table which comprises of these columns – ‘customer_id’, ‘first_name’, ‘last_name’, ‘email’, ‘address’, ‘city’,’state’,’zip’

create table customer(customer_id int, 
                      first_name varchar(20),
					  last_name varchar(20), 
					  email varchar(30), 
					  address varchar(20), 
					  city varchar(20),
					  state varchar(20),
					  zip int)

 -- 2.Insert 5 new records into the table

insert into customer values
(1,'grace','grace','grace@gmail.com','42th street','San Jose','California',376990),
(2,'grace','grace','grace12@gmail.com','Park Avenue','NY City','New York',374679),
(3,'joel','jeol','joel@gmail.com','MG Road','Bangalore','Karnataka',3789121),
(4,'Shyam','kumar','shyam@gmail.com','Nehru road','Delhi','Delhi',734699),
(5,'Jack','Jack','jacl@gmail.com','24th aveneue','San Jose','California',213463)

select * from customer


--3. Select only the ‘first_name’ & ‘last_name’ columns from the customer table

select first_name,last_name from customer

--4.Select those records where ‘first_name’ starts with “G” and city is ‘San Jose’
select * from customer
where first_name like 'G%' and city = 'San Jose'

--first_name ends will 'l'
select * from customer
where first_name like '%l'

--first_name contains 'o'
select * from customer
where first_name like '%o%'

--first_name starts with J and has total 4 character
select * from customer
where first_name like 'J___'

select * from customer
where first_name like 'G%' or city = 'San Jose'


------Module 3------

--1.Create an ‘Orders’ table which comprises of these columns – ‘order_id’, ‘order_date’, ‘amount’, ‘customer_id’
create table orders(order_id int, 
                    order_date date, 
					amount int, 
					customer_id int)

insert into orders values
(10,'2023-05-10',6000,1),
(20,'2010-07-19',7000,2),
(30,'2001-10-10',2000,3),
(40,'2005-06-08',4000,8),
(50,'2011-04-03',5000,9)

select * from orders

--join a table through a column which is common in both the table

-- doesn't mean the column name should be same 

-- type of column should be same

-- we use those columns in on clause

--i. inner -> common values between both the table
            (1 1, 2 2, 3 3)

--ii. full -> all the values from both the table, except duplicate values
             (1 1, 2 2, 3 3, 4 null, 5 null, null 8, null 9)

---iii. left -> all the values from left table and common values from right table
             (1 1, 2 2, 3 3, 4 null, 5 null)

----iv. right -> all the values from right table and common values from left table 
             (1 1, 2 2, 3 3, null 8, null 9)

--2.Make an inner join on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column 
select c.customer_id, c.first_name, o.customer_id,o.order_id from customer c
inner join orders o
on c.customer_id = o.customer_id

--full
select c.customer_id, c.first_name, o.customer_id,o.order_id from customer c
full join orders o
on c.customer_id = o.customer_id

--3.Make left and right joins on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column
select c.customer_id, c.first_name, o.customer_id,o.order_id from customer c
left join orders o
on c.customer_id = o.customer_id

select c.customer_id, c.first_name, o.customer_id,o.order_id from customer c
right join orders o
on c.customer_id = o.customer_id


--4.Update the ‘Orders’ table, set the amount to be 100 where ‘customer_id’ is 3
update orders
set amount = 100
where customer_id = 3
select * from orders

-----------------------------------------Module 4---------------------------------------

--1.Use the inbuilt functions and find the minimum, maximum and average amount from the orders table
select min(amount) as min_amount,
       max(amount) as 'max amount',
	   avg(amount) as [avg amount]
from orders


--2.Create a user-defined function, which will multiply the given number with 10
create function multiply(@var int)
returns int
as
begin
declare @result int
set @result = @var * 10
return @result
end

select dbo.multiply(10) as Result

select *,dbo.multiply(amount) as Total_amount from orders

--create a function which will take two input from user and will do the multiplication in a orders table.
create function multiply2(@var1 int, @var2 int)
returns int
as
begin
declare @result int
set @result = @var1 * @var2
return @result
end

select *,dbo.multiply2(amount,order_id) as Total_amount from orders


--create function to show the orders details according to the order_id as an input
create function ord_details(@id int)
returns table
as
return
(select * from orders where order_id = @id)

select * from ord_details(30)
select * from ord_details(100)


--3.Use the case statement to check if 100 is less than 200, greater than 200 or equal to 2oo and print the corresponding value
select case
when 100<200 then 'smaller'
when 100>200 then 'greater'
else 'equal'
end
as Result

-- create a case statement to show the grade according to the amount column in order table.
select *,case
when amount between 1000 and 2000 then 'C'
when amount between 2001 and 4000 then 'B'
when amount between 4001 and 6000 then 'A'
when amount >= 6001 then 'O'
else 'NA'
end
as Grade
from orders

---------------------------------------------Module 5------------------------------------------

--1. Arrange the ‘Orders’ dataset in decreasing order of amount
select * from orders order by amount desc

--2.Create a table with name ‘Employee_details1’ and comprising of these columns – ‘Emp_id’, ‘Emp_name’, ‘Emp_salary’. 
--Create another table with name ‘Employee_details2’, which comprises of same columns as first table.

create table employee_details1(Emp_id int, Emp_name varchar(10), Emp_salary int)

insert into employee_details1 values
(1,'A',2000),
(2,'B',4000),
(3,'C',1000)

create table employee_details2(Emp_id int, Emp_name varchar(10), Emp_salary int)

insert into employee_details2 values
(1,'A',2000),
(2,'B',4000),
(4,'D',1000)

select * from employee_details1
select * from employee_details2

/*

i. set operators -> use to join two select statements
ii. Number of columns in both the select stmnt should be same
iii. Types of column should be same in both the select stmnt
iv. the order of columns should be same in both the select stmnt.

id     name
1        A

name     id
  A       1


i. union -> it will join the two columns and it will give only unique values(all the values except duplicate)
ii. union all -> all the values including duplicate values
iii. intersect -> common values from both the columns
iv. except -> values present in the 1st select stmnt but not in the 2nd select stmnt

syntax
select column names from table1
union
select column names from table2

*/


--3.Apply the union operator on these two tables
select * from employee_details1
union
select * from employee_details2

--union all
select * from employee_details1
union all
select * from employee_details2

--4.Apply the intersect operator on these two tables
select * from employee_details1
intersect
select * from employee_details2

--5.Apply the except operator on these two tables
select * from employee_details1
except
select * from employee_details2
