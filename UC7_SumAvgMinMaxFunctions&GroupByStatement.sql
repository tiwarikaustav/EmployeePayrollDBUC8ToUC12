--UC7: Using SUM(), AVG(), MIN(), MAX() functions 
SELECT SUM(salary) as 'Sum of Salary' FROM employee_payroll
WHERE gender = 'F';

SELECT SUM(salary) as 'Sum Of Salary', MIN(salary) as 'Minimum Salary', 
MAX(salary) as 'Maximum Salary', COUNT(salary) as 'Number Of Males',
AVG(salary) as 'Average Salary', gender from employee_payroll group by gender;

SELECT SUM(salary) as 'Sum Of Salary', MIN(salary) as 'Minimum Salary', 
MAX(salary) as 'Maximum Salary', COUNT(salary) as 'Number Of Females',
AVG(salary) as 'Average Salary' from employee_payroll group by gender;


