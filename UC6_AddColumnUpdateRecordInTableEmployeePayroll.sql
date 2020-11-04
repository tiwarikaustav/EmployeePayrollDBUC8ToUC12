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
