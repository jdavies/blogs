-- This script will initialize the data in the database for sample queries.

-- Customer 1, order 2
BEGIN BATCH
insert into customer_order(customer_id, customer_name, order_id, order_status, line_items, total_price, order_date)
values(1, 'John Doe', 2, 'Delivered', [
    {product_id: 1, product_name: 'Widget', quantity: 2, unit_price: 30.50},
    {product_id: 2, product_name: 'WhatsIt', quantity: 1, unit_price: 39.25}
    ], 100.25, '2021-09-14 12:35:17.001');

insert into order_by_id(customer_id, customer_name, order_id, order_status, line_items, total_price, order_date)
values(1, 'John Doe', 2, 'Delivered', [
    {product_id: 1, product_name: 'Widget', quantity: 2, unit_price: 30.50},
    {product_id: 2, product_name: 'WhatsIt', quantity: 1, unit_price: 39.25}
    ], 100.25, '2021-09-14 12:35:17.001');

insert into product_sales(product_id, product_name, order_id, quantity, unit_price, order_date)
values (1, 'Widget', 2, 2, 30.50, '2021-09-14 12:35:17.001');
insert into product_sales(product_id, product_name, order_id, quantity, unit_price, order_date)
values (2, 'WhatsIt', 2, 1, 39.32, '2021-09-14 12:35:17.001');
APPLY BATCH;

-- Customer 1, order 3
BEGIN BATCH
insert into customer_order(customer_id, customer_name, order_id, order_status, line_items, total_price, order_date)
values(1, 'John Doe', 3, 'Delivered', [
    {product_id: 2, product_name: 'WhatsIt', quantity: 1, unit_price: 39.25},
    {product_id: 3, product_name: 'Gizmo', quantity: 2, unit_price: 29.99}
    ], 100.25, '2021-09-18 12:12:17.001');

insert into order_by_id(customer_id, customer_name, order_id, order_status, line_items, total_price, order_date)
values(1, 'John Doe', 3, 'Delivered', [
    {product_id: 1, product_name: 'Widget', quantity: 2, unit_price: 30.50},
    {product_id: 3, product_name: 'Gizmo', quantity: 2, unit_price: 29.99}
    ], 100.25, '2021-09-18 12:12:17.001');

insert into product_sales(product_id, product_name, order_id, quantity, unit_price, order_date)
values (1, 'Widget', 3, 2, 30.50, '2021-09-18 12:12:17.001');
insert into product_sales(product_id, product_name, order_id, quantity, unit_price, order_date)
values (3, 'Gizmo', 3, 2, 29.99, '2021-09-18 12:12:17.001');
APPLY BATCH;

-- Customer 1, order 4
BEGIN BATCH
insert into customer_order(customer_id, customer_name, order_id, order_status, line_items, total_price, order_date)
values(1, 'John Doe', 4, 'Delivered', [
    {product_id: 1, product_name: 'Widget', quantity: 2, unit_price: 30.50},
    {product_id: 2, product_name: 'WhatsIt', quantity: 1, unit_price: 39.25},
    {product_id: 3, product_name: 'Gizmo', quantity: 3, unit_price: 29.99}
    ], 100.25, '2021-09-22 10:49:17.123');

insert into order_by_id(customer_id, customer_name, order_id, order_status, line_items, total_price, order_date)
values(1, 'John Doe', 4, 'Delivered', [
    {product_id: 1, product_name: 'Widget', quantity: 2, unit_price: 30.50},
    {product_id: 2, product_name: 'WhatsIt', quantity: 1, unit_price: 39.25},
    {product_id: 3, product_name: 'Gizmo', quantity: 3, unit_price: 29.99}
    ], 100.25, '2021-09-22 10:49:17.123');

insert into product_sales(product_id, product_name, order_id, quantity, unit_price, order_date)
values (1, 'Widget', 4, 2, 30.50, '2021-09-22 10:49:17.123');
insert into product_sales(product_id, product_name, order_id, quantity, unit_price, order_date)
values (2, 'WhatsIt', 4, 1, 39.32, '2021-09-22 10:49:17.123');
insert into product_sales(product_id, product_name, order_id, quantity, unit_price, order_date)
values (3, 'Gizmo', 4, 3, 29.99, '2021-09-22 10:49:17.123');
APPLY BATCH;
