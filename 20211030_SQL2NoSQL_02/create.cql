-- Create the tables needed for the Banking
-- SQL2NoSQL blog

use sql2nosql02;

create table financial_institution (
    id uuid,
    name text,
    primary key(id)
);

create table customers (
    id uuid,
    financial_institution_id uuid,
    name text,
    primary key(id)
);