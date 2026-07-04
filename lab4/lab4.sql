USE BankingDB;

--== VIEWING ENTIRE TABLE ==--
SELECT * FROM Customers;

--== VIEWING SELECTED COLUMNS ==--
SELECT FirstName, LastName, Email, Phone
FROM Customers;

-- Activity 1 --
SELECT AccountID, AccountType, Balance
FROM Accounts;

--== VIEWING WITH CONDITIONS ==--
SELECT *
FROM Accounts
WHERE AccountType = 'Savings';

SELECT *
FROM Accounts
WHERE Balance > 25000;

SELECT *
FROM Transactions
WHERE Amount BETWEEN 5000 AND 20000;

SELECT *
FROM Customers
WHERE CustomerID IN (101,102,103);

SELECT *
FROM Customers
WHERE FirstName LIKE 'R%';

-- Activity 2 --
SELECT *
FROM Accounts
WHERE AccountType = 'Current';

SELECT *
FROM Accounts
WHERE Balance < 15000;

SELECT *
FROM Transactions
WHERE Amount BETWEEN 1000 AND 10000;

SELECT *
FROM Customers
WHERE CustomerID IN (104, 105);

SELECT *
FROM Customers
WHERE LastName LIKE "S%";

--== SORTING BY A COLUMN ==--
SELECT *
FROM Customers
ORDER BY FirstName ASC;

SELECT AccountID, Balance
FROM Accounts
ORDER BY Balance DESC;

SELECT DISTINCT AccountType
FROM Accounts;

SELECT AccountID, Balance
FROM Accounts
ORDER BY Balance DESC
LIMIT 3;

SELECT TransactionID, Amount, TransactionType
FROM Transactions
LIMIT 5 OFFSET 2;

-- Activity 3 --
SELECT CustomerID, FirstName, LastName
FROM Customers
ORDER BY LastName;

SELECT TransactionID, Amount
FROM Transactions
ORDER BY Amount DESC
LIMIT 5;

SELECT DISTINCT TransactionType
FROM Transactions;

SELECT TransactionID, Amount
FROM Transactions
LIMIT 4 OFFSET 3;

--== NULL Conditions ==--
SELECT *
FROM Customers
WHERE Phone IS NULL;

SELECT *
FROM Customers
WHERE Email IS NOT NULL;

--== COLUMN WITH CONDITIONAL VALUES ==--
SELECT AccountID,
       Balance,
       CASE
           WHEN Balance >= 40000 THEN 'Premium Account'
           WHEN Balance >= 20000 THEN 'Standard Account'
           ELSE 'Basic Account'
       END AS AccountCategory
FROM Accounts;

SELECT TransactionID,
       Amount,
       CASE
           WHEN Amount >= 10000 THEN 'High Amount'
           WHEN Amount >= 1000 THEN 'Medium Amount'
           ELSE 'Low Amount'
       END AS AmountCategory
FROM Transactions;

--== WINDOWING VALUES ==--
SELECT AccountID,
       Balance,
       RANK() OVER (ORDER BY Balance DESC) AS BalanceRank
FROM Accounts;

SELECT TransactionID,
       Amount,
       SUM(Amount) OVER (ORDER BY TransactionDate) AS RunningTotal
FROM Transactions;

SELECT TransactionID,
       Amount,
       AVG(Amount) OVER () AS AverageTransaction
FROM Transactions;

-- Activity 4 --
SELECT CustomerID, Balance,
RANK() OVER (ORDER BY Balance DESC) AS BalanceRank
FROM Accounts;

SELECT CustomerID, Balance,
SUM(Balance) OVER (ORDER BY AccountID) AS TotalCustomerBalance
FROM Accounts;

SELECT TransactionID, Amount,
MAX(Amount) OVER () AS GreatestAmount
FROM Transactions;