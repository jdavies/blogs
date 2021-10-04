use graphql;

drop table customers;
drop table orders;

-- NOTE: Customer indexes are automatically dropped when their associated
-- tables are dropped.