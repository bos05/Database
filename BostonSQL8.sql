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

--4 done
WITH count1 AS
(
SELECT
    stu.student_id,
    stu.first_name,
    stu.last_name,
    count(enro.enroll_date) AS most_classes
FROM
    enrollment enro
JOIN
    student stu
ON
    stu.student_id = enro.student_id
GROUP BY
    stu.student_id,
    stu.first_name,
    stu.last_name
)
SELECT
    student_id,
    first_name,
    last_name,
    most_classes
FROM
    count1
WHERE
    most_classes =
    (
        SELECT
            MAX(most_classes)
        FROM
            count1
    )
ORDER BY
    last_name,
    first_name
;

--5 done
WITH count1 AS
(
    SELECT
        stu.zip,
        count(enro.enroll_date) AS num_students
    FROM
        student stu
    JOIN
        enrollment enro
    ON
        enro.student_id = stu.student_id
    GROUP BY
        stu.zip
)
SELECT DISTINCT
    stu.first_name,
    stu.last_name,
    cou.num_students,
    stu.zip
FROM
    student stu
JOIN
    count1 cou
ON
    stu.zip = cou.zip
JOIN
    enrollment enro
ON
    enro.student_id = stu.student_id
WHERE
    num_students =
    (
        SELECT
            MAX(num_students)
        FROM
            count1
    )
ORDER BY
    last_name,
    first_name
    
;

--6 done
 SELECT
    cou.course_no,
    cou.description
FROM
    course cou
JOIN
    section sec
ON
    sec.course_no = cou.course_no
WHERE 
    sec.instructor_id = 104
ORDER BY
    cou.description
;

--7
SELECT
    stu.first_name,
    stu.last_name
FROM
    student stu

--8 done
SELECT DISTINCT
    stu.first_name,
    stu.last_name,
    cou.Description,
    sec.section_id
FROM
    student stu
JOIN
    enrollment enro
ON
    enro.student_id = stu.student_id
JOIN
    section sec
ON
    sec.section_id = enro.section_id
JOIN
    course cou
ON
    cou.course_no = sec.course_no
JOIN
    grade gra
ON
    gra.student_id = enro.student_id
    AND
    gra.section_id = enro.section_id
WHERE
    gra.grade_type_code LIKE 'MT'
    AND
    numeric_grade =
    (
    SELECT
        MIN(numeric_grade)
    FROM
        grade
    WHERE
        grade_type_code LIKE 'MT'
    )
ORDER BY
    stu.last_name,
    stu.first_name,
    cou.description
;

--9 done
WITH count1 AS
(
SELECT
    section_id,
    count(enroll_date) AS enrolled
FROM
    enrollment
GROUP BY
    section_id
)
SELECT
    cou.enrolled,
    sec.section_id,
    sec.capacity
    
FROM    
    section sec
JOIN
    count1 cou
ON
    cou.section_id = sec.section_id
WHERE
    cou.enrolled >= sec.capacity
ORDER BY
    cou.enrolled,
    sec.section_id

;

--10 done
SELECT
    cou.course_no,
    cou.description,
    cou.cost
FROM
    course cou
WHERE
    cou.cost =
    (
        SELECT
            MIN(cou.cost)
        FROM
            course cou
    )
ORDER BY
    cou.course_no,
    cou.description
;
