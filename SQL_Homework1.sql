use hr;

-- 1) Вывести всех сотрудников кроме тех, кто работает в департаментах 80 и 110
SELECT
*
FROM employees
WHERE department_id <> 80 AND department_id <> 110;

-- 2) Вывести сотрудников зарабатывающих от 5000 до 7000 (включая концы)
SELECT
*
FROM employees
WHERE salary BETWEEN 5000 AND 7000;

-- 3) Вывести все страны, которые содержат в названии 'g'
SELECT
*
FROM countries
WHERE country_name like '%g%';

-- 4) Вывести все города, где почтовый код начинается или заканчивается на 99
SELECT
*
FROM locations
WHERE postal_code like '%99' OR postal_code like '99%';

-- 5) Вывести всех работников, кто не имеет менеджера
SELECT
*
FROM employees
WHERE manager_id IS NULL OR manager_id = '';
