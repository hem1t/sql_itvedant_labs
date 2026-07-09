USE BankingDB;

SELECT * FROM Customers;
DESC Loans;
TRUNCATE Loans;
ALTER TABLE Loans MODIFY LoanID INT PRIMARY KEY AUTO_INCREMENT;

INSERT INTO Loans(LoanAmount, InterestRate, CustomerID) VALUES
(20023.00, 12.5, 101),
(20023.00, 12.5, 105),
(50023.00, 12.5, 108),
(50023.00, 12.5, 103),
(110023.00, 12.5, 109),
(110023.00, 12.5, 111),
(110023.00, 12.5, 114),
(18900.00, 12.5, 114),
(34990.00, 12.5, 105),
(34990.00, 12.5, 107),
(34990.00, 12.5, 110),
(20023.00, 12.5, 111);

Select
    LoanID,
    CustomerID, LoanAmount, RANK() OVER(
        ORDER BY LoanAmount DESC
    ) AS LoanRank
FROM Loans;

SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    DENSE_RANK() OVER(
        ORDER BY LoanAmount DESC
    ) AS DenseRank
FROM Loans;

SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    ROW_NUMBER() OVER(
        ORDER BY LoanAmount DESC
    ) AS RowNumber
FROM Loans;

SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    ROW_NUMBER() OVER(
        PARTITION BY CustomerID
        ORDER BY LoanAmount DESC
    ) AS RowNum
FROM Loans;

SELECT
    LoanID, CustomerID,LoanAmount,
    SUM(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS RunningTotal
FROM Loans;

SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    LAG(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS PreviousLoanAmount
FROM Loans;

SELECT
    LoanID, CustomerID, LoanAmount,
    LEAD(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS NextLoanAmount
FROM Loans;