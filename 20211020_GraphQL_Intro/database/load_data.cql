-- load_data.cql
-- Load sample data into the tables
use graphql;

insert into customers(customer_id, name) values (1, 'John Doe');
insert into orders(order_id, customer_id, order_date) values (1, 1, '2021-10-15T13:00:00.000');
insert into orders(order_id, customer_id, order_date) values (2, 1, '2021-10-16T08:16:27.123');