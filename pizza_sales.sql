create database Pizza;

use  Pizza;

Select *  from pizza.pizza_sales;

-- A. KPI

-- 1. Toatl Revenue
Select Round(Sum(pizza_sales.total_price),3) as Total_Revenue 
from pizza.pizza_sales;

-- 2. Average Order Value 
Select sum(total_price)/count(distinct(order_id)) as Average_Order_Value
from pizza.pizza_sales;

-- 3. Total Pizza Sold
select sum(quantity) as Total_Pizza_Sold
from pizza.pizza_sales;

-- 4. Toatl Orders 
Select Count(distinct(order_id)) as Total_Order
from pizza.pizza_sales;

-- 5. Average Pizza per Order
SELECT ROUND(SUM(quantity) / COUNT(DISTINCT order_id), 2) AS Avg_Pizzas_Per_Order
FROM pizza.pizza_sales;

-- B. Daily Trend for Total Orders
 Select dayname(order_date) as Order_Date, Count(distinct order_id) as Total_Orders
 from pizza.pizza_sales
 group by dayname(order_date)
 order by Total_Orders Desc;

-- C. Monthly Trend for Orders
Select monthname(order_date) as Order_Months, Count(distinct order_id) as Total_Orders
from pizza.pizza_sales
group by Order_Months
order by Total_Orders desc;

-- D. % of Sales by Pizza Category
SELECT pizza_category, 
    ROUND(SUM(total_price), 2) AS Total_Sales, 
    ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza.pizza_sales), 2) AS Percent_Total_Sales
FROM pizza.pizza_sales 
GROUP BY pizza_category
order by Percent_Total_Sales desc;

-- E. % of Sales by Pizza Size
SELECT pizza_size, 
    ROUND(SUM(total_price), 2) AS Total_Sales, 
    ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza.pizza_sales), 2) AS Percent_Total_Sales
FROM pizza.pizza_sales 
GROUP BY pizza_size
order by Percent_Total_Sales desc;

-- F. Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

-- G. Top 5 Pizzas by Revenue
select pizza_name, Sum(total_price) as Total_Rev
from pizza.pizza_sales
group by pizza_name
order by Total_Rev desc
limit 5;

-- H. Bottom 5 Pizzas by Revenue
select pizza_name, Sum(total_price) as Total_Rev
from pizza.pizza_sales
group by pizza_name
order by Total_Rev
limit 5;

-- I. Top 5 Pizzas by Quantity
select pizza_name, Sum(quantity) as Total_Qty
from pizza.pizza_sales
group by pizza_name
order by Total_Qty desc
limit 5;

-- J. Bottom 5 Pizzas by Quantity
select pizza_name, Sum(quantity) as Total_Qty
from pizza.pizza_sales
group by pizza_name
order by Total_Qty 
limit 5;

-- K. Top 5 Pizzas by Total Orders
select pizza_name, count(distinct order_id) as Total_Orders
from pizza.pizza_sales
group by pizza_name
order by  Total_Orders desc
limit 5;

-- L. Borrom 5 Pizzas by Total Orders
select pizza_name, count(distinct order_id) as Total_Orders
from pizza.pizza_sales
group by pizza_name
order by  Total_Orders 
limit 5;

