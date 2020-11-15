--UC1: Creating database
create database payroll_services;
use payroll_services;

--UC2: Creating table with column names, setting primary key
create table employee_payroll
(empId int not null identity(100,1) primary key,
empName varchar(150) not null,
salary float not null,
startDate date not null);

--UC3: Reading full table 
select * from employee_payroll;
--UC3: Inserting data rows in the created table
insert into employee_payroll(empName, salary, startDate)
values ('Thakur', 60000, '2015-01-01'),
('Terissa', 25000, '2019-06-08'), ('Rohit', 40000, '2019-07-08'),
('Shobhit', 40000, '2018-04-06'), ('Manoj', 20000, '2016-06-08'),
('Pooja', 45000, '2014-06-08'), ('Dhanno', 39000, '2017-06-08');

--UC4: Data Retrieving
select * from employee_payroll;
select empName from employee_payroll;
select empId, empName from employee_payroll;

--UC5: Ability to retrieve salary data for a particular employee 
--using WHERE conditional clause 
SELECT salary, startDate FROM employee_payroll 
WHERE empName = 'Thakur';

SELECT empName,salary from employee_payroll 
WHERE startDate between CAST('2016-01-01' as date) and CAST(getdate() as date);
--getdate gives today's date

--UC6: Adding a column - gender of datatype char (M/F)
--using ALTER
alter table employee_payroll 
add gender char(1);
--UC6: Updating values in newly created column
UPDATE employee_payroll set gender ='M' 
where empName = 'Thakur' or empName ='Manoj' or empName = 'Rohit' or empName = 'Shobhit';

UPDATE employee_payroll set gender ='F' 
where empName = 'Terissa' or empName = 'Pooja';
select * from employee_payroll;

--UC7: Using SUM(), AVG(), MIN(), MAX() functions 
SELECT SUM(salary) as 'Sum of Salary' FROM employee_payroll
WHERE gender = 'F';

SELECT SUM(salary) as 'Sum Of Salary', MIN(salary) as 'Minimum Salary', 
MAX(salary) as 'Maximum Salary', COUNT(salary) as 'Number Of Males',
AVG(salary) as 'Average Salary', gender from employee_payroll group by gender;

SELECT SUM(salary) as 'Sum Of Salary', MIN(salary) as 'Minimum Salary', 
MAX(salary) as 'Maximum Salary', COUNT(salary) as 'Number Of Females',
AVG(salary) as 'Average Salary' from employee_payroll group by gender;

--UC8: Ability to extend employee_payroll data to store employee information
--like employee phone, address and department 
--Ensure employee department is non nullable fields.
--Add Default Value for address
alter table employee_payroll
add phoneNumber bigint, department varchar(50), 
address varchar(50) not null default 'Bangalore';
select * from employee_payroll;

--UC9: Ability to extendemployee_payroll table to have 
--Basic Pay, Deductions, Taxable Pay, Income Tax, Net Pay
alter table employee_payroll
add basic_pay float, deductions float, taxable_pay float, 
income_tax float, net_pay float;

--UC10: Terissa redundancy to accomodate two departments
insert into employee_payroll(empName, salary, startDate, gender, department)
values ('Terissa', 30000, '2018-01-03', 'F', 'Marketing');
update employee_payroll set department = 'Sales'
where empName = 'Terissa' and empId = 101;

--UC11: Implementing the ER Diagram into EmployeePayrollDB
--Creating Table employee
use payroll_services;
CREATE TABLE employee
( id INT NOT NULL identity(1,1) PRIMARY KEY, 
name VARCHAR(150) NOT NULL,
gender CHAR(1) NOT NULL,
address VARCHAR(100) NOT NULL,
start_date DATE NOT NULL);

CREATE TABLE payroll
(
payroll_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
basic_pay FLOAT NOT NULL,
deductions AS 2000,
taxable_pay AS (basic_pay-2000),
income_tax AS ((basic_pay-2000)*0.12),
net_pay AS (basic_pay - (basic_pay-2000)*0.12),
emp_id INT FOREIGN KEY REFERENCES employee(id)
);

CREATE TABLE department
(
dept_id INT NOT NULL PRIMARY KEY,
dept_name VARCHAR(20) NOT NULL
);

CREATE TABLE employee_department
(
emp_id INT FOREIGN KEY REFERENCES employee(id),
dept_id INT FOREIGN KEY REFERENCES department(dept_id)
);

insert into employee (name, gender, address, start_date)
values ('Mohan', 'M', 'Pune', '2015-01-01'),
('Rohini', 'F', 'Mysuru', '2010-08-01'),
('Arya', 'M', 'Jabalpur', '2020-09-18');

select * from payroll;
select * from employee;
select * from department;
select * from employee_department;

INSERT INTO payroll (basic_pay, emp_id)
values (49000, 2),
(71994, 3),
(250000, 4);

INSERT INTO department
VALUES
(101,'Sales'),
(201,'Marketing'),
(301,'HR'),
(401,'Technical'),
(501,'Cleaning'),
(601,'Banking');

INSERT INTO employee_department
VALUES
(2, 401),
(3, 401),
(3, 201),
(4, 301),
(4, 401);

Select e.gender, SUM(p.net_pay) as 'Sum of Salary', AVG(p.net_pay) as avg_netpay, 
MIN(p.net_pay) AS 'min_salary', MAX(p.net_pay) AS 'max_salary', COUNT(p.net_pay) AS 'count_salary'
FROM employee e, payroll p
WHERE e.id = p.emp_id
GROUP BY e.gender;

--UC12: Implementing UC4, UC5 of EmployeePayrollDB using ER Diagram
--Using new schema to retrive details
use payroll_services;

select * from payroll;
select * from employee;
select * from department;
select * from employee_department;

select e.id, e.name, e.gender, p.net_pay, d.dept_name
from employee e, payroll p, department as d, employee_department as ed
where e.id=p.emp_id AND d.dept_id =  ed.dept_id AND ed.emp_id = e.id;

SELECT e.id, e.name, e.gender, p.net_pay, d.dept_name
FROM employee e, payroll p, department d, employee_department ed
WHERE e.id = p.emp_id AND e.id = ed.emp_id 
		AND ed.dept_id=d.dept_id AND e.name ='Arya';


SELECT e.id, e.name, e.gender, p.net_pay, d.dept_name, e.start
FROM employee e, payroll p, department d, employee_department ed
WHERE e.id = p.emp_id AND e.id = ed.emp_id AND ed.dept_id=d.dept_id 
		AND (e.start BETWEEN CAST('2016-04-03' AS DATE) AND CONVERT(DATE, GETDATE()));

--create table new 
--(id bigint identity(100,1) primary key,
--name varchar(50) not null,
--location varchar(50) default 'Delhi',
--);
--EXEC sp_rename 'new.name', 'empName', 'COLUMN';
--select * from new;
--
--SELECT employee.id, 
--(select payroll.id from payroll where  employee.id = payroll.id) as payrollID
--FROM employee;

