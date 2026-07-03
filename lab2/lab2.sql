USE BankingDB;

-- CREATING TABLES --
CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);

CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);


--- MODIFYING TABLES USING ALTER ---
-- adding new column
ALTER TABLE Customers
ADD DateOfBirth DATE;

-- changing column types
ALTER TABLE Customers
MODIFY Phone VARCHAR(20);

-- adding constraints
ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);

--- DELETING A TABLE ENTIRELY ---
DROP TABLE AccountBranches;

--- adding PRIMARY KEY CONSTRAINTS ---
ALTER TABLE Customers
ADD PRIMARY KEY(CustomerID);

--- adding FOREIGN KEY CONSTRAINTS ---
ALTER TABLE Accounts
ADD CustomerID INT;

ALTER TABLE Accounts
ADD CONSTRAINT fk_accounts_customer
FOREIGN KEY(CustomerID)
REFERENCES Customers(CustomerID);

--- some extra integrity ---
ALTER TABLE Customers
MODIFY FirstName VARCHAR(50) NOT NULL;

ALTER TABLE Customers
ADD CONSTRAINT unique_mail
UNIQUE (Email);


--- LOOKING UP ---
show tables;
DESCRIBE Customers;
DESCRIBE Accounts;

--== ACTIVITIES ===
-- only primary can be foreign key.
ALTER TABLE Branches
ADD CONSTRAINT pk_branches_id
PRIMARY KEY(BranchID);

ALTER TABLE Accounts
ADD BranchID INT;

ALTER TABLE Accounts
ADD CONSTRAINT fk_account_branch
FOREIGN KEY(BranchID)
REFERENCES Branches(BranchID);

ALTER TABLE Transactions
ADD AccountID INT;

ALTER TABLE Accounts
ADD CONSTRAINT pk_accounts_id
PRIMARY KEY(AccountID);

ALTER TABLE Transactions
ADD CONSTRAINT fk_transactions_accounts
FOREIGN KEY(AccountID)
REFERENCES Accounts(AccountID);

DESC Transactions;

ALTER TABLE Loans
ADD CustomerID INT;

ALTER TABLE Loans
ADD CONSTRAINT fk_loans_customers
FOREIGN KEY(CustomerID)
REFERENCES Customers(CustomerID);

DESC Loans;