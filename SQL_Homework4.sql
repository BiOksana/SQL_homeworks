-- 1. Создать таблицу goods с полями:
--  - id (уникальное значение)
--     - title (cтрока максимум 30 символов)
--     - quantity (число больше 0)
--     - instock (символ (Y/N))
    
    CREATE TABLE goods_1 (
    id integer primary key auto_increment,
    title varchar(30),
    quantity integer check (quantity > 0),
    in_stock varchar(1) check (in_stock IN ('Y', 'N'))
    );
    
-- Заполните созданную таблицу goods данными, минимум 10 строк.
insert into goods_1 (title, quantity, in_stock) values ('Велосипед', 2, 'Y');
insert into goods_1 (title, quantity, in_stock) values ('Скейт', 4, 'Y');
insert into goods_1 (title, quantity, in_stock) values ('Самокат', 2, 'Y');
insert into goods_1 (title, quantity, in_stock) values ('Сноуборд', 7, 'N');
insert into goods_1 (title, quantity, in_stock) values ('Санки', 1, 'Y');
insert into goods_1 (title, quantity, in_stock) values ('Коньки', 3, 'N');
insert into goods_1 (title, quantity, in_stock) values ('Ролики', 5, 'Y');
insert into goods_1 (title, quantity, in_stock) values ('Гантели', 1, 'Y');
insert into goods_1 (title, quantity, in_stock) values ('Штанга', 2, 'N');
insert into goods_1 (title, quantity, in_stock) values ('Скакалка', 15, 'Y');

SELECT
*
FROM goods_1;

-- Создать таблицу goods_2 с полями:
-- id (уникальное значение)
-- title (cтрока максимум 30 символов)
-- quantity (число больше 0)
-- price (целое число)
-- in_stock (символ (Y/N))

CREATE TABLE goods_2 (
    id integer primary key auto_increment,
    title varchar(30),
    quantity integer check (quantity > 0),
    price integer,
    in_stock varchar(1) check (in_stock IN ('Y', 'N'))
    );

-- Заполните созданную таблицу goods2 данными, минимум 10 строк.
insert into goods_2 (id, title, quantity, price, in_stock) values (1, 'Тюбинг', 5, 1000, 'Y');
insert into goods_2 (id, title, quantity, price, in_stock) values (2, 'Санки', 2, 1500, 'Y');
insert into goods_2 (id, title, quantity, price, in_stock) values (3, 'Снегокат', 2, 900, 'Y');
insert into goods_2 (id, title, quantity, price, in_stock) values (4, 'Сноуборд', 7, 700, 'N');
insert into goods_2 (id, title, quantity, price, in_stock) values (5, 'Клюшка', 8, 300, 'Y');
insert into goods_2 (id, title, quantity, price, in_stock) values (6, 'Коньки', 3, 350, 'N');
insert into goods_2 (id, title, quantity, price, in_stock) values (7, 'Форма', 9, 450, 'Y');
insert into goods_2 (id, title, quantity, price, in_stock) values (8, 'Защита  для колен и локтей', 8, 200, 'Y');
insert into goods_2 (id, title, quantity, price, in_stock) values (9, 'Защитные очки', 3, 150, 'N');
insert into goods_2 (id, title, quantity, price, in_stock) values (10, 'Шлем для сноуборда', 9, 270, 'Y');

SELECT
*
FROM goods_2;

-- Задачи:
-- Вывести все наименования товаров (включая дубли) из двух таблиц
SELECT title FROM goods_1
UNION ALL
SELECT title FROM goods_2
ORDER BY title;

-- Вывести уникальные названия товаров (без дублей) из двух таблиц
SELECT DISTINCT t1.* FROM (
						SELECT title FROM goods_1
						UNION ALL
						SELECT title FROM goods_2
                        ORDER BY title) AS t1;


-- Объединить данные из двух таблиц, указав price, где это возможно
 SELECT id, title, quantity, 0 AS price, in_stock FROM goods_1
 UNION ALL
 SELECT * FROM goods_2
 ORDER BY price DESC;
