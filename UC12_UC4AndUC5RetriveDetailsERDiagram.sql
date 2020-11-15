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