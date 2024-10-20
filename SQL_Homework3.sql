USE learn;

-- Создайте таблицу goods (id, title, quantity)
CREATE TABLE goods(
id integer,
title varchar(32),
quantity integer
);

-- Добавьте несколько строк
INSERT INTO goods(id, title, quantity) VALUES (1, 'Laptop', 19);
INSERT INTO goods(id, title, quantity) VALUES (2, 'Smartphone', 37);
INSERT INTO goods(id, title, quantity) VALUES (3, 'Headphones', 18);
INSERT INTO goods(id, title, quantity) VALUES (4, 'Smartwatch', 25);
INSERT INTO goods(id, title, quantity) VALUES (5, 'Monitor', 30);

-- Добавьте поле price (integer) со значением по умолчанию 0
ALTER TABLE goods
ADD price integer default 0;

-- Проверьте содержимое таблицы
SELECT
*
FROM goods;

-- Измените тип на numeric(8, 2)
ALTER TABLE goods
MODIFY COLUMN price numeric(8.2);

-- Измените тип обратно на integer
ALTER TABLE goods
MODIFY COLUMN price integer;

-- Переименуйте поле на item_price
ALTER TABLE goods
RENAME COLUMN price TO item_price;

-- Удалите это поле
ALTER TABLE goods
DROP COLUMN item_price;
