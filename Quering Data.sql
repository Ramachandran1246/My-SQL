-- Quaring Data  
 
  create database employee;
 
 use employee;
 
 CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE);
    
    CREATE TABLE Location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(30) NOT NULL UNIQUE);
    
    create table employees (employee_id int AUTO_INCREMENT PRIMARY KEY,
employee_name varchar(50) NOT NULL,
gender enum('M','F'),
age int CHECK (age >= 18),
hire_date date default (current_date()),
designation varchar(100),
department_id int, 
location_id int,
salary decimal(10.2));

alter table employees
add CONSTRAINT FK_Department FOREIGN KEY (department_id) REFERENCES Departments(department_id) ON DELETE CASCADE;

alter table employees
add CONSTRAINT FK_Location FOREIGN KEY (location_id) REFERENCES Location(location_id) ON DELETE CASCADE;

insert into location (location_id, location)
values (1, "Chennai"),
(2, "Banglore"),
(3, "Hydrabad"),
(4, "Pune");

insert into departments (department_id, department_name)
values (1, "Software Development"),
(2,	"Marketing"),
(3,	"Data Science"),
(4,	"Human Resources"),
(5,	"Product Management"),
(6,	"Content Creation"),
(7,	"Finance"),
(8,	"Design"),
(9,	"Research and Development"),
(10, "Customer Support"),
(11, "Business Development"),
(12,	"IT"),
(13, "Operations");

INSERT INTO employees (employee_id, employee_name, gender, age, hire_date, designation, department_id, location_id, salary) 
VALUES (5001, 'Vihaan Singh', 'M', 27, '2015-01-20', 'Data Analyst', 3, 4, 60000),
    (5002, 'Reyansh Singh', 'M', 31, '2015-03-10', 'Network Engineer', 12, 1, 80000),
    (5003, 'Aaradhya Iyer', 'F', 26, '2015-05-20', 'Customer Support Executive', 10, 2, 45000),
    (5004, 'Kiara Malhotra', 'F', 29, '2015-07-05', NULL, 8, 3, 70000),
    (5005, 'Anvi Chaudhary', 'F', 25, '2015-09-11', 'Business Development Executive', 11, 1, 55000),
    (5006, 'Dhruv Shetty', 'M', 28, '2015-11-20', 'UI Developer', 8, 2, 65000),
    (5007, 'Anushka Singh', 'F', 32, '2016-01-15', 'Marketing Manager', 2, 3, 90000),
    (5008, 'Diya Jha', 'F', 27, '2016-03-05', 'Graphic Designer', 8, 4, 70000),
    (5009, 'Kiaan Desai', 'M', 30, '2016-05-20', 'Sales Executive', 11, 3, 55000),
    (5010, 'Atharv Yadav', 'M', 29, '2016-07-10', 'Systems Administrator', 12, 4, 80000),
    (5011, 'Saanvi Patel', 'F', 28, '2016-09-20', 'Marketing Analyst', 2, 1, 60000),
    (5012, 'Myra Verma', 'F', 26, '2016-11-05', 'Operations Manager', 13, 2, 95000),
    (5013, 'Arnav Rao', 'M', 33, '2017-01-20', 'Customer Success Manager', 10, 3, 75000),
    (5014, 'Vihaan Mohan', 'M', 30, '2017-03-10', 'Supply Chain Analyst', 10, 2, 60000),
    (5015, 'Ishaan Kumar', 'M', 27, '2017-05-20', 'Financial Analyst', 7, 1, 85000),
    (5016, 'Zoya Khan', 'F', 31, '2017-07-05', 'Legal Counsel', 4, 4, 100000),
    (5017, 'Kabir Nair', 'M', 28, '2017-09-11', 'IT Support Specialist', 12, 2, 80000),
    (5018, 'Ishan Mishra', 'M', 25, '2017-11-20', 'Research Scientist', 9, 3, 75000),
    (5019, 'Ishika Patel', 'F', 29, '2018-01-15', 'Talent Acquisition Specialist', 4, 4, 55000),
    (5020, 'Aarav Nair', 'M', 32, '2018-03-05', 'Software Engineer', 1, 1, 90000),
    (5021, 'Advik Kapoor', 'M', 26, '2018-05-20', 'Finance Analyst', 7, 3, 85000),
    (5022, 'Aadhya Iyengar', 'F', 28, '2018-07-10', 'HR Specialist', 4, 4, 60000),
    (5023, 'Anika Paul', 'F', 30, '2018-09-20', 'Public Relations Specialist', 2, 2, 70000),
    (5024, 'Aryan Shetty', 'M', 27, '2018-11-05', 'Product Manager', 5, 1, 95000),
    (5025, 'Avni Iyengar', 'F', 31, '2019-01-20', 'Data Scientist', 3, 4, 100000),
    (5026, 'Vivaan Singh', 'M', 29, '2019-03-10', 'Business Analyst', 3, 2, 75000),
    (5027, 'Ananya Paul', 'F', 32, '2019-05-20', 'Content Writer', 6, 3, 60000),
    (5028, 'Anaya Kapoor', 'F', 26, '2019-07-05', 'Event Coordinator', 6, 1, 60000),
    (5029, 'Arjun Kumar', 'M', 33, '2019-09-11', 'Quality Assurance Analyst', 12, 2, 80000),
    (5030, 'Sara Iyer', 'F', 28, '2019-11-20', 'Project Manager', 5, 1, 90000);

Select * from departments;

select location from Location;

Select employee_name,designation from employees;

select * from employees;

SELECT DISTINCT salary
FROM Employees;

SELECT age AS Employee_Age,
      salary AS Employee_Salary
FROM Employees;

SELECT employee_id,
      employee_name,
    salary AS Base_Salary,
    salary * 0.10 AS Bonus,
    salary + (salary * 0.10) AS Net_Salary
FROM Employees;


SELECT *
FROM employees
WHERE salary > 50000 
  AND hire_date < '2016-01-01';
  

  SELECT *
FROM Employees
WHERE Designation IN ('Data Analyst', 'Data Scientist');

SELECT 
    employee_id,
    employee_name,
    coalesce(designation,' Data Scientist ') as designation
FROM Employees;

SET SQL_SAFE_UPDATES = 0;

UPDATE Employees
SET designation = 'Data Scientist'
WHERE designation IS NULL;

SELECT *
FROM Employees
WHERE department_id IN (1, 3, 4, 9, 12);

SELECT *
FROM Employees
WHERE salary NOT BETWEEN 50000 AND 80000;

SELECT *
FROM Employees
WHERE employee_name regexp '^[AEIOUaeiou]';


SELECT *
FROM employees
WHERE employee_name LIKE '_sh%';

select *
 from employees 
 where hire_date > '2019-01-01'
order by hire_date;


SELECT *
FROM employees
ORDER BY department_id ASC, salary DESC;

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 10;

SELECT *
FROM employees
WHERE hire_date BETWEEN '2018-01-01' AND '2018-12-31'
ORDER BY hire_date
LIMIT 5;


SELECT SUM(salary) AS total_salaries    
FROM employees
WHERE department_id = 'Finance';


SELECT SUM(salary) AS total_salaries    
FROM employees
WHERE department_id = '10';

SELECT MIN(age) AS minimum_age
FROM employees;

SELECT location_id, MAX(salary) AS max_salary
FROM employees
GROUP BY location_id;

SELECT designation, AVG(salary) AS average_salary
FROM employees
WHERE designation LIKE '%Analyst%'
GROUP BY designation;

SELECT department_id, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id
HAVING COUNT(*) < 3;

SELECT location_id, AVG(age) AS average_age
FROM employees
WHERE gender = 'Female'
GROUP BY location_id
HAVING AVG(age) < 30;
