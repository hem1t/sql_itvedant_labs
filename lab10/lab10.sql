USE BankingDB;
CREATE VIEW vw_customer_contacts
AS SELECT
    FirstName, LastName, Email, Phone
FROM Customers;

CREATE OR REPLACE VIEW vw_customer_contacts
AS SELECT
    CustomerID, FirstName, LastName, Email, Phone
FROM Customers;

SELECT * FROM vw_customer_contacts