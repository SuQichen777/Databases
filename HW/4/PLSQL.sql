--Author: [Jiaxi Zhang]
--Assignment# 4 / Part 2
--Date due: April 6, 2025
--I pledge that I have completed this assignment without collaborating
--with anyone else, in conformance with the NYU School of Engineering
--Policies and Procedures on Academic Misconduct.

-- Q1
DELIMITER $$

CREATE PROCEDURE track_student(IN first_name VARCHAR(50))
BEGIN
    SELECT CONCAT(s_first, ' ', s_last) AS student_name, e.c_sec_id As section_id
    FROM student s
    JOIN enrollment e ON s.s_id = e.s_id
    WHERE s.s_first = first_name;
END;
$$

DELIMITER ;

-- Q2

DELIMITER $$

CREATE PROCEDURE track_faculty
    (IN first_name VARCHAR(50), 
    IN last_name VARCHAR(50))
BEGIN
    SELECT CONCAT(f.f_first, ' ', f.f_last) AS faculty_name,
           COUNT(DISTINCT e.s_id) AS student_count
    FROM faculty f
    JOIN course_section cs ON f.f_id = cs.f_id
    JOIN enrollment e ON cs.c_sec_id = e.c_sec_id
    WHERE f.f_first = first_name AND f.f_last = last_name;
END; 
$$


DELIMITER ;


-- Q3 
DELIMITER $$

CREATE FUNCTION count_enroll(s_id INT, termid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM enrollment e
    JOIN course_section cs ON e.c_sec_id = cs.c_sec_id
    WHERE e.s_id = s_id AND cs.term_id = termid;
    RETURN total;
END;
$$

DELIMITER ;


-- Q4
DELIMITER $$

CREATE FUNCTION course_most_sections()
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(50);
    SELECT c.course_name INTO result
    FROM course c
    JOIN course_section cs ON c.course_id = cs.course_id
    GROUP BY c.course_id, c.course_name
    ORDER BY COUNT(cs.c_sec_id) DESC
    LIMIT 1;
    RETURN result;
END;
$$

DELIMITER ;


-- Q5-A
CREATE TABLE admitted_students (
    st_num NUMERIC(4)
);

-- Q5-B
INSERT INTO admitted_students
VALUES ((SELECT COUNT(s_id) FROM student));


-- Q5-C
DELIMITER $$

CREATE TRIGGER student_watch_dog
AFTER INSERT ON student
FOR EACH ROW
BEGIN
    UPDATE admitted_students
    SET st_num = st_num + 1;
END;
$$

DELIMITER ;

-- Q5-D

INSERT INTO student
VALUES (106, 'Cruz', 'Ana', 'S', '100 Northern Blvd.', 'Eau Claire', 'WI', '54703',
        '7154449870', 'SR', '1982-08-13', 8891, 1);

INSERT INTO student
VALUES (107, 'Katz', 'Daniel', 'B', '400 St. John''s Street', 'Eau Claire', 'WI', '54702',
        '7155552000', 'SR', '1982-04-10', 1230, 1);

-- Q5-E
SELECT * FROM admitted_students;

-- Q6
CALL track_student('Sarah');
-- Result:
-- student_name	section_id
-- Sarah Miller	1000
-- Sarah Miller	1003
-- Sarah Miller	1005
-- Sarah Miller	1008

-- Q7
CALL track_faculty('Kim', 'Cox');
-- faculty_name	student_count
-- Kim Cox	    5


-- Q8
SET @count_e = count_enroll(101, 5);
SELECT @count_e;
-- Result:
-- @count_e
-- 3


-- Q9: Call course_most_sections()
SELECT course_most_sections();
-- Result:
-- course_most_sections()
-- Intro. to Info. Systems
