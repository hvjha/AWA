CREATE DATABASE SNOWFLAKE_CLASS_7;
USE DATABASE SNOWFLAKE_CLASS_7;

CREATE SCHEMA SNOW_C_7_SCHEMA;
USE SCHEMA SNOW_C_7_SCHEMA;

CREATE OR REPLACE TABLE Employee
(
    EmployeeId INT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    Gender VARCHAR(1) NOT NULL,
    StateCode VARCHAR(20) NOT NULL,
    Salary NUMBER(10,2) NOT NULL
);

DESCRIBE TABLE Employee;

INSERT INTO Employee (EmployeeId, EmployeeName, Gender, StateCode, Salary) VALUES
(1, 'Amit Sharma', 'M', 'UP', 45000),
(2, 'Neha Verma', 'F', 'DL', 52000),
(3, 'Rahul Singh', 'M', 'UP', 48000),
(4, 'Priya Gupta', 'F', 'MH', 60000),
(5, 'Ankit Yadav', 'M', 'UP', 42000),
(6, 'Pooja Mehta', 'F', 'GJ', 58000),
(7, 'Vikas Jain', 'M', 'RJ', 50000),
(8, 'Sneha Kapoor', 'F', 'PB', 55000),
(9, 'Rohit Mishra', 'M', 'MP', 47000),
(10, 'Kavita Singh', 'F', 'UP', 53000),

(11, 'Suresh Kumar', 'M', 'HR', 46000),
(12, 'Anjali Sharma', 'F', 'DL', 62000),
(13, 'Deepak Verma', 'M', 'UP', 49000),
(14, 'Nisha Yadav', 'F', 'BR', 51000),
(15, 'Manish Gupta', 'M', 'MH', 70000),
(16, 'Ritika Jain', 'F', 'RJ', 65000),
(17, 'Ashish Singh', 'M', 'UP', 43000),
(18, 'Simran Kaur', 'F', 'PB', 54000),
(19, 'Gaurav Sharma', 'M', 'DL', 56000),
(20, 'Meena Devi', 'F', 'BR', 40000),

(21, 'Aman Tiwari', 'M', 'UP', 47000),
(22, 'Shreya Das', 'F', 'WB', 59000),
(23, 'Kunal Shah', 'M', 'GJ', 61000),
(24, 'Pallavi Singh', 'F', 'UP', 52000),
(25, 'Ravi Patel', 'M', 'GJ', 58000),
(26, 'Anu Kumari', 'F', 'BR', 45000),
(27, 'Mohit Agarwal', 'M', 'RJ', 67000),
(28, 'Divya Bansal', 'F', 'HR', 63000),
(29, 'Sanjay Mishra', 'M', 'UP', 48000),
(30, 'Komal Arora', 'F', 'DL', 55000),

(31, 'Nitin Saxena', 'M', 'MP', 51000),
(32, 'Payal Gupta', 'F', 'MH', 62000),
(33, 'Tarun Khanna', 'M', 'PB', 54000),
(34, 'Rashmi Pandey', 'F', 'UP', 49000),
(35, 'Ajay Singh', 'M', 'UP', 46000),
(36, 'Sonal Jain', 'F', 'RJ', 65000),
(37, 'Vivek Dubey', 'M', 'UP', 42000),
(38, 'Preeti Sharma', 'F', 'DL', 60000),
(39, 'Arun Yadav', 'M', 'BR', 47000),
(40, 'Neelam Verma', 'F', 'UP', 53000),

(41, 'Rakesh Kumar', 'M', 'HR', 48000),
(42, 'Swati Mishra', 'F', 'UP', 56000),
(43, 'Dinesh Patel', 'M', 'GJ', 61000),
(44, 'Jyoti Singh', 'F', 'UP', 52000),
(45, 'Alok Gupta', 'M', 'DL', 70000),
(46, 'Rekha Devi', 'F', 'BR', 43000),
(47, 'Pankaj Sharma', 'M', 'RJ', 59000),
(48, 'Neetu Kapoor', 'F', 'PB', 57000),
(49, 'Harsh Vardhan', 'M', 'UP', 65000),
(50, 'Ritu Saxena', 'F', 'MP', 54000),
(51, 'Richa Singhania', 'F', 'MP', 154000);

SELECT * FROM Employee;

CREATE OR REPLACE TABLE AJ_EMPLOYEE_DESIGNATION_BUCKET AS 
SELECT *,
    CASE
        WHEN Salary >150000 AND Salary <=200000 THEN 'Founder'
        WHEN Salary >=70000 AND Salary <= 100000 THEN 'CH'
        WHEN Salary >=60000 AND Salary <70000 THEN 'HOD'
        WHEN Salary >=50000 AND Salary <60000 THEN 'Manager'
        WHEN Salary >=45000 AND Salary <50000 THEN 'Senior Executive'
        WHEN Salary >=40000 AND Salary <45000 THEN 'Executive'
        ELSE 'Intern'
    END AS Designation
FROM Employee;

SELECT * 
FROM AJ_EMPLOYEE_DESIGNATION_BUCKET
WHERE Designation IN('Manager','Senior Executive');

-- for female employee, employee salaries should come in descending order
-- For Male employee. we should get employee salaries in ascending order
-- we can deftne this condition with combination of Order by and Case statement.
SELECT 
    EmployeeName,
    Salary,
    Gender
FROM Employee
ORDER BY 
    CASE WHEN Gender = 'F' THEN Salary END DESC,
    CASE WHEN Gender = 'M' THEN Salary END ASC;


-- Suppose we want to group employee based on their salary
-- further we want to calculate the minimum and maximum salary for perticular range of employee

SELECT 
    CASE
        WHEN Salary >150000 AND Salary <=200000 THEN 'Founder'
        WHEN Salary >=70000 AND Salary <= 100000 THEN 'CH'
        WHEN Salary >=60000 AND Salary <70000 THEN 'HOD'
        WHEN Salary >=50000 AND Salary <60000 THEN 'Manager'
        WHEN Salary >=45000 AND Salary <50000 THEN 'Senior Executive'
        WHEN Salary >=40000 AND Salary <45000 THEN 'Executive'
        ELSE 'Intern'
    END AS Designation,
MIN(Salary) AS MinimumSalary,
MAX(Salary) AS MaximumSalary
FROM Employee
GROUP BY 
    CASE
        WHEN Salary >150000 AND Salary <=200000 THEN 'Founder'
        WHEN Salary >=70000 AND Salary <= 100000 THEN 'CH'
        WHEN Salary >=60000 AND Salary <70000 THEN 'HOD'
        WHEN Salary >=50000 AND Salary <60000 THEN 'Manager'
        WHEN Salary >=45000 AND Salary <50000 THEN 'Senior Executive'
        WHEN Salary >=40000 AND Salary <45000 THEN 'Executive'
        ELSE 'Intern'
    END;  




SELECT 
    Designation,
    MIN(Salary) AS MinimumSalary,
    MAX(Salary) AS MaximumSalary
FROM AJ_EMPLOYEE_DESIGNATION_BUCKET
GROUP BY Designation;
