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
