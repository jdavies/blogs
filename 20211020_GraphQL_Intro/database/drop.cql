use graphql;

drop table customers;
drop table orders;
drop table customers_uuid;
drop table orders_uuid;

-- NOTE: Customer indexes are automatically dropped when their associated
-- tables are dropped.