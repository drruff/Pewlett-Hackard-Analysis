-- Create Titles list
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	tit.title,
	tit.from_date,
	tit.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS tit
ON (e.emp_no = tit.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;

-- Find out how many retiring by title
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY ut.count DESC;
	