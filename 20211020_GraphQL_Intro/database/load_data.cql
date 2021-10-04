-- load_data.cql
-- Load samle data into the tables

insert into customer(customer_id, name) values (1, 'John Doe');

insert into orders(order_id, customer_id, order_date) values (1, 1, '2021-10-15T13:00:00.00');