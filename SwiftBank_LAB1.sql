create database SwiftBank;
use SwiftBank;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AccountCreationDate DATE
);

drop table Customers;
truncate table customers;

describe Customers;

alter table Customers
add DateOfBirth date;

alter table Customers
add column DateOfBirth Date after LastName;

alter table Customers
modify Phone VARCHAR(20);

alter table Customers
change column DateOfBirth DOB Date;

alter table Customers
drop column DOB;

alter table Customer
rename to customers;

describe customers;

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10 , 2 ),
    FOREIGN KEY (CustomerID)
        REFERENCES Customers (CustomerID)
);

alter table Accounts
add constraint ck_minbalance
check (Balance >= 1000);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionDate DATE,
    Amount DECIMAL(10 , 2 ),
    TransactionType VARCHAR(20),
    FOREIGN KEY (AccountID)
        REFERENCES Accounts (AccountID)
);

CREATE TABLE Branches (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches (
    AccountID INT,
    BranchID INT,
    AssignmentDate DATE,
    FOREIGN KEY (AccountID)
        REFERENCES Accounts (AccountID),
    FOREIGN KEY (BranchID)
        REFERENCES Branches (BranchID)
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    LoanAmount DECIMAL(10 , 2 ),
    InterestRate DECIMAL(5 , 2 ),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CustomerID)
        REFERENCES Customers (CustomerID)
);

truncate table loans;

describe AccountBranches;

-- adding a sample comment