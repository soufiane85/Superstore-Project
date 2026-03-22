-- =========================
-- SUPERSTORE SQL PROJECT
-- =========================

-- 1. Basic Metrics
SELECT SUM(`Sales`) AS `Total Revenue` FROM superstore;
SELECT SUM(`Profit`) AS `Total Profit` FROM superstore;

-- 2. Product analyse
SELECT `Product Name`,SUM(Profit) AS Revenue
FROM superstore
GROUP BY `Product Name`
ORDER BY Revenue DESC
LIMIT 10;

SELECT `Product Name`,SUM(Profit) AS Revenue
FROM superstore
GROUP BY `Product Name`
ORDER BY Revenue ASC;


-- 3. customer analyse
SELECT `Customer Name`, SUM(Sales) AS `Total Spent`
FROM superstore
GROUP BY `Customer Name`
ORDER BY  `Total Spent` DESC;

-- 4. City analyse
SELECT `City`, SUM(Sales) AS `Total Spent`
FROM superstore
GROUP BY `City`
ORDER BY `Total Spent` DESC
LIMIT 10;

-- 5. Category analyse
SELECT `Category`,SUM(Sales) AS `Total Revenue`,SUM(Profit) AS `Profit`
FROM superstore
GROUP BY `Category`;

-- 6. Sales per months  
SELECT DATE_FORMAT(STR_TO_DATE(`Order Date`, '%m/%d/%Y'), '%Y-%m') AS month,
       SUM(`Sales`) AS `Total Sales`
FROM superstore
GROUP BY month
ORDER BY month;

-- 7. Sales per Year
select year(str_to_date(`Order Date`,'%m/%d/%Y')) as `years`, SUM(`Sales`) AS `Total Sales`
from superstore
group by `years`
order by `years`;

-- 8. Average Delivery Time by Ship Mode
select `Ship Mode`,avg(
                    datediff(
                      str_to_date(`Ship Date`,'%m/%d/%Y'),
                      str_to_date(`Order Date`,'%m/%d/%Y'))
) as `Avg Delivery Days`
from superstore
group by `Ship Mode`;

-- 9. Effect of Discount on Profit
SELECT `Discount`, AVG(`Profit`) AS `Average Profit`
FROM superstore
GROUP BY `Discount`
ORDER BY `Discount`;

-- 10. Correlation Between Sales and Profit by Category
SELECT `Category`, SUM(`Sales`) AS `Total Sales`, SUM(`Profit`) AS `Total Profit`,
       SUM(`Profit`)/SUM(`Sales`) AS `Total Margin`
FROM superstore
GROUP BY `Category`
ORDER BY `Total Margin` DESC;
