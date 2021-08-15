DELIMITER $$
CREATE PROCEDURE GetAverageSalary()
	BEGIN SELECT avg(salary) AS "Average Salaries"
	FROM salaries;

	END$$


CREATE PROCEDURE employeesByDepartment(
	IN dept_no char(4)
	OUT list varChar(30))
	BEGIN
		SELECT e.first_name, e.last_name 
		INTO list
		FROM departments d
		INNER JOIN dept_emp r
		ON r.dept_no = d.dept_no
		INNER JOIN employees e
		ON e.emp_no = r.emp_no
		WHERE d.dept_no = dept_no;
	END$$
	

CREATE PROCEDURE employeesBySalary(
	IN salary INTEGER )
	BEGIN
		SELECT e.first_name, e.last_name
		FROM employees e
		INNER JOIN salaries s
		ON s.emp_no =  e.emp_no
		WHERE s.from_date < sysdate()
		AND s.to_date > sysdate()
		AND s.salary > salary;
	END$$
	
CREATE PROCEDURE GetEmployeeInfo(
	IN id INTEGER)
	BEGIN
		SELECT e.first_name, e.last_name, e.birth_date, e.gender
		FROM employees e
		WHERE e.emp_no = id;
	END$$


	
CREATE PROCEDURE PrintTitleInfo(
	IN title varchar(50))
	BEGIN
		SELECT COUNT(e.emp_no)
		FROM titles
		INNER JOIN employees e
		ON e.emp_no = t.emp_no
		WHERE t.title = title;
	END$$

	
DELIMITER ;
