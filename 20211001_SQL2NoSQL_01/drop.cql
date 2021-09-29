-- Drop all tables in the system
use sql2nosql01;

drop table if exists customer_order;
drop table if exists order_by_id;
drop table if exists product_sales;
drop type if exists line_item;
