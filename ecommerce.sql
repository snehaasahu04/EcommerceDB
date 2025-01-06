create database ecommerce_platform;
use ecommerce_platform;
create table customers_table(
CustomerID INT primary key,
Customer_name VARCHAR(50) NOT NULL,
Email VARCHAR (100),
Phone VARCHAR(50) NOT NULL,
City VARCHAR (50), 
Country VARCHAR(50)
);
INSERT INTO customers_table (CustomerID, Customer_name, Email, Phone, City, Country)
VALUES 
(1, "John Doe", "john.doe@gmail.com", "123-456-789", "new york", "USA"),
(2, "Jane smith", "jane.smith@gmail.com", "987-654-321","london", "UK"),
(3, "Alice johnson", "alice.johnson@gmail.com", "555-123-456","sydney", "Australia"),
(4, "Bob brown", "bob.brown@gmail.com", "444-321-654", "toronto", "Canada");

SELECT * FROM customers_table;

CREATE TABLE products_table(
ProductID INT PRIMARY KEY, -- unique identifier
Product_name VARCHAR(50) NOT NULL,
Category VARCHAR (50),
Price DOUBLE,
Stock int
);
INSERT INTO  products_table (ProductID, Product_name, Category, Price, Stock)
values 
(101,	"Smartphone", "Electronics", 699.99, 50),
(102,	"Laptop", "	Electronics", 1099.99, 30),
(103,	"Coffee Maker", "Appliances", 79.99,100),
(104,	"Headphones", "Electronics", 199.99, 200),
(105,	"Gaming Console", "Gaming",	499.99,	25);

select * from  products_table;

create table orders_table(
OrderID INT PRIMARY KEY,-- unique identifier
CustomerID	INT,
FOREIGN KEY (CustomerID) REFERENCES customers_table (CustomerID), -- foreign key from the customers_table
OrderDate DATE, 
TotalAmount DOUBLE
);

INSERT INTO orders_table (OrderID, CustomerID, OrderDate, TotalAmount)
values
(1001, 1, '2025-01-01', 899.98),
(1002, 2, '2025-01-03', 1099.99),
(1003, 3, '2025-01-05', 579.98),
(1004, 4, '2025-01-06', 699.99);

select * from orders_table;

create table OrderDetails_table(
OrderDetailID INT PRIMARY KEY,-- unique identifier
OrderID INT,
FOREIGN KEY (OrderID) REFERENCES orders_table (OrderID),-- foreign key from the orders_table
ProductID INT,
FOREIGN KEY (ProductID) REFERENCES products_table (ProductID),-- foreign key from the products_table
Quantity INT,
Subtotal double
);
INSERT INTO OrderDetails_table (OrderDetailID, OrderID, ProductID, Quantity, Subtotal)
VALUES
(1, 1001, 101, 1, 699.99),
(2, 1001, 104, 1, 199.99),
(3, 1002, 102, 1, 1099.99),
(4, 1003, 105, 1, 499.99),
(5, 1003, 103, 1, 79.99);

SELECT * FROM  OrderDetails_table;

-- SAMPLE QUERRIES:

-- Find all customers from a specific country:
select * from customers_table WHERE Country = 'USA';

-- Get total revenue from orders:
select sum(subtotal) from  OrderDetails_table as Total_revenue;

-- List all products that are out of stock:
select Product_name, ProductID FROM products_table where stock = 0;

-- Find order details for a specific order:
-- taking smartphone as example
select OrderDetailID from OrderDetails_table where ProductID = 101;

-- updates the price of the product with ProductID 104 to 799.99:
UPDATE products_table
SET Price = 799.99
WHERE ProductID = 104;

select * from products_table;

--  delete the product with ProductID 2 from the Products table.
delete from products_table where ProductID = 1;

select * from products_table;

--  the total number of rows in the Products table.
SELECT COUNT(*) FROM products_table;

-- Grouping Data with Aggregation Functions  and calculating the number of products and the average price in each category.
SELECT Category, COUNT(*) AS NumberOfProducts, AVG(Price) AS AveragePrice
FROM products_table
GROUP BY Category;

-- sorting data by Price in ascending order.
select Price from products_table order by Price ASC;

-- sorting data by ProductName in descending order.
select Product_name from products_table order by Product_name DESC;

-- limit first 4 rows from the Products table.
select * from products_table LIMIT 5;

-- inner join between the Orders and Customers tables, retrieving the order ID, customer name, order date, and total amount for each order.
select OrderID, Customer_name, OrderDate, TotalAmount
from customers_table
inner join orders_table
on customers_table.CustomerID = orders_table.CustomerID;

-- create an index on the ProductName column in the Products table to speed up queries that search for product names.
CREATE INDEX idx_product_name ON products_table (Product_name);

-- using SUBQUERRIES TO retrieve products with a price higher than the average price of all products in the Products table.
SELECT avg(Price) from products_table;
select Product_name from products_table where Price > 635.99;

-- Using IN for Multiple Values to retrieve products where the category is either Electronics or Accessories.
select * from products_table
where Category IN ("electronics", "accessories");

-- Using LIKE for Pattern Matching to retrieve products where the product name contains the word "Phone."
select * from products_table
where Product_name LIKE ("Phone");

-- Using BETWEEN for Range to retrieve products where the price is between 100 and 500.
select * from products_table
where Price BETWEEN 100 AND 500;

-- add a new column Description to the Products table.
ALTER TABLE products_table
ADD Column Description TEXT;

select * from products_table;

-- rename the StockQuantity column to QuantityInStock.
ALTER TABLE products_table
RENAME COLUMN Stock TO QuantityInStock;

-- create a view called Electronics that retrieves only products in the Electronics category.

CREATE VIEW Electronics AS
SELECT ProductID, Product_name, Price
FROM products_table
WHERE Category = 'Electronics';


