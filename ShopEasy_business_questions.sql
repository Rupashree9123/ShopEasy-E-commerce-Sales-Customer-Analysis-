create database ShopEasy;
use ShopEasy;



SELECT *
FROM Customers;

SELECT COUNT(*) AS TotalCustomers
FROM Customers;

SELECT TOP 5 *
FROM Customers;


SELECT COUNT(*) AS TotalProducts
FROM products;

SELECT COUNT(*) AS TotalOrders
FROM clean_orders;

SELECT 
    Status,
    COUNT(*) AS TotalOrders
FROM clean_orders
GROUP BY Status; 

SELECT 
    Status,
    COUNT(*) AS TotalOrders,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM clean_orders), 2) AS OrderPercentage
FROM clean_orders
GROUP BY Status;

SELECT
    MONTH(OrderDate) AS OrderMonth,
    COUNT(*) AS TotalOrders
FROM clean_orders
GROUP BY MONTH(OrderDate)
ORDER BY OrderMonth;

SELECT
    p.Category,
    SUM(o.Quantity) AS TotalQuantitySold
FROM clean_orders AS o
JOIN Products AS p
    ON o.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY TotalQuantitySold DESC;

SELECT
    p.Category,
    SUM(o.Quantity * p.Price * (1 - o.Discount)) AS TotalRevenue
FROM clean_orders AS o
JOIN Products AS p
    ON o.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY TotalRevenue DESC;


SELECT TOP 10
    o.CustomerID,
    SUM(o.Quantity * p.Price * (1 - o.Discount)) AS TotalRevenue
FROM clean_orders AS o
JOIN Products AS p
    ON o.ProductID = p.ProductID
GROUP BY o.CustomerID
ORDER BY TotalRevenue DESC;

SELECT
    SUM(o.Quantity * p.Price * (1 - o.Discount)) AS TotalRevenue
FROM clean_orders AS o
JOIN Products AS p
    ON o.ProductID = p.ProductID;

    SELECT
    AVG(o.Quantity * p.Price * (1 - o.Discount)) AS AverageOrderValue
FROM clean_orders AS o
JOIN Products AS p
    ON o.ProductID = p.ProductID;

    SELECT
    AVG(Discount) * 100 AS AverageDiscountPercentage
FROM clean_orders;

SELECT
    p.Category,
    ROUND(AVG(o.Discount) * 100, 2) AS AverageDiscountPercentage
FROM clean_orders AS o
JOIN Products AS p
    ON o.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY AverageDiscountPercentage DESC;

SELECT
    p.Category,
    o.Status,
    COUNT(*) AS TotalOrders
FROM clean_orders AS o
JOIN Products AS p
    ON o.ProductID = p.ProductID
WHERE o.Status IN ('Returned', 'Cancelled')
GROUP BY p.Category, o.Status
ORDER BY p.Category, o.Status;


SELECT
    p.Category,
    COUNT(*) AS TotalOrders,
    SUM(CASE WHEN o.Status = 'Returned' THEN 1 ELSE 0 END) AS ReturnedOrders,
    SUM(CASE WHEN o.Status = 'Cancelled' THEN 1 ELSE 0 END) AS CancelledOrders,
    ROUND(
        SUM(CASE WHEN o.Status = 'Returned' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*), 2
    ) AS ReturnRate,
    ROUND(
        SUM(CASE WHEN o.Status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*), 2
    ) AS CancellationRate
FROM clean_orders AS o
JOIN Products AS p
    ON o.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY ReturnRate DESC;

SELECT TOP 10
    c.City,
    SUM(o.Quantity * p.Price * (1 - o.Discount)) AS TotalRevenue
FROM clean_orders AS o
JOIN Products AS p
    ON o.ProductID = p.ProductID
JOIN Customers AS c
    ON o.CustomerID = c.CustomerID
GROUP BY c.City
ORDER BY TotalRevenue DESC;

SELECT TOP 10
    c.State,
    SUM(o.Quantity * p.Price * (1 - o.Discount)) AS TotalRevenue
FROM clean_orders AS o
JOIN Products AS p
    ON o.ProductID = p.ProductID
JOIN Customers AS c
    ON o.CustomerID = c.CustomerID
GROUP BY c.State
ORDER BY TotalRevenue DESC; 


SELECT TOP 10
    p.ProductID,
    p.ProductName,
    p.Category,
    SUM(o.Quantity * p.Price * (1 - o.Discount)) AS TotalRevenue
FROM clean_orders AS o
JOIN Products AS p
    ON o.ProductID = p.ProductID
GROUP BY
    p.ProductID,
    p.ProductName,
    p.Category
ORDER BY TotalRevenue DESC;


SELECT TOP 10
    CustomerID,
    COUNT(*) AS TotalOrders
FROM clean_orders
GROUP BY CustomerID
ORDER BY TotalOrders DESC;  

SELECT TOP 10
    o.CustomerID,
    COUNT(*) AS TotalOrders,
    SUM(o.Quantity * p.Price * (1 - o.Discount)) AS TotalRevenue
FROM clean_orders AS o
JOIN Products AS p
    ON o.ProductID = p.ProductID
GROUP BY o.CustomerID
ORDER BY TotalRevenue DESC;


SELECT
    p.Category,
    COUNT(*) AS TotalOrders,
    SUM(o.Quantity * p.Price * (1 - o.Discount)) AS TotalRevenue,
    ROUND(
        SUM(o.Quantity * p.Price * (1 - o.Discount)) * 1.0
        / COUNT(*), 2
    ) AS AverageOrderValue
FROM clean_orders AS o
JOIN Products AS p
    ON o.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY AverageOrderValue DESC;

SELECT TOP 1 *
FROM Products;

SELECT
    p.Category,
    SUM(o.Quantity) AS TotalQuantitySold
FROM clean_orders AS o
JOIN Products AS p
    ON o.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY TotalQuantitySold DESC;

SELECT TOP 10
    p.ProductID,
    p.ProductName,
    p.Category,
    SUM(o.Quantity) AS TotalQuantitySold
FROM clean_orders AS o
JOIN Products AS p
    ON o.ProductID = p.ProductID
GROUP BY
    p.ProductID,
    p.ProductName,
    p.Category
ORDER BY TotalQuantitySold DESC;

SELECT TOP 10
    ProductID,
    ProductName,
    Category,
    Price
FROM Products
ORDER BY Price DESC;

SELECT TOP 10
    p.ProductID,
    p.ProductName,
    p.Category,
    SUM(o.Quantity * p.Price * (1 - o.Discount)) AS TotalRevenue
FROM clean_orders AS o
JOIN Products AS p
    ON o.ProductID = p.ProductID
GROUP BY
    p.ProductID,
    p.ProductName,
    p.Category
ORDER BY TotalRevenue DESC;

SELECT TOP 10
    p.ProductID,
    p.ProductName,
    p.Category,
    COUNT(*) AS TotalOrders
FROM clean_orders AS o
JOIN Products AS p
    ON o.ProductID = p.ProductID
GROUP BY
    p.ProductID,
    p.ProductName,
    p.Category
ORDER BY TotalOrders DESC;


SELECT TOP 10
    o.ProductID,
    p.ProductName,
    p.Category,
    COUNT(*) AS TotalOrders
FROM clean_orders AS o
JOIN Products AS p
    ON o.ProductID = p.ProductID
GROUP BY
    o.ProductID,
    p.ProductName,
    p.Category
ORDER BY TotalOrders DESC;


SELECT
    MONTH(o.OrderDate) AS OrderMonth,
    SUM(o.Quantity * p.Price * (1 - o.Discount)) AS TotalRevenue
FROM clean_orders AS o
JOIN Products AS p
    ON o.ProductID = p.ProductID
GROUP BY MONTH(o.OrderDate)
ORDER BY OrderMonth;


SELECT
    p.Category,
    ROUND(
        AVG(o.Quantity * p.Price * (1 - o.Discount)),
        2
    ) AS AverageOrderValue
FROM clean_orders AS o
JOIN Products AS p
    ON o.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY AverageOrderValue DESC;




