USE BankingDB;

--== INSERTING
INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(101,'Rahul','Sharma','rahul@gmail.com','9816543210','1998-04-29'),
(102,'Vinay','Mishra','vinay@gmail.com','9826543210','1999-01-20'),
(103,'Googly','Vishwa','goog@gmail.com','9836543210','1996-12-01'),
(104,'Mira','Kalva','mira@gmail.com','9876513210','1995-08-09'),
(105,'Govind','Sharma','govind@gmail.com','2876543210','1998-09-15'),
(106,'Bunty','Singh','bunty@gmail.com','9874543210','1998-03-05'),
(107,'Kajal','Yadav','kajal@gmail.com','9877543210','1995-05-16'),
(108,'Vikas','Maurya','vikas@gmail.com','9886543210','1999-11-19'),
(109,'Raju','Yadav','raju@gmail.com','9876503210','1995-04-21'),
(110,'Udit','Nair','udit@gmail.com','9876548210','1996-10-30'),
(111,'Gauri','Kalva','gauri@gmail.com','9890543210','1997-06-13'),
(112,'Belos','Market','belos@gmail.com','9906543210','1998-08-10'),
(113,'Guddu','Pandey','guddu@gmail.com','9871243210','1999-09-19'),
(114,'Gandi','Thario','gandi@gmail.com','9878743210','1998-01-25'),
(115,'Salman','Footpath','salu@gmail.com','9879143210','2000-02-27');

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201,101,'Income',25000),
(202,102,'Current',25000),
(203,103,'Savings',25000),
(204,104,'Income',25000),
(205,105,'Savings',25000),
(206,106,'Current',25000),
(207,107,'Savings',25000),
(208,108,'Income',25000),
(209,109,'Income',25000),
(210,110,'Savings',25000),
(211,111,'Current',25000),
(212,112,'Savings',25000),
(213,113,'Current',25000),
(214,114,'Income',25000),
(215,115,'Current',25000);

INSERT INTO Transactions VALUES
(301, "2010-05-21", 59.90, "Deposit", 201),
(302, "2011-06-29", 170.45, "Withdraw", 211),
(303, "2012-09-12", 150.89, "Withdraw", 208),
(304, "2010-10-15", 180.99, "Deposit", 215),
(305, "2012-05-12", 150.00, "Withdraw", 209),
(306, "2011-03-10", 280.05, "Withdraw", 201),
(307, "2011-01-08", 150.70, "Deposit", 210),
(308, "2011-02-05", 190.18, "Withdraw", 205),
(309, "2012-07-30", 450.00, "Deposit", 206),
(310, "2012-08-29", 150.00, "Withdraw", 203),
(311, "2012-12-25", 250.90, "Deposit", 202),
(312, "2010-11-18", 50.09, "Withdraw", 209),
(313, "2010-01-24", 850.50, "Deposit", 202);


--+++ UPDATING VALUES
SET SQL_SAFE_UPDATES=0;

---- changing phone number
UPDATE Customers
SET Phone="9090909090"
WHERE CustomerID = 101;

UPDATE Customers
SET Email = 'rahul.sharma@gmail.com'
WHERE CustomerID = 101;

SELECT * FROM Customers
WHERE CustomerID = 101;

--=== DELETING DATA
DELETE FROM Transactions
WHERE TransactionID = 302;

SELECT * FROM Transactions;

-- Transaction 302 was for Account 211
-- else deletion will not work.
DELETE FROM Accounts
WHERE AccountID = 211;

SELECT * FROM Accounts;