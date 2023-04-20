--Boston Lingwall
--SQL 8
--APRIL 10TH

--1 done
SELECT
    stu.first_name,
    stu.last_name
FROM
    student stu
WHERE
    stu.registration_date =
    (
    SELECT
        MIN(registration_date)
    FROM
        student
    )
ORDER BY
    stu.last_name,
    stu.first_name
;



--2 done
SELECT
    cou.description,
    sec.section_no,
    cou.cost,
    sec.capacity
FROM
    course cou
JOIN
    section sec
ON
    sec.course_no = cou.course_no
WHERE
    cou.cost =
    (
        SELECT
            MIN(cost)
        FROM
            course
    )
    AND
    sec.capacity <=
    (
        SELECT
            AVG(capacity)
        FROM
            section
    )
ORDER BY
    cou.description,
    sec.section_no
;

--3 done
WITH add1 AS
(
SELECT
    cou.course_no,
    cou.description,
    SUM(sec.capacity) AS total_capacity
FROM
    course cou
JOIN
    section sec
ON
    sec.course_no = cou.course_no 
GROUP BY
    cou.course_no, 
    cou.description
)
SELECT
    course_no,
    description,
    total_capacity
FROM
    add1
WHERE
    total_capacity <
    (
        SELECT
            AVG(capacity)
        FROM
            section
    )
ORDER BY
    description,
    total_capacity
;

--4
SELECT
    stu.student_id,
    stu.first_name,
    stu.last_name,
    most_classes
FROM 
    student stu
;

--5
SELECT
    stu.first_name,
    stu.last_name
FROM
    student stu
;

--6 
SELECT
    cou.course_no,
    cour.description
FROM    
    course cou

--7
SELECT
    stu.first_name,
    stu.last_name
FROM
    student stu

--8
SELECT
    stu.first_name,
    stu.last_name,
    cou.description,
    sec.section_id
FROM    
    student stu,
    course cou,
    section sec

--9
SELECT
    sec.section_id,
    sec.capacity
FROM
    section sec

--10
SELECT
    cou.course_no,
    cou.description,
    cou.cost 
FROM
    courese cou
