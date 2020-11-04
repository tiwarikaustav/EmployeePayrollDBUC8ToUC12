--UC2: Creating table with column names, setting empID as primary key 
--with auto increment feature
create table employee_payroll
(empId int not null identity(1,1) primary key,
empName varchar(150) not null,
salary float not null,
startDate date not null);