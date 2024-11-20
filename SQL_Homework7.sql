USE shop;
-- 1) Выведите минимальный рейтинг покупателя среди сделавших заказ в мае 2022 года.
-- Вывести : minrating

SELECT
MIN(c2.RATING) AS minrating
FROM (
		SELECT
		c.RATING
		FROM customers AS c
		INNER JOIN (
					SELECT
					CUST_ID
					FROM orders
					WHERE month(ODATE) = 5) AS c1
					ON c.CUST_ID = c1.CUST_ID) AS c2;

-- 2)Выведите продавцов, которые оформили заказ на наибольшую сумму в период с марта по май 2022 года.
-- Вывести : sellid, amt

SELECT
SELL_ID AS sell_id,
SUM(AMT) AS amt
FROM orders
GROUP BY SELL_ID
HAVING amt = (
				SELECT
				MAX(t1.sum)
				FROM (
						SELECT
						SUM(AMT) AS sum,
						SELL_ID
						FROM orders
						WHERE ODATE BETWEEN "2022-03-01"  AND "2022-05-31"
						GROUP BY SELL_ID) AS t1);
