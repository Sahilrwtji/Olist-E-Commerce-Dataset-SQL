-- Case 3 Product & Seller

-- 1.Which sellers generated the highest total sales for Olist?
select top 10
seller_id , round(sum(price),2) as total_sales
from olist_order_items
group by seller_id
order by total_sales desc;

-- 2.Which individual products generated the highest total sales for Olist?
select top 10
product_id , round(sum(price),2) as total_sales
from olist_order_items
group by product_id
order by total_sales desc;
