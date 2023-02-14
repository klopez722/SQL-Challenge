--List the employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986 
SELECT * 
FROM employees
WHERE DATE_PART('year',hire_date) = 1986

--List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT
  employees.first_name,employees.last_name,employees.emp_no,departments.dept_name,departments.dept_no
FROM employees
JOIN dept_managers
  ON employees.emp_no = dept_managers.emp_no
JOIN departments
  ON dept_managers.dept_no = departments.dept_no

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name 
SELECT
  employees.first_name,employees.last_name,dep_emp.emp_no,dep_emp.dept_no,departments.dept_name
FROM employees
INNER JOIN dep_emp
ON employees.emp_no = dep_emp.emp_no
JOIN departments
ON departments.dept_no = dep_emp.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name 
SELECT 
employees.emp_no, employees.last_name, employees.first_name,dep_emp.dept_no
FROM employees 
LEFT JOIN dep_emp 
ON employees.emp_no=dep_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dep_emp.dept_no
WHERE departments.dept_no='d007';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT 
employees.emp_no, employees.last_name, employees.first_name,dep_emp.dept_no
FROM employees 
LEFT JOIN dep_emp 
ON employees.emp_no=dep_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dep_emp.dept_no
WHERE departments.dept_no in ('d007', 'd005')

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, count(last_name) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency desc;