
# Project Title

A brief description of what this project does and who it's for


# Ecommerce Platform SQL Queries

This repository contains the SQL code for creating and managing a database for an ecommerce platform. It includes tables for customers, products, orders, and order details, along with sample queries for common ecommerce use cases.

## Database Structure

### 1. **Customers Table**

The `customers_table` stores information about customers, such as their contact details and location.

#### Columns:
- **CustomerID**: Unique identifier for customers.
- **Customer_name**: Full name of the customer.
- **Email**: Email address of the customer.
- **Phone**: Contact number of the customer.
- **City**: City where the customer resides.
- **Country**: Country of the customer.

### 2. **Products Table**

The `products_table` stores details about the products available for sale in the ecommerce platform.

#### Columns:
- **ProductID**: Unique identifier for products.
- **Product_name**: Name of the product.
- **Category**: Category of the product (e.g., Electronics, Appliances).
- **Price**: Price of the product.
- **Stock**: Quantity of the product available in stock.

### 3. **Orders Table**

The `orders_table` stores details about customer orders.

#### Columns:
- **OrderID**: Unique identifier for orders.
- **CustomerID**: References the `CustomerID` from `customers_table`.
- **OrderDate**: Date when the order was placed.
- **TotalAmount**: Total amount of the order.

### 4. **OrderDetails Table**

The `OrderDetails_table` stores the details of products in each order.

#### Columns:
- **OrderDetailID**: Unique identifier for each order detail.
- **OrderID**: References the `OrderID` from `orders_table`.
- **ProductID**: References the `ProductID` from `products_table`.
- **Quantity**: Quantity of the product in the order.
- **Subtotal**: Subtotal cost for the product in the order.

## Sample Queries

### Basic Queries

1. **Find all customers from a specific country:**
    ```sql
    SELECT * FROM customers_table WHERE Country = 'USA';
    ```

2. **Get total revenue from orders:**
    ```sql
    SELECT SUM(subtotal) AS Total_Revenue FROM OrderDetails_table;
    ```

3. **List all products that are out of stock:**
    ```sql
    SELECT Product_name, ProductID FROM products_table WHERE Stock = 0;
    ```

4. **Find order details for a specific order (e.g., Smartphone):**
    ```sql
    SELECT OrderDetailID FROM OrderDetails_table WHERE ProductID = 101;
    ```

### Data Manipulation

1. **Update the price of a product (e.g., Headphones):**
    ```sql
    UPDATE products_table
    SET Price = 799.99
    WHERE ProductID = 104;
    ```

2. **Delete a product (e.g., ProductID = 1):**
    ```sql
    DELETE FROM products_table WHERE ProductID = 1;
    ```

3. **Count the number of rows in the Products table:**
    ```sql
    SELECT COUNT(*) FROM products_table;
    ```

4. **Group products by category and calculate the average price:**
    ```sql
    SELECT Category, COUNT(*) AS NumberOfProducts, AVG(Price) AS AveragePrice
    FROM products_table
    GROUP BY Category;
    ```

5. **Sort products by price in ascending order:**
    ```sql
    SELECT Price FROM products_table ORDER BY Price ASC;
    ```

6. **Inner join between Orders and Customers tables:**
    ```sql
    SELECT OrderID, Customer_name, OrderDate, TotalAmount
    FROM customers_table
    INNER JOIN orders_table
    ON customers_table.CustomerID = orders_table.CustomerID;
    ```

### Advanced Queries

1. **Create an index on the ProductName column:**
    ```sql
    CREATE INDEX idx_product_name ON products_table (Product_name);
    ```

2. **Retrieve products with a price higher than the average price:**
    ```sql
    SELECT Product_name FROM products_table WHERE Price > (SELECT AVG(Price) FROM products_table);
    ```

3. **Retrieve products in Electronics or Accessories category:**
    ```sql
    SELECT * FROM products_table
    WHERE Category IN ('Electronics', 'Accessories');
    ```

4. **Retrieve products where the product name contains the word "Phone":**
    ```sql
    SELECT * FROM products_table
    WHERE Product_name LIKE '%Phone%';
    ```

5. **Retrieve products where the price is between 100 and 500:**
    ```sql
    SELECT * FROM products_table
    WHERE Price BETWEEN 100 AND 500;
    ```

6. **Add a new column "Description" to the Products table:**
    ```sql
    ALTER TABLE products_table
    ADD COLUMN Description TEXT;
    ```

7. **Rename the "Stock" column to "QuantityInStock":**
    ```sql
    ALTER TABLE products_table
    RENAME COLUMN Stock TO QuantityInStock;
    ```

8. **Create a view called "Electronics" for products in the Electronics category:**
    ```sql
    CREATE VIEW Electronics AS
    SELECT ProductID, Product_name, Price
    FROM products_table
    WHERE Category = 'Electronics';
    ```

## How to Use

1. Ensure that you have access to a MySQL-compatible database system.
2. Run the SQL commands to create the `ecommerce_platform` database and the tables.
3. Use the provided sample queries to interact with the data.
4. Modify the queries as needed to suit your specific requirements.

## Contributions

Feel free to contribute by:

- Adding more advanced queries.
- Improving existing queries.
- Proposing new features or analytical scenarios.










