DROP DATABASE IF EXISTS EmployeeRecordsDB;

CREATE DATABASE EmployeeRecordsDB;

USE EmployeeRecordsDB;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

SELECT * FROM departments;

INSERT INTO departments (department_id, department_name)
VALUES
(101, 'HR'),
(102, 'Software'),
(103, 'Finance');

SELECT * FROM departments;

CREATE TABLE location (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    location VARCHAR(30) NOT NULL UNIQUE
);

SELECT * FROM location;

INSERT INTO location (location)
VALUES
('Kochi'),
('Calicut'),
('Trivandrum');

SELECT * FROM location;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    age INT NOT NULL,
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),
    CONSTRAINT chk_employee_age CHECK (age >= 18),
    CONSTRAINT fk_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id),
    CONSTRAINT fk_location
        FOREIGN KEY (location_id)
        REFERENCES location(location_id)
);

SELECT * FROM employees;

INSERT INTO employees
(employee_id, employee_name, gender, age, hire_date,
 designation, department_id, location_id, salary)
VALUES
(1, 'Rahul Sharma', 'M', 28, '2024-01-15',
 'Software Engineer', 102, 3, 45000.00),
(2, 'Priya Nair', 'F', 32, '2023-06-10',
 'HR Manager', 101, 1, 55000.00),
(3, 'John Smith', 'M', 40, '2022-03-20',
 'Financial Analyst', 103, 2, 60000.00);

SELECT * FROM employees;

INSERT INTO employees
(employee_id, employee_name, gender, age, designation,
 department_id, location_id, salary)
VALUES
(4, 'Anu Thomas', 'F', 25, 'HR Executive',
 101, 1, 35000.00);

SELECT * FROM employees;

SELECT * FROM employees
WHERE age >= 18;

SELECT * FROM employees
WHERE gender = 'M';

SELECT * FROM employees
WHERE gender = 'F';

SELECT * FROM employees
WHERE age >= 30;

SELECT * FROM employees
WHERE department_id = 102;

SELECT * FROM employees
WHERE location_id = 1;

ALTER TABLE employees
ADD COLUMN email VARCHAR(100);

SELECT * FROM employees;

UPDATE employees
SET email = 'rahul@gmail.com'
WHERE employee_id = 1;

UPDATE employees
SET email = 'priya@gmail.com'
WHERE employee_id = 2;

UPDATE employees
SET email = 'john@gmail.com'
WHERE employee_id = 3;

UPDATE employees
SET email = 'anu@gmail.com'
WHERE employee_id = 4;

SELECT * FROM employees;

ALTER TABLE employees
MODIFY COLUMN designation VARCHAR(150);

SELECT * FROM employees;

ALTER TABLE employees
RENAME COLUMN hire_date TO date_of_joining;

SELECT * FROM employees;

SELECT * FROM departments;

RENAME TABLE departments TO Departments_Info;

SELECT * FROM Departments_Info;

SELECT * FROM location;

RENAME TABLE location TO Locations;

SELECT * FROM Locations;

SELECT * FROM employees;

ALTER TABLE employees
DROP CHECK chk_employee_age;

SELECT * FROM employees;

ALTER TABLE employees
DROP COLUMN age;

SELECT * FROM employees;

