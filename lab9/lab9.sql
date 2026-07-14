USE BankingDB;

SELECT *
FROM Transactions
WHERE Amount >
(
    SELECT AVG(Amount)
    FROM Transactions
);

SELECT
    AccountID,
    AccountType,
    Balance,
    CustomerID
FROM Accounts
WHERE AccountID IN
(
    SELECT AccountID
    FROM Transactions
    WHERE TransactionType = 'Deposit'
);