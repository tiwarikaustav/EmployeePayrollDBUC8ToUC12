--UC5: Ability to retrieve salary data for a particular employee 
--using WHERE conditional clause 
SELECT salary, startDate FROM employee_payroll 
WHERE empName = 'Thakur';

SELECT empName,salary from employee_payroll 
WHERE startDate between CAST('2016-01-01' as date) and CAST(getdate() as date);
--getdate gives today's date
