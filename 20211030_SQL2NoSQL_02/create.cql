-- Create the tables needed for the Banking
-- SQL2NoSQL blog

use sql2nosql02;

create table financial_institution_by_id (
    id uuid,
    name text,
    primary key(id)
);



create table customer_by_id (
    id uuid,
    financial_institution_id uuid,
    first_name text,
    last_name text,
    -- The email is used as the user's ID
    -- for logging in
    email text,
    -- The password is SHA256 hashed and stored here.
    password text,
    phone_number text,
    address_1 text,
    address_2 text,
    city text,
    state text,
    postal_code text,
    -- Country ISO 3166-1 alpha-3 code
    country text,
    -- Valid statuses are ACTIVE, INACTIVE
    status text,
    primary key(id)
);

-- This index is used to search for a customer by their email for the login use case.
create custom index customer_email on customer_by_id(email) using 'StorageAttachedIndex';

create table account_by_id (
    id uuid,
    customer_id uuid,
    name text,
    -- Type may be Checking, Savings, Home Loan, 
    -- External (for paying other people/bills) etc
    account_type text,
    -- Used for External account_type only.
    external_account_id text,
    created timestamp,
    balance decimal,
    PRIMARY KEY(id)
);

create custom index customer_account_uuid on account_by_id(customer_id) using 'StorageAttachedIndex';

create table transaction_by_id (
    id timeuuid,
    origin_account_id uuid,
    dest_account_id uuid,
    amount decimal,
    -- Status may be Pending or Complete (Contested?)
    status text,
    primary key (id)
);

create custom index account_transaction on transaction_by_id(origin_account_id) using 'StorageAttachedIndex';