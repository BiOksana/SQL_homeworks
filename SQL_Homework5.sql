-- 1)Найти компетенции , которых нет ни у одного преподавателя.

SELECT
c.title
FROM competencies AS c
LEFT JOIN teachers2competencies AS tc
ON c.id = tc.competencies_id
WHERE tc.competencies_id IS NULL;

SELECT
title
FROM competencies
WHERE id NOT IN (
				SELECT
				competencies_id
				FROM teachers2competencies
				);
                
-- 2)Вывести название курса и имя старосты

SELECT
c.title AS course_name,
s.name AS headman
FROM courses AS c
LEFT JOIN students AS s
ON s.id = c.headman_id;

-- 3)Вывести имя студента и имена старост, которые есть на курсах, которые он проходит

SELECT
s.name AS student_name,
s1.name AS headman_name
FROM students AS s
INNER JOIN students2courses AS sc
ON s.id = sc.student_id
INNER JOIN courses AS c
ON c.id = sc.course_id
INNER JOIN students AS s1
ON c.headman_id = s1.id;
