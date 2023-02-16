--Boston Lingwall
--Feb 14th 2023
--SQL 3

--1-done
SELECT
    first_name,
    last_name,
    phone
FROM
    student
WHERE
    registration_date LIKE '02-FEB-07'
ORDER BY
    last_name
;

--2-done
SELECT
    course_no,
    section_id,
    start_date_time
FROM
    section
WHERE
    location LIKE 'L509'
ORDER BY 
    start_date_time
;

--3-done
SELECT
    course_no,
    section_id,
    start_date_time,
    instructor_id,
    capacity
FROM 
    section
WHERE 
    start_date_time like '%-JUL-07'
ORDER BY
    start_date_time,
    course_no
;

--4
SELECT
    student_id,
    section_id,
    numeric_grade AS final_grade
FROM
    grade
WHERE 
    created_date LIKE '%JAN-07'
;

--5
SELECT
    course_date = jan 11 16 = 109 days AS end_of_sem
FROM
    dual

--6
SELECT
    course_no,
    section_id, 
    start_date
FROM
    section
WHERE
    course_no > 100,
    coures_time between 9:30 & 11:30

--7
SELECT
    last_name,
    first_name
FROM
    student
WHERE
    zip LIKE '11368',
    registration_date <= create_date + 3

--8
SELECT
    first_name,
    last_name,
    SYDATE year - registration_date year AS years
FROM
    student
WHERE 
    area_code = 212

--9
SELECT DISTINCT
    start_date_time hour min
FROM
    section

--10
SELECT
    student_id,
    section_id,
    enroll_date AS enroll_time
FROM
    enrollmetn
ORDER BY 
    student-id




