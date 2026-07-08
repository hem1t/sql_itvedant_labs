USE BankingDB;

--== STRING FUNCTIONS
SELECT
    FirstName,
    UPPER(FirstName) AS UpperCaseName,
    LOWER(FirstName) AS LowerCaseName,
    LENGTH(FirstName) AS NameLength,
    LEFT(FirstName,3) AS Initials,
    CONCAT(FirstName,' - ',LastName) AS FullName
FROM Customers;



--== MATH FUNCTIONS
SET @Val = -1256.715;

SELECT
    @Val as 'A Value',
    ROUND(@Val, 2) AS 'Rounded Value',
    CEIL(@Val) AS 'Ceiling Value',
    FLOOR(@Val) AS 'Floor Value',
    ABS(@Val) AS 'Absolute Value',
    MOD(@Val, 5) AS 'Value % 5';



--== DATE FUNCTIONS
SELECT
    CURDATE() AS "Today",
    NOW() AS "NOW";

SELECT 
    DateOfBirth,
    YEAR(DateOfBirth) AS BirthYear,
    MONTH(DateOfBirth) AS BirthMonth,
    DATEDIFF(CURDATE(), DateOfBirth) AS "Days passed since Birth"
FROM Customers;


--== COMPARISON FUNCTIONS
SELECT
    FirstName,
    DateOfBirth,
    IF(YEAR(DateOfBirth) <= 1995,
       'Adult',
       'Young') AS Category
FROM Customers
ORDER BY Category;


-- an entry with no Phone number
UPDATE Customers
SET Phone=NULL 
WHERE CustomerID IN (101, 105, 108);
SELECT
    FirstName,
    IFNULL(Phone, 'Not Available') AS PhoneNumber
FROM Customers
ORDER BY PhoneNumber DESC;

SELECT GREATEST(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25'
) AS LatestBirthDate;

SELECT LEAST(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25'
) AS EarliestBirthDate;

SELECT
    FirstName,
    NULLIF(FirstName,'Rahul') AS Result
FROM Customers;


-- Using Aggregate function to summarize data.
SELECT 
    SUM(Balance) AS 'TOTAL',
    AVG(Balance) AS 'MEAN',
    MAX(Balance) AS 'MAX',
    MIN(Balance) AS 'MIN',
    COUNT(*) AS '# of Accounts'
FROM Accounts;

-- Account wise performance
-- Total balance divided by AccountType
SELECT 
    AccountType,
    SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY AccountType;

-- Now only account types where Balance are higher than 25000
SELECT 
    AccountType,
    SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY AccountType
HAVING SUM(Balance) > 75000;
