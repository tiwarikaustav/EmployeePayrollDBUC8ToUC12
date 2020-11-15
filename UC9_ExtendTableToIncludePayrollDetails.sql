--UC9: Ability to extendemployee_payroll table to have 
--Basic Pay, Deductions, Taxable Pay, Income Tax, Net Pay
alter table employee_payroll
add basic_pay float, deductions float, taxable_pay float, 
income_tax float, net_pay float;