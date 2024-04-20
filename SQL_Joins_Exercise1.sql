-- inner join on category table and product table 
-- by commonality of category ID to get all computers, Made alias' for easier readability
 
 SELECT P.Name AS ProductName, C.Name AS CategoryName FROM products as P INNER JOIN categories AS C ON C.CategoryID = P.CategoryID
 WHERE C.Name = 'Computers';
 
-- joining product table and reviews table by commonality of product ID to get all products thats have a rating of 5
-- displaying product names, prices and ratings.
-- used inner join so I dont display the products without reviews, less inclusive join for specificity.
 SELECT products.Name AS "Product Name", products.Price AS "Product Price", reviews.Rating AS "Product Rating" -- alias' for readability
 FROM products 
 INNER JOIN reviews ON reviews.ProductID = products.ProductID -- shows all products with reviews
 WHERE reviews.Rating = 5; -- more in depth my rating
 
 /* join employees table and sales table by employee ID. 
/* display employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.FirstName, employees.LastName, SUM(sales.Quantity) AS Total
FROM sales
INNER JOIN employees ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID -- grouping by employeeID to coralate to sum method.
ORDER BY Total DESC LIMIT 1; -- added alias total to order by descending to find the empoyee with most sold, limited to display only that employee.

-- joining categories and departments by department ID for commonality display names for appliances and games
SELECT departments.Name, categories.Name
FROM departments 
INNER JOIN categories ON categories.DepartmentID = departments.DepartmentID
WHERE categories.Name = 'Appliances' OR categories.NAME = 'Games'; -- used OR because no results for both-- tricky


-- joined products and sales by product name, display name, total sold and revenue.
-- for Eagles: Hotel California --Used sum to get the total sold and to multiply total sold by price for revenue
SELECT products.Name, products.ProductID FROM products WHERE products.Name LIKE "Eagles%"; -- got productID
SELECT products.Name, SUM(sales.Quantity) AS 'Total Sold', SUM(sales.Quantity * sales.PricePerUnit) AS 'Total Revenue'
FROM products
INNER JOIN sales ON sales.ProductID = products.ProductID
WHERE products.ProductID = 97;


-- joined products and reviews by  productID, displaying ONLY LOWEST rating for the visio tv. 
SELECT products.Name, products.ProductID FROM products ORDER BY products.Name DESC; -- got product ID
SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment
FROM products
INNER JOIN reviews ON reviews.ProductID = products.ProductID
WHERE products.ProductID = 857 AND reviews.Rating = 1;

-- joining 2 tables of employees and sales by employeeID, then joining another 2 tables of sales and products (researched and I can)
-- by productID, displaying the employeeID, employee.Frist and Last, product.Name, and a total sum of products sold
--  from both joins
SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, SUM(sales.Quantity) AS TotalSold
FROM sales 
INNER JOIN employees ON employees.EmployeeID = sales.EmployeeID -- first 2 tables joined 
INNER JOIN products ON products.ProductID = sales.ProductID -- second 2 tables joined
Group BY employees.EmployeeID, products.ProductID -- grouping by employee ID and ProductID to display the total of each product sold by each employee
ORDER BY employees.EmployeeID; -- order by employee ID to show sales report for 1 employee at a time. 