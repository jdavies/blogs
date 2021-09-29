create keyspace if not exists sql2nosql01;

use sql2nosql01;

create type line_item (
    product_id int,
    product_name text,
    quantity int,
    unit_price double
);

create table customer_order (
    customer_id int,
    customer_name text,
    order_id int,
    order_status text,
    line_items frozen<list<line_item>>,
    total_price double,
    order_date timestamp,
    PRIMARY KEY(customer_id, order_date)
) WITH CLUSTERING ORDER BY (order_date DESC);


create table order_by_id (
    customer_id int,
    customer_name text,
    order_id int,
    order_status text,
    line_items frozen<list<line_item>>,
    total_price double,
    order_date timestamp,
    PRIMARY KEY(order_id)
);


create table product_sales (
    product_id int,
    product_name text,
    order_id int,
    quantity int,
    unit_price double,
    order_date timestamp,
    PRIMARY KEY((product_id), order_date)
);

drop index if exists customer_order_status_idx;
CREATE CUSTOM INDEX customer_order_status_idx on 
   customer_order(order_status) using 'StorageAttachedIndex';

-- *************** LINT **********************
-- drop index if exists order_product_idx;
-- CREATE CUSTOM INDEX order_product_idx on 
--    order_by_id(full(line_items)) using 'StorageAttachedIndex';
