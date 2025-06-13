-- Create Database Employee
Create database Employee; 
use Employee;

Create table Departments(
department_id int,
department_name varchar (100));

-- Location Table creation
create table location (
location_id int,
location varchar (30));
-- Emplpoyes Table Creation 
create table employees
(employee_id int,
employee_name varchar(50),
gender enum ("M","F"),
age int,
hire_date date,
designation varchar(100),
department_id int,
location_id int,
salary decimal(10.2));

-- Table Alteration
alter table Employees
add column email varchar(100);
alter table Employees
modify column designation varchar(100);
alter table Employees
drop column age;
alter table Employees
rename column hire_date to date_of_joining;

-- Table Rename 
rename table departments to departments_info;
rename table location to locations;

-- Table Truncation
truncate  table Employees;

-- Database & Table Dropping
drop database employee;






