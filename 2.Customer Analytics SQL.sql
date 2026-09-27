-- Case 2: Customer Analytics

-- 1 How many unique customers did Olist have during the available period?=
select count(distinct(customer_unique_id)) as Unique_customer from olist_customers;

-- 2 How many customers placed more than one order?
WITH CustomerOrders AS
(
    select  customer_unique_id , count(distinct(order_id)) as order_count from olist_customers oc
join olist_orders oo
on oc.customer_id = oo.customer_id
group by customer_unique_id 
having count(distinct(order_id))  > 1
)
SELECT COUNT(*) AS Repeat_Customers
FROM CustomerOrders;

-- 3 Which customers generated the highest total sales value on Olist?

select top 10  -- top 10 use here not LIMIT bcz we used sql server not my sql
customer_unique_id as customers, round(sum(price),2) as Total_customer_sale 
from olist_order_items oi
join olist_orders oo
on oi.order_id = oo.order_id
join olist_customers oc
on oo.customer_id = oc.customer_id
group by customer_unique_id
order by Total_customer_sale desc 

