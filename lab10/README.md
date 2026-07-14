# LAB 10 - VIEWS

## Covered Concepts
1. Using VIEWS
2. Types of VIEWS

#### What is a SQL View?
    A virtual table created from one or more SQL queries.
    Unlike table View does not stores data but rather uses another tables to perform DQL and DML operations.
    The operations porformed using Views will be limited by their definition.

#### Creating a view
1. Using CREATE VIEW
```sql
CREATE VIEW vw_customer_contacts
AS SELECT
    FirstName, LastName, Email, Phone
FROM Customers;
```
Now, can invoke the query by the following:
```sql
SELECT * FROM vw_customer_contacts
```

2. Using CREATE OR REPLACE VIEW
Unlike create view this will also overwrite any existing view.
Let's say I want to add CustomerID to `vw_customer_contacts`.
```sql
CREATE OR REPLACE VIEW vw_customer_contacts
AS SELECT
    CustomerID, FirstName, LastName, Email, Phone
FROM Customers;
```
Now, viewing this select will provide the following: