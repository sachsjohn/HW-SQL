-- Once you have a complete database, do the following:
-- List the following details of each employee: employee number, last name, first name, gender, and salary.
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from employees as e 
inner join salaries as s on (e.emp_no = s.emp_no);


-- List employees who were hired in 1986.
-- LIKE statement don't work for dates
select emp_no, last_name, first_name, hire_date 
from employees 
where hire_date between '1986-01-01' and '1986-12-31';


-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select dm.dept_no, dep.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date 
from dept_man as dm 
inner join departments as dep on (dm.dept_no = dep.dept_no) 
inner join employees as e on (dm.emp_no = e.emp_no);


-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as d_e on (e.emp_no = d_e.emp_no)
inner join departments as d on (d_e.dept_no = d.dept_no);

-- List all employees whose first name is "Hercules" and last names begin with "B."
select emp_no, first_name, last_name
from employees
where first_name = 'Hercules' and
last_name like 'B%';


-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- This is just a copy of the above query with an additional where clause
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as d_e on (e.emp_no = d_e.emp_no)
inner join departments as d on (d_e.dept_no = d.dept_no)
where d.dept_name='Sales';


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- Similarly, just an additional requirement
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as d_e on (e.emp_no = d_e.emp_no)
inner join departments as d on (d_e.dept_no = d.dept_no)
where d.dept_name='Sales' or d.dept_name = 'Development';


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc;

