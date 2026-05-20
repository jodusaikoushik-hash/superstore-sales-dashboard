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

-- Note: Order_Year and Order_Month_Number are derived columns 
-- added during Excel cleaning (extracted from Order_Date column).
-- If running on raw data, replace with YEAR(Order_Date) 
-- and MONTH(Order_Date) respectively.

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

WITH Discount_Bands AS (
    SELECT 
        CASE 
            WHEN Discount = 0     THEN '1. No Discount'
            WHEN Discount <= 0.2  THEN '2. Low (0-20%)'
            WHEN Discount <= 0.4  THEN '3. Medium (21-40%)'
            ELSE                       '4. High (40%+)'
        END AS Discount_Band,
        Profit,
        Sales
    FROM superstore_sales
)
SELECT 
    Discount_Band,
    ROUND(AVG(Profit), 2)           AS Avg_Profit,
    ROUND(AVG(Profit/Sales)*100, 2) AS Avg_Margin_Pct,
    COUNT(*)                         AS Order_Count
FROM Discount_Bands
GROUP BY Discount_Band
ORDER BY Discount_Band;

-- Q7: Top 10 customers by revenue

SELECT TOP 10
Customer_Name,
Segment,
SUM(Sales) AS Total_Revenue,
COUNT(DISTINCT Order_ID) AS Total_Orders
FROM superstore_sales
GROUP BY Customer_Name, Segment
ORDER BY Total_Revenue DESC;

-- Q8: What percentage of total revenue do the Top 10 customers contribute?

WITH Top10 AS (
    SELECT TOP 10 
        Customer_Name, 
        SUM(Sales) AS Customer_Revenue
    FROM superstore_sales
    GROUP BY Customer_Name
    ORDER BY Customer_Revenue DESC
),
Total AS (
    SELECT SUM(Sales) AS Total_Revenue 
    FROM superstore_sales
)
SELECT 
    ROUND(SUM(t.Customer_Revenue) / tot.Total_Revenue * 100, 2) 
    AS Top10_Revenue_Pct
FROM Top10 t
CROSS JOIN Total tot
GROUP BY tot.Total_Revenue;
