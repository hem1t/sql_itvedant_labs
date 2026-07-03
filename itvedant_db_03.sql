use itvedant;

-- Display employee details along with total number of employees
SELECT *, COUNT(emp_id) OVER() AS TotalEmp FROM EmpInfo;

-- String functions
SET @sample = "Database   ";
SELECT 
    @sample,
    LEFT(@sample, 4),
    RIGHT(TRIM(@sample), 4),
    LENGTH(@sample),
    LENGTH(TRIM(@sample)),
    SUBSTRING(@sample, 2, 5),
    REPLACE(@sample, 'Data', 'Meta'),
    REVERSE(LOWER(@sample));
    
select round(45.546, 3), round(45.546, 2), round(45.546, 1), round(45.546, 0), round(45.546, -1), round(45.546, -2), round(45.546, -3);
select round(555, -3), round(555, -4);