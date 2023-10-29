-- CREATE DATABASE IF NOT EXISTS Lucky_Shrub;

-- USE Lucky_Shrub;

-------------------------------------------------------------------------------------------------------------
-- CREATE TABLE Orders (OrderID INT NOT NULL PRIMARY KEY, ClientID VARCHAR(10),  ProductID VARCHAR(10),  Quantity   INT, Cost DECIMAL(6,2));

-- INSERT INTO Orders (OrderID, ClientID, ProductID , Quantity, Cost) VALUES (1, "Cl1", "P1", 10, 500), (2, "Cl2", "P2", 5, 100), (3, "Cl3", "P3", 20, 800), (4, "Cl4", "P4", 15, 150), (5, "Cl3", "P3", 10, 450), (6, "Cl2", "P2", 5, 800), (7, "Cl1", "P4", 22, 1200), (8, "Cl3", "P1", 15, 150), (9, "Cl1", "P1", 10, 500), (10, "Cl2", "P2", 5, 100);

-- Task 1: Write a SQL statement to print all records of orders where the cost is $250 or less. 
-- The expected output result should be the same as the following screenshot (assuming that you
-- have populated the Orders table with the same data set)

-- select 
-- *
-- from 
-- 	orders
-- where
-- 	cost <= 250;

-- Task 2: Write a SQL statement to print all records of orders where the cost is between $50 and $750. 
-- The expected output result should be the same as the following screenshot (assuming that you have 
-- populated the orders table with the same data set) 

-- select
-- 	*
-- from 
-- 	orders
-- where
-- 	cost between 50 and 750;

-- Task 3: Write a SQL statement to print all records of orders that have been placed by the client with 
-- the id of Cl3 and where the cost of the order is more than $100. The expected output result should be 
-- the same as the following screenshot (assuming that you have populated the Orders table with the same data set)

-- select 
-- 	*
-- from 
-- 	orders
-- where 
-- 	clientid = 'Cl3' and cost > 100;

-- Task 4: Write a SQL statement to print all records of orders that have a product id of p1 or p2 and the order quantity 
-- is more than 2. The expected output result should be the same as the following screenshot (assuming that you have 
-- populated the Orders table with the same data set)

-- select 
-- 	*
-- from 
-- 	orders 
-- where
-- 	productid in ('P1', 'P2') and quantity > 2;

-------------------------------------------------------------------------------------------------------------

-- CREATE TABLE employees (
--   EmployeeID int NOT NULL,
--   EmployeeName varchar(150) DEFAULT NULL,
--   Department varchar(150) DEFAULT NULL,
--   ContactNo varchar(12) DEFAULT NULL,
--   Email varchar(100) DEFAULT NULL,
--   AnnualSalary int DEFAULT NULL,
--   PRIMARY KEY (EmployeeID)
-- );

-- INSERT INTO employees VALUES 
-- (1,'Seamus Hogan', 'Recruitment', '351478025', 'Seamus.h@luckyshrub.com',50000), 
-- (2,'Thomas Eriksson', 'Legal', '351475058', 'Thomas.e@ luckyshrub.com',75000), 
-- (3,'Simon Tolo', 'Marketing', '351930582','Simon.t@ luckyshrub.com',40000), 
-- (4,'Francesca Soffia', 'Finance', '351258569','Francesca.s@ luckyshrub.com',45000), 
-- (5,'Emily Sierra', 'Customer Service', '351083098','Emily.s@ luckyshrub.com',35000), 
-- (6,'Maria Carter', 'Human Resources', '351022508','Maria.c@ luckyshrub.com',55000),
-- (7,'Rick Griffin', 'Marketing', '351478458','Rick.G@luckyshrub.com',50000);

-- Task 1: Use the AND operator to find employees who earn an annual salary of $50,000 or more attached to the Marketing department.

-- select
-- 	*
-- from
-- 	employees
-- where 
-- 	annualsalary >= 50000 and department = 'Marketing'; 

-- Task 2: Use the NOT operator to find employees not earning over $50,000 across all departments.

-- select 
-- 	*
-- from 
-- 	employees 
-- where 
-- 	not(annualsalary > 50000);

-- Task 3: Use the IN operator to find Marketing, Finance, and Legal employees whose annual salary is below $50,000. 

-- select
-- 	*
-- from
-- 	employees
-- where 
-- 	department in ('Marketing', 'Finance', 'Legal') and annualsalary < 50000;

-- Task 4: Use the BETWEEN operator to find employees who earn annual salaries between $10,000 and $50,000.

-- select
-- 	*
-- from 
-- 	employees
-- where
-- 	annualsalary between 10000 and 50000;

-- Task 5: Use the LIKE operator to find employees whose names start with ‘S’ and are at least 4 characters in length.

-- select
-- 	*
-- from
-- 	employees 
-- where 
-- 	employeename like 'S__%';

-------------------------------------------------------------------------------------------------------------

-- CREATE TABLE Customers(CustomerID INT NOT NULL PRIMARY KEY, FullName VARCHAR(100) NOT NULL, PhoneNumber INT NOT NULL UNIQUE);

-- INSERT INTO Customers(CustomerID, FullName, PhoneNumber) VALUES (1, "Vanessa McCarthy", 0757536378), (2, "Marcos Romero", 0757536379), (3, "Hiroki Yamane", 0757536376), (4, "Anna Iversen", 0757536375), (5, "Diana Pinto", 0757536374);

-- CREATE TABLE Bookings (BookingID INT NOT NULL PRIMARY KEY,  BookingDate DATE NOT NULL,  TableNumber INT NOT NULL, NumberOfGuests INT NOT NULL CHECK (NumberOfGuests <= 8), CustomerID INT NOT NULL, FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID) ON DELETE CASCADE ON UPDATE CASCADE); 

-- INSERT INTO Bookings (BookingID, BookingDate, TableNumber, NumberOfGuests, CustomerID) VALUES (10, '2021-11-11', 7, 5, 1), (11, '2021-11-10', 5, 2, 2), (12, '2021-11-10', 3, 2, 4);

-- Task 1: Little Lemon want a list of all customers who have made bookings. Write an INNER JOIN SQL statement to 
-- combine the full name and the phone number of each customer from the Customers table with the related booking date 
-- and 'number of guests' from the Bookings table. 

-- select
-- 	fullname,
--     phonenumber,
--     bookingdate,
--     numberofguests as 'number of guests'
-- from 
-- 	customers c inner join bookings b 
-- on 
-- 	c.CustomerID = b.CustomerID;

-- Task 2: Little Lemon want to view information about all existing customers with bookings that have been made so far. 
-- This data must include customers who haven’t made any booking yet. 

-- select 
-- 	c.customerid,
--     b.BookingID
-- from 
-- 	customers c left join bookings b 
-- on 
-- 	c.CustomerID = b.CustomerID; 

-------------------------------------------------------------------------------------------------------------
-- CREATE TABLE IF NOT EXISTS Orders(OrderID INT, Department VARCHAR(100), OrderDate DATE, OrderQty INT, OrderTotal INT, PRIMARY KEY(OrderID));
-- INSERT INTO Orders VALUES(1,'Lawn Care','2022-05-05',12,500),(2,'Decking','2022-05-22',150,1450),(3,'Compost and Stones','2022-05-27',20,780),(4,'Trees and Shrubs','2022-06-01',15,400),(5,'Garden Decor','2022-06-10',2,1250),(6,'Lawn Care','2022-06-10',12,500),(7,'Decking','2022-06-25',150,1450),(8,'Compost and Stones','2022-05-29',20,780),(9,'Trees and Shrubs','2022-06-10',15,400),(10,'Garden Decor','2022-06-10',2,1250),(11,'Lawn Care','2022-06-25',10,400), 
-- (12,'Decking','2022-06-25',100,1400),(13,'Compost and Stones','2022-05-30',15,700),(14,'Trees and Shrubs','2022-06-15',10,300),(15,'Garden Decor','2022-06-11',2,1250),(16,'Lawn Care','2022-06-10',12,500),(17,'Decking','2022-06-25',150,1450),(18,'Trees and Shrubs','2022-06-10',15,400),(19,'Lawn Care','2022-06-10',12,500),(20,'Decking','2022-06-25',150,1450),(21,'Decking','2022-06-25',150,1450);

-- Task 1: Write a SQL SELECT statement to group all records that have the same order date.

-- select 
-- 	orderdate
-- from
-- 	orders
-- group by
-- 	orderdate;

-- Task 2: Write a SQL SELECT statement to retrieve the number of orders placed on the same day.

-- select
-- 	orderdate,
--     count(orderid)
-- from
-- 	orders
-- group by 
-- 	orderdate;

-- Task 3: Write a SQL SELECT statement to retrieve the total order quantities placed by each department.

-- select
-- 	department,
--     sum(OrderQty)
-- from 
-- 	orders
-- group by
-- 	department;

-- Task 4: Write a SQL SELECT statement to retrieve the number of orders placed on the same day between the following dates:
-- 1st June 2022 and 30th June 2022.

-- select
-- 	orderdate,
--     count(orderid)
-- from 
-- 	orders
-- where 
-- 	orderdate between '2022-06-01' and '2022-06-30'
-- group by 
-- 	orderdate;

-------------------------------------------------------------------------------------------------------------

-- CREATE DATABASE luckyshrub_db; 
USE luckyshrub_db;
-- CREATE TABLE employees (
--   EmployeeID int NOT NULL,
--   EmployeeName varchar(150) DEFAULT NULL,
--   Department varchar(150) DEFAULT NULL,
--   ContactNo varchar(12) DEFAULT NULL,
--   Email varchar(100) DEFAULT NULL,
--   AnnualSalary int DEFAULT NULL,
--   PRIMARY KEY (EmployeeID)
-- );

-- CREATE TABLE orders (
--   OrderID int NOT NULL,
--   Department varchar(100) DEFAULT NULL,
--   OrderDate date DEFAULT NULL,
--   OrderQty int DEFAULT NULL,
--   OrderTotal int DEFAULT NULL,
--   PRIMARY KEY (OrderID)
-- );

-- CREATE TABLE employee_orders (
--  OrderID int NOT NULL,
--  EmployeeID int NOT NULL,
--  Status VARCHAR(150),
--  HandlingCost int DEFAULT NULL,
--  PRIMARY KEY (EmployeeID,OrderID),
--  FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
--  FOREIGN KEY (OrderID) REFERENCES orders(OrderID)
-- );

-- INSERT INTO employees VALUES 
-- (1,'Seamus Hogan', 'Recruitment', '351478025', 'Seamus.h@luckyshrub.com',50000), 
-- (2,'Thomas Eriksson', 'Legal', '351475058', 'Thomas.e@luckyshrub.com',75000), 
-- (3,'Simon Tolo', 'Marketing', '351930582','Simon.t@luckyshrub.com',40000), 
-- (4,'Francesca Soffia', 'Finance', '351258569','Francesca.s@luckyshrub.com',45000), 
-- (5,'Emily Sierra', 'Customer Service', '351083098','Emily.s@luckyshrub.com',35000), 
-- (6,'Maria Carter', 'Human Resources', '351022508','Maria.c@luckyshrub.com',55000),
-- (7,'Rick Griffin', 'Marketing', '351478458','Rick.G@luckyshrub.com',50000);

-- INSERT INTO orders VALUES(1,'Lawn Care','2022-05-05',12,500),
-- (2,'Decking','2022-05-22',150,1450),
-- (3,'Compost and Stones','2022-05-27',20,780),
-- (4,'Trees and Shrubs','2022-06-01',15,400),
-- (5,'Garden Decor','2022-06-10',2,1250),
-- (6,'Lawn Care','2022-06-10',12,500),
-- (7,'Decking','2022-06-25',150,1450),
-- (8,'Compost and Stones','2022-05-29',20,780),
-- (9,'Trees and Shrubs','2022-06-10',15,400),
-- (10,'Garden Decor','2022-06-10',2,1250),
-- (11,'Lawn Care','2022-06-25',10,400), 
-- (12,'Decking','2022-06-25',100,1400),
-- (13,'Compost and Stones','2022-05-30',15,700), 
-- (14,'Trees and Shrubs','2022-06-15',10,300), 
-- (15,'Garden Decor','2022-06-11',2,1250),
-- (16,'Lawn Care','2022-06-10',12,500), 
-- (17,'Decking','2022-06-25',150,1450), 
-- (18,'Trees and Shrubs','2022-06-10',15,400), 
-- (19,'Lawn Care','2022-06-10',12,500), 
-- (20,'Decking','2022-06-25',150,1450), 
-- (21,'Decking','2022-06-25',150,1450); 

-- INSERT INTO employee_orders 
-- VALUES(1,3,"In Progress",200), 
-- (1,5,"Not Recieved",300), 
-- (1,4,"Not Recieved",250), 
-- (2,3,"Completed",200), 
-- (2,5,"Completed",300), 
-- (2,4,"In Progress",250), 
-- (3,3,"In Progress",200), 
-- (3,5,"Not Recieved",300), 
-- (3,4,"Not Recieved",250), 
-- (4,3,"Completed",200), 
-- (4,5,"In Progress",300), 
-- (4,4,"In Progress",250), 
-- (5,3,"Completed",200), 
-- (5,5,"In Progress",300), 
-- (5,4,"Not Recieved",250), 
-- (11,3,"Completed",200), 
-- (11,5,"Completed",300), 
-- (11,4,"Not Recieved",250), 
-- (14,3,"Completed",200), 
-- (14,5,"Not Recieved",300), 
-- (14,4,"Not Recieved",250); 

-- Task1: Use the ANY operator to identify all employees with the Order Status status 'Completed'. 

-- select 
-- 	employeeid,
--     employeename
-- from 
-- 	employees 
-- where 
-- 	EmployeeID = any(
-- 		select employeeID from employee_orders where status = 'Completed'
-- 	);
	
-- Task 2: Use the ALL operator to identify the IDs of employees who earned a handling cost of "more than 20% of the 
-- order value" from all orders they have handled.

-- select 
-- 	employeeid,
--     handlingcost
-- from 
-- 	employee_orders
-- where 
-- 	handlingcost > all(
-- 		select
-- 			OrderTotal * 0.2
-- 		from 
-- 			orders
-- 	); 

-- Task 3: Use the GROUP BY clause to summarize the duplicate records with the same column values into a single record 
-- by grouping them based on those columns.

-- select 
-- 	employeeid,
--     handlingcost
-- from 
-- 	employee_orders
-- where 
-- 	handlingcost > all(
-- 		select
-- 			OrderTotal * 0.2
-- 		from 
-- 			orders
-- 	)
-- group by 
-- 	employeeid,
--     handlingcost;

-- Task 4: Use the HAVING clause to filter the grouped data in the subquery that you wrote in task 3 to filter 
-- the 20% OrderTotal values to only retrieve values that are more than $100.

-- select 
-- 	employeeid,
--     handlingcost
-- from 
-- 	employee_orders
-- where 
-- 	handlingcost > all(
-- 		select
-- 			Round(OrderTotal * 0.2)
-- 		from 
-- 			orders
-- 		where 
-- 			Round(OrderTotal * 0.2) > 100
-- 			
-- 	)
-- group by 
-- 	employeeid,
--     handlingcost;