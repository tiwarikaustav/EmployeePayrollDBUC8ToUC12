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
