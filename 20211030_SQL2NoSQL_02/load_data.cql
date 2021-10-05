-- Load_Data.cql
--
-- Load some standard data into the datbase for testing.

-- Financial Institutions
insert into financial_institution (id, name) values(803df55b-3bb8-4cac-9b9b-9d148b7e7117, 'Bank of America');
insert into financial_institution (id, name) values(72431ad9-a785-4514-af8c-0280b94ea2f3, 'Wells Fargo');

-- Customers
-- John Doe at BofA
insert into customers(id, financial_institution_id, name)
values(0d554d51-add8-4693-a1e3-52b602f40132, 803df55b-3bb8-4cac-9b9b-9d148b7e7117,'John Doe');

-- John Doe (same gy as above) at Wells Fargo
insert into customers(id, financial_institution_id, name)
values(fae8a318-016e-400c-9372-b337a16a0524, 72431ad9-a785-4514-af8c-0280b94ea2f3,'John Doe');