--UC10: Terissa redundancy to accomodate two departments
insert into employee_payroll(empName, salary, startDate, gender, department)
values ('Terissa', 30000, '2018-01-03', 'F', 'Marketing');
update employee_payroll set department = 'Sales'
where empName = 'Terissa' and empId = 101;