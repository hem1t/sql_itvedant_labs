USE BankingDB;

SELECT *
FROM Customers
WHERE FirstName LIKE 'G%';

SELECT *
FROM Customers
WHERE Email LIKE '%gmail%';

SELECT *
FROM Customers
WHERE LastName LIKE '%a';

-- Activity --
SELECT *
FROM Customers
WHERE FirstName LIKE 'R%';

-- need to add one
UPDATE Customers
SET Email = "guddu@yahoo.com"
WHERE CustomerID = 113;

SELECT CustomerID, Email
FROM Customers
WHERE Email LIKE '%yahoo%';

SELECT *
FROM Customers
WHERE LastName LIKE 'P%';

-- need to add one
UPDATE Customers
SET Phone = "123456799"
WHERE CustomerID = "110";

SELECT CustomerID, FirstName, Phone
FROM Customers
WHERE Phone LIKE '%99';

-- FILTERING --
SELECT *
FROM Accounts
WHERE AccountType IN ('Savings', 'Current');

SELECT TransactionID, Amount, TransactionType
FROM Transactions
WHERE TransactionType IN ('Deposit', 'Withdraw');

SELECT *
FROM Customers
WHERE CustomerID IN (101,102,105);

-- Activity --
SELECT *
FROM Accounts
WHERE AccountType IN ('Savings', 'Income');

SELECT TransactionID, Amount, TransactionType
FROM Transactions
WHERE TransactionType IN ('Deposit', 'Payment');

SELECT *
FROM Customers
WHERE CustomerID IN (103, 104);

SELECT *
FROM Accounts
WHERE AccountID IN (203, 204);

--== SORTING
SELECT *
FROM Customers
ORDER BY LastName ASC;

SELECT *
FROM Accounts
ORDER BY Balance DESC;

SELECT *
FROM Transactions
ORDER BY TransactionDate DESC;

-- Activity 2
SELECT *
FROM Customers
ORDER BY FirstName;

SELECT *
FROM Accounts
ORDER BY AccountType;

SELECT TransactionID, Amount, TransactionType
FROM Transactions
ORDER BY Amount DESC;

SELECT CustomerID, CONCAT(FirstName, " ", LastName), DateOfBirth
FROM Customers
ORDER BY DateOfBirth;

--== LIMITING
SELECT *
FROM Accounts
ORDER BY Balance DESC
LIMIT 5;

SELECT *
FROM Customers
LIMIT 3;

SELECT *
FROM Transactions
LIMIT 5 OFFSET 3;

-- Activity 3
SELECT *
FROM Transactions
ORDER BY Amount DESC
LIMIT 3;

SELECT *
FROM Customers
LIMIT 4;

SELECT *
FROM Accounts
LIMIT 3 OFFSET 2;

SELECT *
FROM Transactions
ORDER BY TransactionDate DESC
LIMIT 5;

SELECT *
FROM Accounts
WHERE AccountType = 'Savings'
ORDER BY Balance DESC;

SELECT *
FROM Customers
WHERE FirstName LIKE 'S%'
LIMIT 5;

SELECT *
FROM Transactions
WHERE TransactionType IN ('Deposit','Withdrawal')
ORDER BY TransactionDate DESC;