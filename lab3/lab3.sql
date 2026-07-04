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
(201,101,'Income',9000),
(202,102,'Current',10540),
(203,103,'Savings',2500),
(204,104,'Income',25000),
(205,105,'Savings',30000),
(206,106,'Current',5900),
(207,107,'Savings',9099),
(208,108,'Income',10200),
(209,109,'Income',14000),
(210,110,'Savings',17000),
(211,111,'Current',28000),
(212,112,'Savings',19000),
(213,113,'Current',30500),
(214,114,'Income',2522),
(215,115,'Current',40590);


INSERT INTO Transactions VALUES
(301, "2010-05-21", 159.90, "Deposit", 201),
(302, "2011-06-29", 2170.45, "Withdraw", 211),
(303, "2012-09-12", 1150.89, "Withdraw", 208),
(304, "2010-10-15", 11180.99, "Deposit", 215),
(305, "2012-05-12", 12150.00, "Withdraw", 209),
(306, "2011-03-10", 2280.05, "Withdraw", 201),
(307, "2011-01-08", 8150.70, "Deposit", 210),
(308, "2011-02-05", 9190.18, "Withdraw", 205),
(309, "2012-07-30", 10450.00, "Deposit", 206),
(310, "2012-08-29", 11150.00, "Withdraw", 203),
(311, "2012-12-25", 23250.90, "Deposit", 202),
(312, "2010-11-18", 1850.09, "Withdraw", 209),
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