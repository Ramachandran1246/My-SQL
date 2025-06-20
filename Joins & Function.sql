-- use employee;

select * from departments;
select * from employees;
select * from location;
  -- Join --
  
-- Inner Join -- 

SELECT e.employee_name, e.designation, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

 -- Left Join --
 
SELECT d.department_name, COUNT(e.employee_id) AS total_employees
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

-- Rigth Join --

SELECT l.location, e.employee_name
FROM Employees e
RIGHT JOIN Location l ON e.location_id = l.location_id;

-- Function --

--  Built-in Numeric Functions --

SELECT ROUND(AVG(age)) AS average_age
FROM Employees;


SELECT *, CEIL(SQRT(salary)) AS bonus
FROM Employees;

-- Built-in String Functions --

SELECT location, LEFT(location, 3) AS first_three_chars
FROM Location;

SELECT CONCAT(employee_name, ' - ', designation) AS employee_details
FROM Employees;

-- . Built-in Date Time Functions --

SELECT employee_name, hire_date, YEAR(hire_date) AS hire_year
FROM Employees;

SELECT 
  employee_id,
  hire_date,
  DATEDIFF(CURRENT_DATE, hire_date) AS days_since_hire
FROM employees;

SELECT 
  employee_id,
  DATE_FORMAT(hire_date, '%d-%m-%Y') AS formatted_hire_date
FROM 
  employees;
  
  SELECT 
  employee_id,
  employee_name,
  hire_date,
  DATE_ADD(hire_date, INTERVAL 3 MONTH) AS employment_confirmation
FROM 
  employees;

-- User-defined Functions:

DELIMITER //

CREATE FUNCTION get_employee_count(location VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE emp_count INT;
  SELECT COUNT(*) INTO emp_count 
  FROM employees 
  WHERE location = location;
  RETURN emp_count;
END //

DELIMITER ;

SELECT get_employee_count('Bangalore') AS bangalore_count, 
       get_employee_count('Hyderabad') AS hyderabad_count;






































SELECT ROUND(AVG(age)) AS average_age
FROM employees;

SELECT *, CEIL(SQRT(salary)) AS bonus
FROM employees;

SELECT LEFT(location, 3) AS first_three_chars
FROM location;

 SELECT CONCAT(employee_name, ' - ',designation) AS employee_info
FROM employees;

SELECT employee_name, hire_date, YEAR(hire_date) AS hire_year
FROM Employees;

SELECT  employee_id,DATEDIFF(CURDATE(), hire_date) AS days_since_hire
FROM employees;

SELECT employee_id, DATE_FORMAT(hire_date, '%d-%m-%Y') AS formatted_hire_date
FROM employees;

SELECT  employee_name,hire_date, DATE_ADD(hire_date, INTERVAL 3 MONTH) AS employment_confirmation
FROM employees;

DELIMITER //

CREATE FUNCTION get_employee_count_by_location(location VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE emp_count INT;
  SELECT COUNT(*) INTO emp_count 
  FROM employees 
  WHERE location = location;
  RETURN emp_count;
END //

DELIMITER ;

SELECT get_employee_count('Bangalore') AS bangalore_count, 
       get_employee_count('Hyderabad') AS hyderabad_count;       
       



