-- Use Dictinct with Orderby to remove duplicate rows
SELECT ri.emp_no, 
	   ri.first_name,
	   ri.last_name,
	   de.title,
       de.from_date,
	   de.to_date
INTO retirement_titles
FROM employees as ri
	INNER JOIN titles AS de
	 	  ON (ri.emp_no = de.emp_no) 
WHERE (ri.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY ri.emp_no ASC;

SELECT * FROM retirement_titles

SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no ASC, to_date DESC;

SELECT COUNT (emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC;

SELECT DISTINCT ON (ri.emp_no,de.emp_no,ce.emp_no) ri.emp_no,
	ri.first_name,
	ri.last_name,
	ri.birth_date,
	de.from_date,
	de.to_date,
	ce.title
INTO mentorship_eligibilty
FROM employees As ri
	INNER JOIN dept_emp AS de
	 	  ON (ri.emp_no = de.emp_no)
	INNER JOIN titles AS ce
	 	  ON (ri.emp_no = ce.emp_no) 
WHERE (ri.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
		AND (de.to_date = '9999-01-01')
ORDER BY ri.emp_no ASC;