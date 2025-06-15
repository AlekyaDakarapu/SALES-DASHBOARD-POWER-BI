CREATE DATABASE SalesDB;
USE SalesDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    Region VARCHAR(50),
    JoinDate DATE
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    TotalPrice DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
INSERT INTO Customers VALUES 
(1, 'Alice Johnson', 'alice@email.com', 'North America', '2023-01-10'),
(2, 'Bob Smith', 'bob@email.com', 'Europe', '2022-11-15'),
(3, 'Charlie Brown', 'charlie@email.com', 'Asia', '2023-05-20'),
(4, 'David White', 'david@email.com', 'South America', '2021-09-25'),
(5, 'Emma Wilson', 'emma@email.com', 'Australia', '2022-03-30'),
(6, 'Frank Lee', 'frank@email.com', 'North America', '2023-07-10'),
(7, 'Grace Hall', 'grace@email.com', 'Europe', '2021-12-05'),
(8, 'Henry Adams', 'henry@email.com', 'Asia', '2022-06-15'),
(9, 'Ivy Turner', 'ivy@email.com', 'South America', '2023-08-20'),
(10, 'Jack Green', 'jack@email.com', 'Australia', '2022-04-10');
INSERT INTO Products VALUES 
(101, 'Laptop', 'Electronics', 1200.00),
(102, 'Smartphone', 'Electronics', 800.00),
(103, 'Headphones', 'Accessories', 150.00),
(104, 'Tablet', 'Electronics', 600.00),
(105, 'Smartwatch', 'Wearables', 250.00),
(106, 'Wireless Mouse', 'Accessories', 40.00),
(107, 'Monitor', 'Electronics', 300.00),
(108, 'Keyboard', 'Accessories', 70.00),
(109, 'Gaming Console', 'Entertainment', 500.00),
(110, 'External Hard Drive', 'Storage', 200.00);
INSERT INTO Orders VALUES 
(1001, 1, '2024-02-01', 1350.00),
(1002, 2, '2024-02-03', 800.00),
(1003, 3, '2024-02-05', 1200.00),
(1004, 4, '2024-02-07', 750.00),
(1005, 5, '2024-02-10', 250.00),
(1006, 6, '2024-02-12', 1400.00),
(1007, 7, '2024-02-15', 900.00),
(1008, 8, '2024-02-18', 1800.00),
(1009, 9, '2024-02-20', 400.00),
(1010, 10, '2024-02-25', 1200.00);
INSERT INTO Sales VALUES 
(5001, 1001, 101, 1, 1200.00),
(5002, 1001, 103, 1, 150.00),
(5003, 1002, 102, 1, 800.00),
(5004, 1003, 101, 1, 1200.00),
(5005, 1004, 105, 3, 750.00),
(5006, 1005, 105, 1, 250.00),
(5007, 1006, 101, 1, 1200.00),
(5008, 1006, 106, 5, 200.00),
(5009, 1007, 102, 1, 800.00),
(5010, 1007, 107, 1, 300.00),
(5011, 1008, 108, 2, 140.00),
(5012, 1008, 109, 1, 500.00),
(5013, 1008, 110, 2, 400.00),
(5014, 1009, 106, 10, 400.00),
(5015, 1010, 101, 1, 1200.00);
SELECT 
    DATE_FORMAT(OrderDate, '%Y-%m') AS Month,
    SUM(TotalAmount) AS TotalRevenue
FROM Orders
GROUP BY Month
ORDER BY Month; /*Total revenue by month*/
SELECT 
    c.Region,
    SUM(o.TotalAmount) AS TotalRevenue
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.Region
ORDER BY TotalRevenue DESC; /* Sales Performance by Region */
SELECT 
    p.ProductName,
    SUM(s.Quantity) AS TotalSold,
    SUM(s.TotalPrice) AS Revenue
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Revenue DESC
LIMIT 5; /*Top 5 Best-Selling Products*/

SELECT 
    c.CustomerName,
    COUNT(o.OrderID) AS OrderCount,
    SUM(o.TotalAmount) AS TotalSpent
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalSpent DESC; /*Customer Purchase Frequency*/



