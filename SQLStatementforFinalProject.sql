/*This SQL statement was written by Ernest Mushinge in Summer of 2016*/
/*This SQL statements will provide a business meaning in querrying data from helenshomemadeicecream database*/
use helenshomemadeicecream;
/*code a statement that shows  how many sales did one employee made (total sale)*/
SELECT 
    *
FROM
    inventory;

/*code a statement that shows the vendor of ice cream flavor that had more sales*/
/*code a statement that shows the customer who bought more ice cream and what flavor*/
use helenshomemadeicecream;
SELECT 
    *
FROM
    customer; 

/*finals 5.2*/
use helenshomemadeicecream;
SELECT 
    MAX(SaleAmountPaid) AS 'Highest Sale',
    employee.FirstName AS 'Sold By',
    TimeCreated AS 'On Date'
FROM
    sales AS T1
        INNER JOIN
    employee
WHERE
    (SELECT 
            COUNT(SaleAmountPaid)
        FROM
            sales AS T2
        WHERE
            T2.SaleAmountPaid > T1.SaleAmountPaid
                OR T1.SaleAmountPaid > T2.SaleAmountPaid);

/*finals 5.3*/
use helenshomemadeicecream;
SELECT 
    SUM(SaleAmountPaid) AS 'Total Sale',
    COUNT(CustomerID) AS 'Number of Customers'
FROM
    Sales
        INNER JOIN
    Customer
GROUP BY Customer.FirstName
LIMIT 1;

/*Inner join of atleast three tables*/
use helenshomemadeicecream;
SELECT 
    ingredients.Name AS 'Name of Ingredient',
    flavors.Name AS 'Name of Flavor',
    recipe.Name AS 'Name of Recipe'
FROM
    ingredients
        INNER JOIN
    recipe
        JOIN
    flavors ON recipe.RecipeID = flavors.RecipeID
        AND recipe.IngredientID = ingredients.IngredientID;
        
        /*Outer join of tables*/
use helenshomemadeicecream;
SELECT 
    sales.SaleAmountPaid AS 'Amount Paid',
    customer.FirstName AS 'By Customer'
FROM
    sales
        RIGHT OUTER JOIN
    customer ON customer.CustomerID = sales_line_item.CustomerID
WHERE
    sales.SaleAmountPaid > 20
        OR sales.SaleAmountPaid = NULL
;

        /*Outer join of tables*/
use helenshomemadeicecream;
SELECT 
    sales.SaleAmountPaid AS 'Amount Paid',
    employee.FirstName AS 'By Employee'
FROM
    sales
        RIGHT OUTER JOIN
    employee ON employee.EmployeeID = sales.EmployeeID

;

use helenshomemadeicecream;
SELECT 
    SUM(sales.SaleAmountPaid) AS 'Total Sale',
    customer.FirstName AS 'By Customer'
FROM
    customer
        INNER JOIN
    sales_line_item
        JOIN
    sales ON customer.CustomerID = sales_line_item.CustomerID
        AND sales_line_item.SalesID = sales.SalesID
GROUP BY customer.FirstName
ORDER BY COUNT(*) DESC;

 /*Creating a View*/
 use helenshomemadeicecream;
CREATE OR REPLACE VIEW best_customers (Total_Sales , By_Customer) AS
    SELECT 
        SUM(sales.SaleAmountPaid), customer.FirstName
    FROM
        customer
            INNER JOIN
        sales_line_item
            JOIN
        sales ON customer.CustomerID = sales_line_item.CustomerID
            AND sales_line_item.SalesID = sales.SalesID
    GROUP BY customer.FirstName
    ORDER BY COUNT(*) DESC;
    
     /*Creating a Trigger*/
 use helenshomemadeicecream;
 IF EXIST (SELECT name FROM sysobjects WHERE name = 'insert_trigger' AND type = 'TR')
 DROP TRIGGER insert_trigger
 
 GO
 DELIMITER //
CREATE TRIGGER insert_trigger before insert on sales
FOR EACH ROW

BEGIN
declare SaleAmount double(9,2);
SELECT 
    SaleAmountPaid
INTO SaleAmount FROM
    sales
WHERE
    sales.SalesID = NEW.SalesID;

IF SaleAmount < 1
THEN 
SIGNAL sqlstate 'HY000'
   SET MESSAGE_TEXT = 'Sale Amount must be over $1 data rolled back';
   END IF;
   END//
   
   insert into sales values (default, default, 0.3, 1,1)







    /*Creating a Trigger*/
 use helenshomemadeicecream;
DELIMITER $$
DROP TRIGGER IF EXISTS validateSaleAmount$$
CREATE TRIGGER validateSaleAmount
BEFORE UPDATE ON sales
FOR EACH ROW
BEGIN
  IF NEW.SaleAmountPaid < 1 THEN
  SIGNAL SQLSTATE '45000'
     SET message_text = ' Amount must be more than $1';
  END IF;
  END$$
  
  
  use helenshomemadeicecream;
  drop trigger insert_trigger;
  
  use helenshomemadeicecream;
  update sales
  set SaleAmountpaid = 0.6
  where sales.SalesID = 1;
 
  /*Creating a Trigger*/
 use helenshomemadeicecream;
 DELIMITER $$
 CREATE PROCEDURE onInsertInSales(
 SalID INT,
 TIME_DATE DATE,
 SALE_AMOUNT DOUBLE(9,2),
 EMP_ID INT,
 FLAV_ID INT
 

 )
 
 BEGIN
 #Declare sql_error TINYINT DEFAULT FALSE;
 Declare MESSAGE_TEXT VARCHAR(200);
# Declare CONTINUE HANDLER FOR  SQLEXCEPTION
# SET sql_error = true;
 
 #this line will insert defaut value if column is null
 IF SALE_AMOUNT IS NULL THEN
   SET SALE_AMOUNT = 2.00;
 ELSEIF SALE_AMOUNT > 1 THEN 

  SET MESSAGE_TEXT = concat('YOU JUST INSERTED $', SALE_AMOUNT, ' INTO sales Table');
  #SET MESSAGE_TEXT = 'YOU JUST INSERTED INTO THE TABLE';
 COMMIT;
 ELSEIF SALE_AMOUNT < 1 THEN
  SIGNAL SQLSTATE '22003';
   SET MESSAGE_TEXT = concat('FAILED TO INSERT $', SALE_AMOUNT, ' INTO sales Table');
    #SET MESSAGE_TEXT = 'FAILED TO INSERT';
    
   ROLLBACK;
 END IF; 
 END$$

select * from flavors;
select * from ingredients;
select * from recipe;
select *  from sales;
select *  from customer;
select *  from employee;
select *  from invoice;
select *  from sales_line_item;
select *  from invoice_line_item;
select *  from vendor;
    
/*This SQL select statement selects all employees whos city is Cleveland */
use helenshomemadeicecream;
SELECT 
    CONCAT(LastName, ' ' ,FirstName) AS 'Name',
    PhoneNumber AS 'Contact',
    City AS 'Residency'
FROM
    employee
WHERE
    employee.City LIKE 'Cleveland'
ORDER BY employee.FirstName;

select * from sales_line_item;
select * from sales;
