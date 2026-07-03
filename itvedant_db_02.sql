use itvedant;

alter table EmpInfo
add column department varchar(20) not null;

alter table EmpInfo
modify column emp_id INT auto_increment;

describe EmpInfo;

insert into EmpInfo(emp_name, email, salary, city, department) Values
("Sagar", "sagar@gmail.com", 9000, "Kalyan", "IT"),
("Siya", "siya@email.com", 10000, "Dombivali", "HR"),
("Mira", "mira@gmail.com", 12000, "Thane", "IT"),
("Loco", "loco@email.com", 15000, "Bhivandi", "HR"),
("Carsi", "car@gmail.com", 9000, "Kalyan", "AR"),
("Harsh", "harsh@email.com", 10000, "Kopar", "AR"),
("Baunti", "baunti@email.com", 12000, "Kalyan", "AR"),
("Shisa", "shisa@gmail.com", 15000, "Kopar", "Finance"),
("Carlos", "carlos@gmail.com", 19000, "Thane", "Finance"),
("Jyoti", "jyoti@gmail.com", 12000, "Kalyan", "Finance"),
("Jagriti", "jagriti@gmail.com", 14000, "Khopoli", "Admin"),
("Circi", "circi@email.com", 16517, "Thane", "Admin");

SELECT 
    emp_name AS Name, email, salary, city department
FROM
    EmpInfo
ORDER BY department;

SELECT 
    department, SUM(salary) AS SalarySumByDept
FROM
    EmpInfo
GROUP BY department
ORDER BY SalarySumByDept;

SELECT
	emp_name AS EmpName, department, salary,
	dense_rank() over ( order by salary DESC ) as SalaryRank,
	sum(salary) over ( partition by department) as SalaryByDept
FROM EmpInfo
ORDER BY SalaryRank;

Select 
	emp_id, emp_name AS EmpName, salary,
	row_number() Over(ORDER By Salary Desc) AS Row_Num,
	rank() Over(ORDER By Salary Desc) AS Ranks,
	dense_rank() Over(ORDER By Salary Desc) AS Dense_Ranks
From EmpInfo
ORDER BY Dense_Ranks;

select 
	upper(emp_name) AS EmpName, sqrt(salary) AS RootedSalary,
    now() AS Timeline, email, concat(lower(emp_name), "@gmail.com") as new_email,
    length(email) as email_Len
from EmpInfo;
