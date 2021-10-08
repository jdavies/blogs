-- Load_Data.cql
--
-- Load some standard data into the datbase for testing.

-- Financial Institutions
insert into financial_institution_by_id (id, name) values(803df55b-3bb8-4cac-9b9b-9d148b7e7117, 'Bank of America');
insert into financial_institution_by_id (id, name) values(72431ad9-a785-4514-af8c-0280b94ea2f3, 'Wells Fargo');

-- 
-- Customers
-- 

-- 
-- Customer John Doe has accounts at Bank of America
--
insert into customer_by_id(id, financial_institution_id, first_name, last_name, email, password,
   phone_number, address_1, address_2, city, state, postal_code, country, status)
values(0d554d51-add8-4693-a1e3-52b602f40132, 803df55b-3bb8-4cac-9b9b-9d148b7e7117,
   'John', 'Doe', 'jdoe@datastax.com', 
   -- Hashed password is 'demo'
   '2a97516c354b68848cdbd8f54a226a0a55b21ed138e207ad6c5cbb9c00aa5aea',
   '408-555-0001',
   '100 Main Street', null, 'Santa Clara', 'CA', '95050', 'USA', 'Active');

-- Accounts for John Doe at Bank of America
insert into account_by_id(id, customer_id, name, account_type, external_account_id, created, balance)
values(0298d77c-0f4b-4423-8e8d-408d5b90d847, 0d554d51-add8-4693-a1e3-52b602f40132, 'Personal Checking',
  'Checking', null, toTimestamp(now()), 2534.15);

insert into account_by_id(id, customer_id, name, account_type, external_account_id, created, balance)
values(ef2513b0-ba0e-42cf-815a-15246b2e3014, 0d554d51-add8-4693-a1e3-52b602f40132, 'Personal Savings',
  'Savings', null, '2020-01-15T13:00:00.000', 12345.67);

-- External accounts for bill pay. External accounts do not have a balance.
insert into account_by_id(id, customer_id, name,
  account_type, external_account_id, created, balance)
values(65780208-f7a1-4196-8ffb-15844d7ead45, 0d554d51-add8-4693-a1e3-52b602f40132, 'Electrical Utility',
  'External', 'A-2345-4-15069', '2020-01-15T13:00:00.000', null);

insert into account_by_id(id, customer_id, name,
  account_type, external_account_id, created, balance)
values(9a0040d7-f265-48ad-abc1-c2129f328818, 0d554d51-add8-4693-a1e3-52b602f40132, 'Wells Fargo Mortgage',
  'External', '01-356-494-150', '2005-10-15T15:00:00.000', null);

-- 
-- John Doe (same guy as above) at Wells Fargo
--
insert into customer_by_id(id, financial_institution_id, first_name, last_name, email, password,
   phone_number, address_1, address_2, city, state, postal_code, country, status)
values(fae8a318-016e-400c-9372-b337a16a0524, 72431ad9-a785-4514-af8c-0280b94ea2f3,
   'John', 'Doe', 'jdoe@datastax.com', 
   -- Hashed password is 'demo'
   '2a97516c354b68848cdbd8f54a226a0a55b21ed138e207ad6c5cbb9c00aa5aea',
   '408-555-0001',
   '100 Main Street', null, 'Santa Clara', 'CA', '95050', 'USA', 'Active');

-- Accounts for John Doe at Wells Fargo
insert into account_by_id(id, customer_id, name,
   account_type, external_account_id, created, balance)
values(3d23b6b0-ed28-430d-8619-55849767398e, fae8a318-016e-400c-9372-b337a16a0524, 'Company Checking',
  'Checking', null, '2015-11-08T10:35:17.000', 12534.15);

insert into account_by_id(id, customer_id, name,
   account_type, external_account_id, created, balance)
values(d3a5197b-49d3-4aaa-b3f5-6a5ffce10d19, fae8a318-016e-400c-9372-b337a16a0524, 'Company Savings',
  'Savings', null, '2015-11-08T10:35:25.000', 17453.15);

insert into account_by_id(id, customer_id, name,
   account_type, external_account_id, created, balance)
values(d3a5197b-49d3-4aaa-b3f5-6a5ffce10d19, fae8a318-016e-400c-9372-b337a16a0524, 'Home Mortgage',
  'Home Mortgage', '01-356-494-150', '2015-11-08T10:35:25.000', 17453.15);