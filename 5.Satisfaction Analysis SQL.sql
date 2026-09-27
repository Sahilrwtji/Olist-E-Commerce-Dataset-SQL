-- Case 5 Satisfaction Analysis

-- 1.What was the average customer review score for Olist orders?
select avg(review_score) as Avg_review_score from olist_order_reviews 

-- 2.How many orders received a low review score (1 or 2)? 
select count(review_score) as Low_Review from olist_order_reviews 
where review_score <= 2

-- 3.Do late deliveries lead to lower customer review scores? 
/*
| Delivery Status | Avg Review Score |
| Late            |                ? |
| On Time         |                ? | */

select 
case when oo.order_delivered_customer_date > oo.order_estimated_delivery_date 
then 'Late_deliver'else 'On_time_deliver' end as Delivery_time,
avg(ore.review_score) as Avg_review
 from olist_orders oo
 join olist_order_reviews ore
 on oo.order_id = ore.order_id
where order_delivered_customer_date is not null
and order_estimated_delivery_date is not null
group by case when oo.order_delivered_customer_date > oo.order_estimated_delivery_date 
then 'Late_deliver'else 'On_time_deliver' end;