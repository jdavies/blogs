# ReadMe.md

## Sample Queries / Use-Cases

1) Customer logs in
1) Customer wants to see a list of their active accounts
1) Customer wants to see account details
1) Customer wants to see transaction details for an account
1) Customer wants to pay a bill online

## Database Notes

Here I have note specifically about the database and table design.

### Table: account_by_id

This is a rather interesting table because the account record may define an
account at the finanical institution, or it may define an entirely external
account that is owned by some other entity (like a utility company). These
external account are used for online bill pay.

Here is the table definition for easy reference:

```cql
create table account_by_id (
    id uuid,
    customer_id uuid,
    name text,
    -- Type may be Checking, Savings, Home Mortgage, 
    -- External (for paying other people/bills) etc
    account_type text,
    -- Used for External account_type only.
    external_account_id text,
    created timestamp,
    balance decimal,
    PRIMARY KEY(id)
);
```

Here are the rules for the account_type and external_account_id fields:

1) If the ```account_type``` field is ```External``` then this account record
is a link to an external account that we are tracking for bill-pay purposes
only. It is NOT an account at the financial institution.
2) If the ```account_type``` field is ***not*** ```External```, then the
```external_account_id``` is simply a more user-friendly account number than
the UUID that is used by the database to identify the account.
