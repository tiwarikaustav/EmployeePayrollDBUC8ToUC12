--UC3: Reading full table 
select * from employee_payroll;
--UC3: Inserting data rows in the created table
insert into employee_payroll(empName, salary, startDate)
values ('Thakur', 60000, '2015-01-01'),
('Terissa', 25000, '2019-06-08'), ('Rohit', 40000, '2019-07-08'),
('Shobhit', 40000, '2018-04-06'), ('Manoj', 20000, '2016-06-08'),
('Pooja', 45000, '2014-06-08'), ('Dhanno', 39000, '2017-06-08');
