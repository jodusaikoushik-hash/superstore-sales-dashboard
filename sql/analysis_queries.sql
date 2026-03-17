-- ===========================================================
-- Superstore Sales Analysis
-- Data Analyst Portfolio Project
-- Tools: Excel | SQL Server | Power BI
-- ===========================================================

---Quick data preview: inspect first 10 rows to confirm successful import and schema

SELECT TOP 10 *
FROM Superstore_sales

-- Q1: Which region generates the highest revenue and profit?
-- Shows geographic performance and regional profitability

SELECT 
Region,
SUM(Sales) AS Total_Revenue,
SUM(Profit) AS Total_Profit,
SUM(Profit) / SUM(Sales) AS Profit_Margin
FROM Superstore_sales
GROUP BY Region
ORDER BY Total_Revenue DESC;

-- Q2: Which product category and sub-category is most/least profitable?
-- Helps identify most and least profitable products

SELECT 
Category,
Sub_Category,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM superstore_sales
GROUP BY Category, Sub_Category
ORDER BY Total_Profit ASC; --ASC to find loss makers appear first

-- Q3:Monthly sales trend over the years?

SELECT 
Order_Year,
Order_Month_Number,
SUM(Sales) AS Monthly_Sales
FROM superstore_sales
GROUP BY Order_Year, Order_Month_Number
ORDER BY Order_Year, Order_Month_Number;

-- Q4: Revenue contribution by customer segment(Customer segment performance)

SELECT 
Segment,
SUM(Sales) AS Total_Revenue,
COUNT(DISTINCT Customer_ID) AS Customer_Count,
SUM(Sales) / COUNT(DISTINCT Customer_ID) AS Revenue_Per_Customer
FROM superstore_sales
GROUP BY Segment
ORDER BY Total_Revenue DESC;

-- Q5: High sales but loss-making states

SELECT 
State,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM superstore_sales
GROUP BY State
HAVING SUM(Profit) < 0
ORDER BY Total_Sales DESC;

-- Q6: Impact of discount levels on profitability

SELECT 
CASE 
    WHEN Discount = 0 THEN 'No Discount'
    WHEN Discount <= 0.2 THEN 'Low (0-20%)'
    WHEN Discount <= 0.4 THEN 'Medium (21-40%)'
    ELSE 'High (40%+)'
END AS Discount_Band,
AVG(Profit) AS Avg_Profit,
COUNT(*) AS Order_Count
FROM superstore_sales
GROUP BY 
CASE 
   WHEN Discount = 0 THEN 'No Discount'
   WHEN Discount <= 0.2 THEN 'Low (0-20%)'
   WHEN Discount <= 0.4 THEN 'Medium (21-40%)'
   ELSE 'High (40%+)'
END
ORDER BY Avg_Profit DESC;

-- Q7: Top 10 customers by revenue

SELECT TOP 10
Customer_Name,
Segment,
SUM(Sales) AS Total_Revenue,
COUNT(DISTINCT Order_ID) AS Total_Orders
FROM superstore_sales
GROUP BY Customer_Name, Segment
ORDER BY Total_Revenue DESC;

