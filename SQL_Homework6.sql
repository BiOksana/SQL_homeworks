-- Используйте бд hr;
USE hr;

-- 1)Вывести job_id тех сотрудников, которые зарабатывают больше своего менеджера

SELECT
t1.job_id 
FROM employees AS t1
INNER JOIN employees AS t2
ON t1.manager_id = t2.employee_id
WHERE t1.salary > t2.salary;

-- 2)Вывести имя, фамилию и город сотрудников, которые работают в Seattle или Toronto

SELECT
t1.first_name,
t1.last_name,
t3.city
FROM employees AS t1
INNER JOIN departments AS t2
ON t1.department_id = t2.department_id
INNER JOIN locations AS t3
ON t2.location_id = t3.location_id
WHERE t3.city IN ('Seattle', 'Toronto');

-- 3)Вывести имя, фамилию и зарплату тех сотрудников, которые работают в городах Oxford и San Francisco

SELECT
t1.first_name,
t1.last_name,
t1.salary,
t3.city
FROM employees AS t1
INNER JOIN departments AS t2
ON t1.department_id = t2.department_id
INNER JOIN locations AS t3
ON t2.location_id = t3.location_id
WHERE t3.city IN ('Oxford', 'San Francisco');

SELECT
first_name,
last_name,
salary,
department_id
FROM employees
WHERE department_id IN (
						SELECT
						department_id
						FROM departments
						WHERE location_id IN(
											 SELECT
											 location_id
											 FROM locations
											 WHERE city IN ('Oxford', 'San Francisco')));

 
-- 4)Вывести имя, фамилию и город сотрудника

SELECT
t1.first_name,
t1.last_name,
t3.city
FROM employees AS t1
INNER JOIN departments AS t2
ON t1.department_id = t2.department_id
INNER JOIN locations AS t3
ON t2.location_id = t3.location_id;

-- 5)Вывести города и соответствующие городам страны

SELECT
l.city,
c.country_name
FROM locations AS l
INNER JOIN countries AS c
ON l.country_id = c.country_id;

-- 6)Выведите названия департаментов, в которых менеджеры зарабатывают больше 10000

SELECT
d.department_name
FROM departments AS d
INNER JOIN employees AS e
ON d.manager_id = e.employee_id
WHERE e.salary > 10000;
