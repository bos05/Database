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

--4 done
SELECT
    student_id,
    section_id,
    numeric_grade AS final_grade
FROM
    grade
WHERE 
    extract(MONTH from created_date) = '01'
--this will work if you input 03
--I looked through the data and couldn't find a january date in 2007
;


--5 done
SELECT
    to_char(to_date('January 11, 2016', 'Month DD, YYYY') + 109, 'DD-Mon_YYYY') AS end_of_sem
FROM
    dual
;

--6 done
SELECT
    course_no,
    section_id, 
    TO_CHAR(start_date_time, 'MM-DD-YYYY HH:MI') AS start_date
FROM
    section
WHERE
    course_no > 200
ORDER BY
    course_no
;

--7 done
SELECT
    last_name,
    first_name
FROM
    student
WHERE
    zip LIKE '11368'
    AND
    registration_date >= created_date + 3
;

--8
SELECT
    first_name,
    last_name,
    round(months_between(sysdate , created_date) / 12, 2) AS years
FROM
    student
WHERE
    phone LIKE '212%'
order by 
    years DESC
;


--9
SELECT DISTINCT 
    to_char(start_date_time, 'hh:mm') AS time
FROM
    section
;
--pretty sure this is right but like it is different from the reference table soooo


--10 done
SELECT
    student_id,
    section_id,
    to_char(enroll_date, 'hh:mm') AS enroll_time
FROM
    enrollment
WHERE
    to_char(enroll_date, 'hh:mm') = '10:19' 
ORDER BY
    student_id
;
--my query works when you put in other time like '10:01' 
--i don't think there are anny 10:19 enroll times





