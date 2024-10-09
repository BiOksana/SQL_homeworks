USE airport;

-- 1) Выбрать всех клиентов, чей возраст больше чем 40;
SELECT *
FROM clients
WHERE age > 40;

-- 2) Выбрать всех клиентов, у которых в фамилии есть вхождение 'Egor';
SELECT *
FROM clients
WHERE name like '%Egor%';

-- 3) Выбрать все билеты, которые относятся к классу Economy или PremiumEconomy и цена больше 40000;
SELECT *
FROM tickets
WHERE service_class IN ('Economy', 'PremiumEconomy') AND price > 40000;

-- 4) Выбрать все поездки, у которых статус был отменен или задержан, вывести только коды отправления и прибытия.
SELECT 
departure, arrival
FROM trips
WHERE status IN ('Cancelled', 'Delayed');

-- 5) Выбрать всех клиентов и отсортировать их по фамилии в алфавитном порядке;
SELECT *
FROM clients
ORDER BY name DESC;

-- 6) Выбрать всех клиентов и отсортировать их по возрасту в порядке убывания;
SELECT *
FROM clients
ORDER BY age DESC;

-- 7) Вывести все билеты НЕ Economy класса и отсортировать их по стоимости в порядке убывания;
SELECT *
FROM tickets
WHERE service_class <> 'Economy'
ORDER BY price DESC;