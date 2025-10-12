#Import the dataset and do usual exploratory  analysis steps like checking the Structure & characteristics of the dataset:
#Data type of all columns in the "customers" table.
#Get the time range between which the orders were placed
#Count the Cities & States of customers who ordered during the given period

SELECT * 
FROM SQL_PROJECT_1.customers
LIMIT 10;



SELECT *
FROM `SQL_PROJECT_1.geolocation`
LIMIT 10;

#Get the time range between which the orders were placed
SELECT  
  min(date(order_purchase_timestamp)) as start_time,
  max(date(order_purchase_timestamp)) as end_time,
  date_diff(max(date(order_purchase_timestamp)),min(date(order_purchase_timestamp)), DAY) as Days_between
FROM SQL_PROJECT_1.orders;

#display the Cities & States of customers who ordered during the given period


SELECT
  c.customer_city,
  c.customer_state,
FROM SQL_PROJECT_1.orders as o
JOIN SQL_PROJECT_1.customers as c
ON o.customer_id = c.customer_id
WHERE EXTRACT(YEAR FROM o.order_purchase_timestamp) = 2018
AND EXTRACT(MONTH FROM o.order_purchase_timestamp) BETWEEN 1 AND 3;


#Count the Cities & States of customers who ordered during the given period year 2018 and month jan-march;
SELECT
  c.customer_city,
  c.customer_state,
  EXTRACT(YEAR from o.order_purchase_timestamp) as YEAR,
  EXTRACT(MONTH FROM o.order_purchase_timestamp) as MONTH,
  count(*) as total_orders
FROM SQL_PROJECT_1.orders as o
JOIN SQL_PROJECT_1.customers as c
ON o.customer_id = c.customer_id
WHERE EXTRACT(YEAR FROM o.order_purchase_timestamp) = 2018
AND EXTRACT(MONTH FROM o.order_purchase_timestamp) BETWEEN 1 AND 3
GROUP BY 1,2,3,4
ORDER BY count(c.customer_state) DESC;

#How many distinct cities and distinct states had at least one order in Jan–Mar 2018
SELECT
  COUNT(DISTINCT c.customer_city) as total_cities,
  COUNT(DISTINCT c.customer_state) as total_state,
FROM SQL_PROJECT_1.orders as o
JOIN SQL_PROJECT_1.customers as c
ON o.customer_id = c.customer_id
WHERE EXTRACT(YEAR FROM o.order_purchase_timestamp) = 2018
AND EXTRACT(MONTH FROM o.order_purchase_timestamp) BETWEEN 1 AND 3;

#Is there a growing trend In the no. of orders placed over the past years?
#Can we see some kind of monthly seasonality in terms of the no. of orders being placed?
SELECT
  extract(month from order_purchase_timestamp) as month,
  count(order_id) as order_no
FROM SQL_PROJECT_1.orders
GROUP BY 1
ORDER BY order_no DESC;

#During what time of the day, do the Brazilian customers mostly place their orders? (Dawn, Morning, Afternoon or Night)
#0-6 hrs : Dawn
#7-12 hrs : Mornings
#13-18 hrs : Afternoon
#19-23 hrs : Night

SELECT
  extract(hour from order_purchase_timestamp) as time,
  count(order_id) as order_no,
CASE
  WHEN extract(hour from order_purchase_timestamp) BETWEEN 0 AND 6 THEN 'DAWN'
  WHEN extract(hour from order_purchase_timestamp) BETWEEN 7 AND 12 THEN 'MORNING'
  WHEN extract(hour from order_purchase_timestamp) BETWEEN 13 AND 18 THEN 'EVENING'
  ELSE 'NIGHT'
END AS Time_period
FROM SQL_PROJECT_1.orders
GROUP BY time,Time_period
ORDER BY order_no DESC; 

#Get the month on month no.of orders placed
SELECT 
  EXTRACT(MONTH FROM order_purchase_timestamp) as month,
  EXTRACT(YEAR FROM order_purchase_timestamp) as year,
  count(order_id)as total_order
FROM SQL_PROJECT_1.orders
GROUP BY month,year
ORDER BY year,month;

#Get the month on month no.of orders placed in each state
SELECT
  c.customer_state,
  EXTRACT(MONTH FROM order_purchase_timestamp) AS order_month,
  EXTRACT(YEAR  FROM order_purchase_timestamp) AS order_year,
  -- Create a string like 9-2016
  CONCAT(
    CAST(EXTRACT(MONTH FROM order_purchase_timestamp) AS STRING),
    '-',
    CAST(EXTRACT(YEAR  FROM order_purchase_timestamp) AS STRING)
  ) AS month_year,
  COUNT(order_id) AS total_order
FROM SQL_PROJECT_1.orders as o
JOIN SQL_PROJECT_1.customers as c
ON o.customer_id = c.customer_id
GROUP BY 1,2,3,4
ORDER BY 3 ASC, 2 ASC;

#How are the customers distributed across all the states?
SELECT
  customer_city,
  customer_state,
  count(DISTINCT customer_id) as total_customer
FROM SQL_PROJECT_1.customers
GROUP BY customer_state,customer_city
ORDER BY customer_state, total_customer DESC;

#Get the % increase in the cost of orders from year 2017 to 2018
#(include months between Jan to Aug only).
#You can use the "payment_value" column in the payments table to #get

#STEP -1 : APPLYING JOIN ON PAYMENT AND ORDER TABLE
#STEP -2 : CALCULATE TOTAL PAYMENT PER YEAR
WITH yearly_totals AS(
SELECT
  EXTRACT(YEAR FROM o.order_purchase_timestamp) as Year,
  sum(p.payment_value) as Total_payment
FROM SQL_PROJECT_1.payments as p
JOIN SQL_PROJECT_1.orders as o
ON p.order_id = o.order_id
WHERE 
EXTRACT(YEAR FROM o.order_purchase_timestamp) IN(2017,2018) AND
EXTRACT(MONTH FROM o.order_purchase_timestamp) BETWEEN 1 AND 8
GROUP BY Year),
#STEP -3 : USE LEAD WINDOW FUNCTION TO COMPARE EACH YEAR PAYMENT WITH PREVIOUS YEAR
yearly_comparision AS(
SELECT
  Year,
  Total_payment,
  LEAD(Total_payment) over(order by Year desc) as prev_year_payment 
FROM yearly_totals)
#STEP -4 : CALCULATE % INCREASE 
SELECT *,
ROUND(((Total_payment  - prev_year_payment)/prev_year_payment) * 100,2) as perc_Increase
FROM yearly_comparision;

#Calculate the Total & Average value of order price for each #state.
SELECT 
  c.customer_state,
  COUNT(c.customer_id) as cust_count,
  sum(oi.price) as Total_price,
  AVG(oi.price) as Avg_price
FROM `SQL_PROJECT_1.orders` as o
JOIN `SQL_PROJECT_1.order_items` as oi
ON o.order_id = oi.order_id
JOIN `SQL_PROJECT_1.customers`as c
ON o.customer_id = c.customer_id
GROUP BY c.customer_state;

#Calculate the Total & Average value of order freight for each #state
SELECT 
  c.customer_state,
  COUNT(c.customer_id) as cust_count,
  sum(oi.price) as Total_price,
  AVG(oi.price) as Avg_price,
  SUM(oi.freight_value) as Total_shipping_cost,
  AVG(oi.freight_value) as Avg_shipping_cost
FROM `SQL_PROJECT_1.orders` as o
JOIN `SQL_PROJECT_1.order_items` as oi
ON o.order_id = oi.order_id
JOIN `SQL_PROJECT_1.customers`as c
ON o.customer_id = c.customer_id
GROUP BY c.customer_state;


#calculate days between purchasing, delivery and estimated delivery
SELECT
  order_id,
  EXTRACT(DATE from order_purchase_timestamp) as purchasing,
  EXTRACT(DATE FROM order_delivered_customer_date) as delivery,
  EXTRACT(DATE from order_estimated_delivery_date)  as estimated_delivery,
  date_diff(DATE (order_delivered_customer_date),DATE(order_purchase_timestamp),DAY) as time_to_deliver,
  date_diff(DATE (order_delivered_customer_date),DATE(order_estimated_delivery_date),DAY) as diff_estimated_delivery
FROM `SQL_PROJECT_1.orders`;

#Find out the top 5 states with the highest & lowest average freight value.
#top -5 heighest AVG_Freight
SELECT
  c.customer_state,
  AVG(oi.freight_value) as AVG_Freight
FROM `SQL_PROJECT_1.orders` as o
JOIN `SQL_PROJECT_1.order_items` as oi
ON o.order_id = oi.order_id
JOIN `SQL_PROJECT_1.customers` as c
ON o.customer_id = c.customer_id
GROUP BY 1
ORDER BY AVG_Freight DESC
Limit 5;

#Top -5 lowest AVG_Freight
SELECT
  c.customer_state,
  AVG(oi.freight_value) as AVG_Freight
FROM `SQL_PROJECT_1.orders` as o
JOIN `SQL_PROJECT_1.order_items` as oi
ON o.order_id = oi.order_id
JOIN `SQL_PROJECT_1.customers` as c
ON o.customer_id = c.customer_id
GROUP BY 1
ORDER BY AVG_Freight ASC
Limit 5;

#Doing Same with the help of rank
WITH state_avg AS (
  SELECT
    c.customer_state,
    AVG(oi.freight_value) AS avg_freight
  FROM `SQL_PROJECT_1.orders` AS o
  JOIN `SQL_PROJECT_1.order_items` AS oi
    ON o.order_id = oi.order_id
  JOIN `SQL_PROJECT_1.customers` AS c
    ON o.customer_id = c.customer_id
  GROUP BY c.customer_state
),
Ranked as(
SELECT
  customer_state,
  avg_freight,
  DENSE_RANK() OVER (ORDER BY avg_freight DESC) AS rank_desc,
  DENSE_RANK() OVER (ORDER BY avg_freight ASC)  AS rank_asc
FROM state_avg)
SELECT
  customer_state,
  AVG_Freight,
  -- rank_desc,
  -- rank_asc,
  CASE
  WHEN rank_desc <=5 THEN 'TOP-5'
  WHEN rank_asc <=5 THEN 'Bottom-5'
  END AS Category
FROM RANKED
WHERE 
  rank_desc <=5 OR rank_asc <=5
  ORDER BY AVG_Freight DESC;

#Here we get Top State with heighest AVG_Freight and Lowest AVG_Freight
WITH data AS (
  SELECT
    c.customer_state,
    AVG(oi.freight_value) AS avg_freight
  FROM `SQL_PROJECT_1.orders` AS o
  JOIN `SQL_PROJECT_1.order_items` AS oi
    ON o.order_id = oi.order_id
  JOIN `SQL_PROJECT_1.customers` AS c
    ON o.customer_id = c.customer_id
  GROUP BY c.customer_state
)
-- Highest average freight
SELECT 
  customer_state, 
  avg_freight
FROM data
QUALIFY avg_freight = MAX(avg_freight) OVER ()
UNION ALL
-- Lowest average freight
SELECT customer_state, avg_freight
FROM data
QUALIFY avg_freight = MIN(avg_freight) OVER ();

#Find out the top 5 states with the highest & lowest average delivery Time;
#TO5 -5 SLOWEST
SELECT
    c.customer_state,
     AVG(
      DATE_DIFF(
      DATE (o.order_delivered_customer_date),
      DATE (o.order_purchase_timestamp),DAY)) as avg_time_to_deliver
  FROM `SQL_PROJECT_1.orders` AS o
  JOIN `SQL_PROJECT_1.order_items` AS oi
    ON o.order_id = oi.order_id
  JOIN `SQL_PROJECT_1.customers` AS c
    ON o.customer_id = c.customer_id
  GROUP BY c.customer_state
  ORDER BY avg_time_to_deliver DESC
  LIMIT 5;
  #TOP 5 FASTEST
SELECT
    c.customer_state,
     AVG(
      DATE_DIFF(
      DATE (o.order_delivered_customer_date),
      DATE (o.order_purchase_timestamp),DAY)) as avg_time_to_deliver
  FROM `SQL_PROJECT_1.orders` AS o
  JOIN `SQL_PROJECT_1.order_items` AS oi
    ON o.order_id = oi.order_id
  JOIN `SQL_PROJECT_1.customers` AS c
    ON o.customer_id = c.customer_id
  GROUP BY c.customer_state
  ORDER BY avg_time_to_deliver ASC
  LIMIT 5;

--WITH THE HELP OF CTE AND RANK
WITH state_delivery AS(
SELECT
    c.customer_state,
     AVG(
      DATE_DIFF(
      DATE (o.order_delivered_customer_date),
      DATE (o.order_purchase_timestamp),DAY)) as avg_time_to_deliver
  FROM `SQL_PROJECT_1.orders` AS o
  JOIN `SQL_PROJECT_1.order_items` AS oi
    ON o.order_id = oi.order_id
  JOIN `SQL_PROJECT_1.customers` AS c
    ON o.customer_id = c.customer_id
  GROUP BY c.customer_state),
  Ranked as(
  SELECT
    customer_state,
    ROUND(avg_time_to_deliver,2) AS avg_delivery_days,
    DENSE_RANK() OVER(ORDER BY avg_time_to_deliver DESC) AS rank_desc,
    DENSE_RANK() over(order by avg_time_to_deliver ASC) AS rank_asc
  FROM state_delivery)
  SELECT
    customer_state,
    avg_delivery_days,
    -- rank_desc,
    -- rank_asc,
    CASE
      WHEN rank_desc <=5 THEN 'TOP-5 Slowest'
      WHEN rank_asc <=5 THEN 'Top-5 Fastest'
    END AS CATEGORY
  FROM Ranked
  WHERE 
    rank_desc <=5 OR
    rank_asc <=5
  ORDER BY avg_delivery_days ASC;

#Find out the top 5 states where the order delivery is really fast as
#compared to the estimated date of delivery.
#You can use the difference between the averages of actual & estimated
#delivery date to figure out how fast the delivery was for each state.

WITH state_delivery AS(
SELECT
    c.customer_state,
     AVG(
      DATE_DIFF(
      DATE (o.order_estimated_delivery_date),
      DATE (o.order_delivered_customer_date),DAY)) as avg_day_early
  FROM `SQL_PROJECT_1.orders` AS o
  JOIN `SQL_PROJECT_1.order_items` AS oi
    ON o.order_id = oi.order_id
  JOIN `SQL_PROJECT_1.customers` AS c
    ON o.customer_id = c.customer_id
  GROUP BY c.customer_state),
  Ranked as(
  SELECT
    customer_state,
    ROUND(avg_day_early,2) AS avg_days_early,
    DENSE_RANK() OVER(ORDER BY avg_day_early DESC) AS rank_fast
  FROM state_delivery)
  SELECT
    customer_state,
    avg_days_early AS avg_days_faster_than_estimate
  FROM Ranked
  WHERE 
    rank_fast <= 5
  ORDER BY avg_days_early DESC;

#Find the month on month no. of orders placed using different payment types.
SELECT
  p.payment_type,
  EXTRACT(MONTH from o.order_purchase_timestamp) as MONTH,
  EXTRACT(YEAR from o.order_purchase_timestamp) as YEAR,
  COUNT(DISTINCT o.order_id) as Total_order_placed
FROM `SQL_PROJECT_1.orders` as o
JOIN `SQL_PROJECT_1.payments` AS p
ON p.order_id = o.order_id
GROUP BY 1,2,3
order by 1,3,2;

#Find the no. of orders placed on the basis of the payment installments that have been paid.

SELECT
  payment_installments,
  count(DISTINCT order_id) AS Customer_count
FROM `SQL_PROJECT_1.payments`
GROUP BY 1;

