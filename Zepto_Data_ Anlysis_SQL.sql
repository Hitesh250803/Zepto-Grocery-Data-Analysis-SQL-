-- ✅ Your Original Code (unchanged)
DROP TABLE IF EXISTS zepto;

CREATE TABLE zepto (
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountedSellingPrice NUMERIC(8,2),
  weightInGms INTEGER,
  outOfStock BOOLEAN,
  quantity INTEGER
);

--data exploration
SELECT COUNT (*) FROM zepto;

--sample data
SELECT * FROM zepto
LIMIT 10;

--NULL VALUES
SELECT * FROM zepto
WHERE name is NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountpercent IS NULL
OR
discountedsellingprice IS NULL
OR
weightingms IS NULL
OR
availablequantity IS NULL
OR
outofstock IS NULL
OR
quantity IS NULL;

--different product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

--product in stock vs out of stock
SELECT outofstock, COUNT(sku_id)
FROM zepto
Group BY outofstock;

--product name present multiple times
SELECT name, COUNT(sku_id) as "Number of SKUs"
FROM zepto
GROUP BY name
HAVING count (sku_id) > 1
ORDER BY count (sku_id) DESC;

--data cleaning

-- products with price = 0
SELECT * FROM zepto
WHERE  mrp = 0 OR discountedSellingPrice = 0;

DELETE FROM zepto
WHERE mrp = 0;

--convert paise to rupees
UPDATE zepto
SET mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

SELECT name, mrp, discountedSellingPrice From zepto;

-- ✅ Custom Interview-Focused Queries Added Below

-- Q1: What are the top 10 most discounted products?
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;

-- Q2: Which high-MRP products are currently out of stock?
SELECT DISTINCT name, mrp
FROM zepto
WHERE outOfStock = TRUE AND mrp > 300
ORDER BY mrp DESC;

-- Q3: What is the estimated revenue per category?
SELECT category,
       SUM(discountedSellingPrice * availableQuantity) AS estimated_revenue
FROM zepto
GROUP BY category
ORDER BY estimated_revenue DESC;

-- Q4: Which products have high MRP but low discounts?
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent;

-- Q5: Which 5 categories have the highest average discount?
SELECT category,
       ROUND(AVG(discountPercent), 2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6: What is the price per gram for each product above 100g?
SELECT name, weightInGms, discountedSellingPrice,
       ROUND(discountedSellingPrice / weightInGms, 2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;

-- Q7: Classify products into weight categories
SELECT name, weightInGms,
       CASE 
         WHEN weightInGms < 1000 THEN 'Low'
         WHEN weightInGms < 5000 THEN 'Medium'
         ELSE 'Bulk'
       END AS weight_category
FROM zepto;

-- Q8: What is the total weight of inventory per category?
SELECT category,
       SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight DESC;

-- Q9: Calculate customer savings on each product
SELECT name, mrp, discountedSellingPrice,
       (mrp - discountedSellingPrice) AS savings
FROM zepto
ORDER BY savings DESC;

-- Q10: Identify products only available in bulk (>5000g)
SELECT name, weightInGms
FROM zepto
WHERE weightInGms > 5000
ORDER BY weightInGms DESC;

-- Q11: Show available stock value per product
SELECT name,
       discountedSellingPrice,
       availableQuantity,
       (discountedSellingPrice * availableQuantity) AS total_stock_value
FROM zepto
ORDER BY total_stock_value DESC;
