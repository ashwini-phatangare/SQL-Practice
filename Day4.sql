CREATE DATABASE day4;
USE day4;
-- CREATE TABLE 

CREATE TABLE sales (
id INT PRIMARY KEY,
item VARCHAR(50),
category VARCHAR(50),
amount INT 
);

-- -------------------------
-- 2 INSERT DATA
-- ---------------------------

INSERT INTO sales(id,item,category,amount) VALUES
(1,'Pen','Stationary',10),
(2,'Book','Stationary',50),
(3,'Pencil','Stationary',5),
(4,'Apple','Grocery',20),
(5,'Milk','Grocery',30),
(6,'Soap','Cosmetic',25),
(7,'Shampoo','cosmetics',90),
(8,'Rice','Grocery',60),
(9,'Notebook','Stationary',40),
(10,'Cream','Cosmetic',45);

SELECT * FROM sales;

-- AGGREGATION FUNCTION

-- Total sales amount
SELECT SUM(amount) AS total_sales FROM sales;

-- Average sale amount
SELECT AVG(amount) AS avg_amount FROM sales;

-- Total number of items
SELECT COUNT(*) AS total_item FROM sales;

-- Minimum amount
SELECT MIN(amount) AS min_amount FROM sales;

-- Maximum amount
SELECT MAX(amount) AS max_amount FROM sales;

-- ------------------------------------------------------------------
-- GROUP BY QUERIES
-- -------------------------------------------------------------------

-- total amount per category

SELECT category,SUM(amount) AS total_amount
FROM sales
GROUP BY category;

-- Average amount per category
SELECT category,AVG(amount) AS avg_amount
FROM sales
GROUP BY category

-- Count items per category
SELECT category,COUNT(*) AS item_count
FROM sales
GROUP BY category

-- Min and Max amount Per category
SELECT category,MIN(amount) AS min_amount ,MAx(amount) AS max_amount
FROM sales
GROUP BY category;


-- -----------------------------------------------------------
-- 5 HAVING CLAUSE(FILTERS)
-- --------------------------------------------------

-- Categories with more tham 3 items
SELECT category ,COUNT(*) AS total_items
FROM sales
GROUP BY category
HAVING COUNT(*)>3;

-- Categories with average amount > 30
SELECT category,AVG(amount) AS avg_amount
FROM sales
GROUP BY category
HAVING AVG(amount)>30;

-- categories with max item price > 50
SELECT category ,MAX(amount) AS max_val
FROM sales
GROUP BY category
HAVING MAX(amount) > 50;

-- -----------------------------------------------------------
-- 6 . WHERE + GROUP BY + HAVING(combined)
-- -------------------------------------------------------------

-- Only grocery & Stationary categories
SELECT category,SUM(amount) AS total_amount
FROM sales
WHERE category IN ('Grocery','Stationary')
GROUP BY category;

-- Items with amount > 20,then grouped
SELECT category,COUNT(*) AS total_items
FROM sales
WHERE amount > 20
GROUP BY category;

-- Groups with count >= 2
SELECT category,COUNT(*) AS total_items
FROM sales
GROUP BY category
HAVING COUNT(*) >=2;

-- sTATIONARY ITEMS AVG > 20
SELECT category,AVG(amount) AS avg_amount
FROM sales
GROUP BY category
HAVING AVG(amount)>20;

-- --------------------------------

-- 7.ADVANCED GROUP BY QUERIES
-- ------------------------------------------
-- Group by multiple columns
SELECT category,item,SUM(amount) AS total_amount
FROM sales
GROUP BY category,item;


-- sort grouped output
SELECT category,SUM(amount) AS total_amount
FROM sales
GROUP BY category
ORDER BY total_amount DESC;
