--List of employees and their salaries
select employees.emp_no, first_name, last_name, sex, salary
from employees
left join salaries on employees.emp_no = salaries.emp_no
order by employees.emp_no nulls first;

--Employees hired in 1986
select first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' AND '1986-12-31';

--Create Department Manager View
select i.emp_no, i.dept_no, p.last_name, p.first_name, d.dept_name
from dept_manager i
left join employees p 
	on i.emp_no = p.emp_no
left join departments d
    on i.dept_no = d.dept_no;

--employee list
select i.dept_no, i.emp_no, s.last_name, s.first_name, d.dept_name
from dept_emp i
left join employees s
	on i.emp_no = s.emp_no
left join departments d
	on i.dept_no = d.dept_no;

--list of Employees with first name Hercules and Last name begins with B
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

--list of employees in Sales Department
select d.dept_name, i.emp_no, s.last_name, s.first_name
from dept_emp i
left join employees s
	on i.emp_no = s.emp_no
left join departments d
	on i.dept_no = d.dept_no
where dept_name = 'Sales';

--list of employees in Sales and Development Departments
select i.dept_name, p.emp_no, e.last_name, e.first_name
from departments i 
left join dept_emp p
	on i.dept_no = p.dept_no
left join employees e
	on p.emp_no = e.emp_no
where dept_name IN ('Sales', 'Development');

--Count of Frequency of Last Names
Select last_name, Count(last_name)
from employees
group by last_name
order by count desc;