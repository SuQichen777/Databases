--Author: [Jiaxi Zhang]
--Assignment# 4 / Part 1
--Date due: April 6, 2025
--I pledge that I have completed this assignment without collaborating
--with anyone else, in conformance with the NYU School of Engineering
--Policies and Procedures on Academic Misconduct.

-- Q1
SELECT DISTINCT l.bldg_code, l.room
FROM location l
JOIN faculty f ON l.loc_id = f.loc_id
UNION
SELECT DISTINCT l.bldg_code, l.room
FROM location l
JOIN course_section cs ON l.loc_id = cs.loc_id
JOIN term t ON cs.term_id = t.term_id
WHERE t.term_desc = 'Summer 2004';

-- Q2
SELECT DISTINCT s.s_first, s.s_last
FROM student s
WHERE s.s_id NOT IN (
    SELECT DISTINCT e.s_id
    FROM enrollment e
    JOIN course_section cs ON e.c_sec_id = cs.c_sec_id
    JOIN faculty f ON cs.f_id = f.f_id
    WHERE f.f_first = 'Kim' AND f.f_last = 'Cox'
);

-- Q3
SELECT COUNT(DISTINCT e.s_id) AS total_student_count
FROM enrollment e
JOIN course_section cs ON e.c_sec_id = cs.c_sec_id
JOIN faculty f ON cs.f_id = f.f_id
WHERE f.f_first = 'John' AND f.f_last = 'Blanchard';

-- Q4
SELECT COUNT(DISTINCT e.s_id) AS total_students
FROM enrollment e
JOIN course_section cs ON e.c_sec_id = cs.c_sec_id
JOIN faculty f ON cs.f_id = f.f_id
JOIN term t ON cs.term_id = t.term_id
WHERE f.f_first = 'John' AND f.f_last = 'Blanchard'
  AND t.term_desc = 'Summer 2004';

-- Q5
SELECT s.s_first, s.s_last, e.c_sec_id, e.grade
FROM enrollment e
JOIN student s ON e.s_id = s.s_id
WHERE e.c_sec_id = 1000
ORDER BY e.grade;

-- Q6
SELECT DISTINCT f.f_first, f.f_last
FROM faculty f
JOIN course_section cs ON f.f_id = cs.f_id
JOIN enrollment e ON cs.c_sec_id = e.c_sec_id
GROUP BY f.f_id
HAVING COUNT(e.s_id) > 5;

-- Q7
SELECT c.course_name
FROM course c
JOIN course_section cs ON c.course_id = cs.course_id
GROUP BY c.course_id
HAVING COUNT(cs.c_sec_id) = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(c_sec_id) AS cnt
        FROM course_section
        GROUP BY course_id
    ) AS subquery
);

-- Q8
SELECT DISTINCT cs.c_sec_id
FROM course_section cs
JOIN faculty f ON cs.f_id = f.f_id
WHERE f.f_last LIKE 'B%'
UNION
SELECT DISTINCT e.c_sec_id
FROM enrollment e
JOIN student s ON e.s_id = s.s_id
WHERE s.s_last LIKE '%an%';