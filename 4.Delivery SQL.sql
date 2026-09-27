-- Case 4 Delivery

-- 1.What is the average number of days Olist took to deliver an order to the customer?
select Avg(DATEDIFF(day,order_purchase_timestamp,order_delivered_customer_date)) as AVG_days_delivery
from olist_orders
where order_purchase_timestamp is not null
and order_delivered_customer_date is not null

-- 2.What percentage of delivered orders were delivered later than the estimated delivery date? 
select 
sum(case when order_delivered_customer_date > order_estimated_delivery_date then 1
else 0
end) * 100.00 / count(order_delivered_customer_date)  as Late_delivery
from olist_orders
WHERE order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL;

-- 3.Which customer state had the highest late-delivery percentage?
select oc.customer_state, sum(case when oo.order_delivered_customer_date > oo.order_estimated_delivery_date then 1
else 0
end) * 100.00 / count(oo.order_delivered_customer_date)  as Late_delivery 
from olist_orders oo
join olist_customers oc
on oo.customer_id = oc.customer_id
WHERE order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL
group by customer_state
order by Late_delivery desc;
