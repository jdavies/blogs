-- Specify the keyspace we will use
use graphql;

-- Create the tables and indexes.
create table customers (
    customer_id int,
    name text,
    primary key(customer_id)
);

create table orders (
    order_id int,
    customer_id int,
    order_date timestamp,
    primary key (order_id)
);

create custom index customer_orders on orders(customer_id) using 'StorageAttachedIndex';


-- Now for something more complex
create table customers_uuid (
    customer_id uuid,
    name text,
    primary key(customer_id)
);

create table orders_uuid (
    order_id uuid,
    customer_id uuid,
    order_date timestamp,
    primary key (order_id)
);

create custom index customer_orders_uuid on orders_uuid(customer_id) using 'StorageAttachedIndex';
