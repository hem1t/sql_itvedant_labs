CREATE DATABASE ITVedant;
USE ITVedant;

set SQL_safe_updates = 0;

CREATE TABLE Student (
    stud_id INT,
    stud_name VARCHAR(50),
    Age INT,
    Email VARCHAR(50)
);

Alter table Student
add column city varchar(50);

truncate Student;

insert into Student Values
(105, 'Shubhankar', 26, 'shubh_maurya@gmail.com', "Kalyan"),
(108, 'Nilesh', 32, 'nilesh@gmail.com', "Karjat"),
(109, 'Priti', 22, 'prisss@gmail.com', "Kalyan"),
(103, 'Monty', 25, 'meesh@gmail.com', "Sahad"),
(104, 'meesho', 52, 'mintoh@gmail.com', "Kalyan");

SELECT 
    *
FROM
    Student;
    
SELECT 
    COUNT(*)
FROM
    student;

UPDATE student 
SET 
    stud_name = 'Shubham'
WHERE
    stud_name = 'Shubhankar';

-- Deleting a value
DELETE FROM student 
WHERE
    stud_id = 105;
    
SELECT 
    SUM(age), MAX(age), MIN(age), AVG(age), COUNT(age)
FROM
    student;
    
-- Operator (Assignment operator)    
SELECT 
    *
FROM
    student
WHERE
    stud_id = 106;

-- Operator (Relation operator)
--    <    <=    >    >=    <>
SELECT 
    *
FROM
    student
WHERE
    Age > 25;
SELECT 
    *
FROM
    student
WHERE
    Age <> 32;
SELECT 
    *
FROM
    student
WHERE
    Age < 32;

-- Operator (Logical operator)
-- and or not
SELECT 
    *
FROM
    student
WHERE
    Age > 25 AND Age < 50;
SELECT 
    *
FROM
    student
WHERE
    Age > 25 OR stud_id = 107;
SELECT 
    *
FROM
    student
WHERE
    NOT stud_name = 'Priti';

SELECT 
    *
FROM
    student
WHERE
    stud_id = 100 OR stud_id = 101
        OR stud_id = 102
        OR stud_id = 103;

-- Operator for defined range
SELECT 
    *
FROM
    student
WHERE
    stud_id IN (100 , 101, 102, 103, 104);

SELECT 
    *
FROM
    student
WHERE
    stud_id NOT IN (100 , 101, 102, 103, 104);


-- Table with constraints

CREATE TABLE EmployeeInfo (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(20) NOT NULL,
    email VARCHAR(40) UNIQUE,
    salary INT CHECK (salary BETWEEN 15000 AND 80000),
    city VARCHAR(20) CHECK (city IN ('Mumbai' , 'Pune', 'Nagpur', 'Nashik')),
    state VARCHAR(20) DEFAULT 'Maharashtra',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

insert into EmployeeInfo(emp_name, email, salary, city) Values
("Siddhi", "siddi@email.com", 35000, 'Mumbai'),
("James", "jubin@email.com", 29000, 'Pune');

SELECT 
    *
FROM
    EmployeeInfo;

-- Update Record --
UPDATE EmployeeInfo 
SET 
    email = 'siddhi@email.com'
WHERE
    email = 'siddi@email.com';

UPDATE EmployeeInfo 
SET 
    salary = 40000,
    city = 'Pune'
WHERE
    email = 'siddhi@email.com';

-- Remove Data/Record --
DELETE FROM EmployeeInfo 
WHERE
    email IN ('siddhi@email.com' , 'jubin@email.com');
set sql_safe_updates=0;
DELETE FROM EmployeeInfo;
truncate EmployeeInfo;

describe EmployeeInfo;

CREATE TABLE EmpInfo (
    emp_id INT,
    emp_name VARCHAR(20),
    email VARCHAR(40),
    salary INT,
    city VARCHAR(20)
);
drop table EmpInfo;

describe EmpInfo;

alter table EmpInfo
add constraint pk_id primary key(emp_id);

alter table EmpInfo
modify emp_name varchar(20) not null;

alter table EmpInfo
add constraint uk_email unique(email);

alter table EmpInfo
modify salary int check(salary between 9000 and 25000);

CREATE TABLE stud_backup (
    id INT,
    sname VARCHAR(20),
    age INT,
    email VARCHAR(40),
    city VARCHAR(20)
);
describe stud_backup;

alter table stud_backup
drop column city;

SELECT 
    *
FROM
    student;

insert into stud_backup(id, sname, age, email)
select * from student;

SELECT 
    *
FROM
    stud_backup;

INSERT INTO student(stud_id, stud_name, age, email) value
(100, "Miakka", 23, "mia@email.com");

UPDATE student
SET city = "Sahad"
Where city is null;

select * from student;

select city, Count(city) AS "Student Count"
from student
group by city;

select city, Count(city) AS "Student Count"
from student
group by city
having count(city) > 1;

select city, Count(city) AS "Student Count"
from student where age > 22
group by city
having count(city) > 1;

select * from student
where stud_name like 'M%';

-- 5 characters --
select * from student
where stud_name like '_____';

-- Atleast 6 characters --
select * from student
where stud_name like '______%';

select * from student LIMIT 5 offset 3;




