--UC8: Ability to extend employee_payroll data to store employee information
--like employee phone, address and department 
--Ensure employee department is non nullable fields.
--Add Default Value for address
alter table employee_payroll
add phoneNumber bigint, department varchar(50), 
address varchar(50) not null default 'Bangalore';
select * from employee_payroll;