-- Sample Queries

-- QUERY 1 - Get Recent Customer Orders
select * from customer_order where customer_id = 1 and order_date <= '2021-10-01' limit 10;
select * from customer_order where customer_id = 1 and order_date >= '2021-09-01' and order_date <= '2021-09-16' limit 10;

-- QUERY 2 - Get order details by order ID
select * from order_by_id where order_id = 2;

-- QUERY 3 - Get the number of Product X that was sold in September 2021
select * from product_sales where product_id = 1 and order_date >= '2021-09-01' and order_date < '2021-10-01';
select * from product_sales where product_id = 2 and order_date >= '2021-09-01' and order_date < '2021-10-01';
select * from product_sales where product_id = 3 and order_date >= '2021-09-01' and order_date < '2021-10-01';

select sum(quantity * unit_price), product_name 
from product_sales 
where product_id = 1 and order_date >= '2021-09-01' and order_date < '2021-10-01';
