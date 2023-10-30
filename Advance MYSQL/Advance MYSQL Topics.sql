-- CREATE DATABASE Lucky_Shrub;
USE Lucky_Shrub; 

-- CREATE TABLE Orders (OrderID INT NOT NULL PRIMARY KEY, ClientID VARCHAR(10), ProductID VARCHAR(10), Quantity INT, Cost DECIMAL(6,2), Date DATE); 
-- INSERT INTO Orders(OrderID, ClientID, ProductID , Quantity, Cost, Date) VALUES
-- (1, "Cl1", "P1", 10, 500, "2020-09-01"),  
-- (2, "Cl2", "P2", 5, 100, "2020-09-05"),  
-- (3, "Cl3", "P3", 20, 800, "2020-09-03"),  
-- (4, "Cl4", "P4", 15, 150, "2020-09-07"),  
-- (5, "Cl3", "P3", 10, 450, "2020-09-08"),  
-- (6, "Cl2", "P2", 5, 800, "2020-09-09"),  
-- (7, "Cl1", "P4", 22, 1200, "2020-09-10"),  
-- (8, "Cl3", "P1", 15, 150, "2020-09-10"),  
-- (9, "Cl1", "P1", 10, 500, "2020-09-12"),  
-- (10, "Cl2", "P2", 5, 100, "2020-09-13"),  
-- (11, "Cl4", "P5", 5, 100, "2020-09-15"), 
-- (12, "Cl1", "P1", 10, 500, "2022-09-01"),  
-- (13, "Cl2", "P2", 5, 100, "2022-09-05"),  
-- (14, "Cl3", "P3", 20, 800, "2022-09-03"),  
-- (15, "Cl4", "P4", 15, 150, "2022-09-07"),  
-- (16, "Cl3", "P3", 10, 450, "2022-09-08"),  
-- (17, "Cl2", "P2", 5, 800, "2022-09-09"),  
-- (18, "Cl1", "P4", 22, 1200, "2022-09-10"),  
-- (19, "Cl3", "P1", 15, 150, "2022-09-10"),  
-- (20, "Cl1", "P1", 10, 500, "2022-09-12"),  
-- (21, "Cl2", "P2", 5, 100, "2022-09-13"),   
-- (22, "Cl2", "P1", 10, 500, "2021-09-01"),  
-- (23, "Cl2", "P2", 5, 100, "2021-09-05"),  
-- (24, "Cl3", "P3", 20, 800, "2021-09-03"),  
-- (25, "Cl4", "P4", 15, 150, "2021-09-07"),  
-- (26, "Cl1", "P3", 10, 450, "2021-09-08"),  
-- (27, "Cl2", "P1", 20, 1000, "2022-09-01"),  
-- (28, "Cl2", "P2", 10, 200, "2022-09-05"),  
-- (29, "Cl3", "P3", 20, 800, "2021-09-03"),  
-- (30, "Cl1", "P1", 10, 500, "2022-09-01");

---------------------------------------------------------------------------

-- Task 1:
-- Create a SQL function that prints the cost value of a specific order based on the user input of the OrderID. 
-- The expected output result should be the same as the result in the screenshot below when you call the function 
-- with an OrderID of 5.

-- DELIMITER //
-- CREATE FUNCTION GetCostValue(orderidinput INT) RETURNS DECIMAL(6,2) DETERMINISTIC 
-- BEGIN
-- RETURN (SELECT Cost FROM Orders WHERE orderid = orderidinput);
-- END//
-- DELIMITER ;

-- select GetCostValue(5); 

-- Task 2:
-- Create a stored procedure called GetDiscount. This stored procedure must return the final cost of the customer's order after the discount value has been deducted. 
-- The discount value is based on the order's quantity. The stored procedure must have the following specifications: 
-- The procedure should take one parameter that accepts a user input value of an OrderID. 
-- The procedure must find the order quantity of the specific OrderID. 
-- If the value of the order quantity is more than or equal to 20 then the procedure should return the new cost after a 20% discount. 
-- If the value of the order quantity is less than 20 and more than or equal to 10 then the procedure should return the new cost after 
-- a 10% discount.

-- My Solution

-- DELIMITER //
-- CREATE PROCEDURE GetDiscount(IN orderidinput INT)
-- BEGIN
-- 	select 
-- 		case 
-- 			when quantity >= 20 then cost - (cost * 0.2)
--             when quantity >= 10 and quantity < 20 then cost - (cost * 0.1)
-- 		end cost_after_discount
--     from 
-- 		orders
-- 	where 
-- 		orderid = orderidinput;
-- END//
-- DELIMITER ;

-- CALL GetDiscount(5);

-- Meta Solution
-- DELIMITER // 
-- CREATE Procedure GetDiscount(OrderIDInput INT) 
--      BEGIN 
--          DECLARE cost_after_discount DECIMAL(7,2); 
--          DECLARE current_cost DECIMAL(7,2); 
--          DECLARE order_quantity INT; 
--          SELECT Quantity INTO order_quantity FROM Orders WHERE OrderID = OrderIDInput; 
--          SELECT Cost INTO current_cost FROM Orders WHERE OrderID = OrderIDInput; 
--         IF order_quantity >= 20 THEN
--           SET cost_after_discount = current_cost - (current_cost * 0.2);              
--         ELSEIF order_quantity >= 10 THEN
--           SET cost_after_discount = current_cost - (current_cost * 0.1); 
--         ELSE SET cost_after_discount = current_cost;
--         END IF;
--     SELECT cost_after_discount; 
-- END//
-- DELIMITER ; 

---------------------------------------------------------------------------

-- CREATE TABLE Products (ProductID VARCHAR(10), ProductName VARCHAR(100),BuyPrice DECIMAL(6,2), SellPrice DECIMAL(6,2), NumberOfItems INT);

-- INSERT INTO Products (ProductID, ProductName, BuyPrice, SellPrice, NumberOfITems)

-- VALUES ("P1", "Artificial grass bags ", 40, 50, 100),  
-- ("P2", "Wood panels", 15, 20, 250),  
-- ("P3", "Patio slates",35, 40, 60),  
-- ("P4", "Sycamore trees ", 7, 10, 50),  
-- ("P5", "Trees and Shrubs", 35, 50, 75),  
-- ("P6", "Water fountain", 65, 80, 15);

-- CREATE TABLE Notifications (NotificationID INT AUTO_INCREMENT, Notification VARCHAR(255), DateTime TIMESTAMP NOT NULL, PRIMARY KEY(NotificationID));

-- Task 1:

-- Create an INSERT trigger called ProductSellPriceInsertCheck. This trigger must check if the SellPrice of the product 
-- is less than the BuyPrice after a new product is inserted in the Products table. If this occurs, then a notification 
-- must be added to the Notifications table to inform the sales department. The sales department can then ensure that 
-- the incorrect values were not inserted by mistake.

-- The notification message should be in the following format: A SellPrice less than the BuyPrice was inserted for 
-- ProductID + ProductID
-- DELIMITER //
-- CREATE TRIGGER ProductSellPriceInsertCheck  
--   AFTER INSERT ON Products  
--   FOR EACH ROW  
-- BEGIN 
--   IF NEW.sellprice <= New.buyprice THEN  
--     INSERT INTO  Notifications(Notification, datetime) values(concat('A SellPrice less than the BuyPrice was inserted for product ', New.productid), current_timestamp());
--   END IF; 
-- END//
-- DELIMITER ;

-- INSERT INTO products values('p7', 'product', 40,40,15)

-- select * from products
-- select * from notifications

-- Task 2:

-- Create an UPDATE trigger called ProductSellPriceUpdateCheck. This trigger must check that products are not updated 
-- with a SellPrice that is less than or equal to the BuyPrice. If this occurs, add a notification to the Notifications 
-- table for the sales department so they can ensure that product prices were not updated with the incorrect values. 
-- This trigger sends a notification to the Notifications table that warns the sales department of the issue.

-- The notification message should be in the following format: ProductID + was updated with a SellPrice of  
-- + SellPrice + which is the same or less than the BuyPrice
-- drop trigger ProductSellPriceUpdateCheck;
-- DELIMITER //
-- CREATE TRIGGER ProductSellPriceUpdateCheck  
--   BEFORE UPDATE ON Products  
--   FOR EACH ROW  
-- BEGIN 
--   IF NEW.sellprice <= New.buyprice THEN  
-- 	INSERT INTO  Notifications(Notification, datetime) values(concat(New.productid, ' was updated with a SellPrice of ', New.sellprice,  ' which is the same or less than the BuyPrice'), current_timestamp());
--     SET New.sellprice = (select sellprice from products where productid = new.productid);
--   END IF; 
-- END//

-- UPDATE products
-- SET
-- 	sellprice = 60
-- WHERE
-- 	productid = 'p6';
    
-- select * from products;

-- select * from notifications;

-- Task 3:

-- Create a DELETE trigger called NotifyProductDelete. This trigger must insert a notification in the Notifications 
-- table for the sales department after a product has been deleted from the Products table.

-- The notification message should be in the following format: The product with a ProductID  + ProductID + was deleted

-- DELIMITER //
-- CREATE TRIGGER NotifyProductDelete  
--   AFTER DELETE ON Products  
--   FOR EACH ROW  
-- BEGIN 
-- 	INSERT INTO  Notifications(Notification, datetime) values(concat('The product with a ProductID ', OLD.ProductID, ' was deleted'), current_timestamp());
-- END//

-- delete from products where productid = 'p7';
-- select * from products;
-- select * from notifications;
