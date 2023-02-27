--Boston Lignwall
--Feb 21rst 2023
--SQL 4

--1 -- done
SELECT
    ROUND(AVG(cost), 2)
FROM 
    course
;

--2 -- done
SELECt
    count(*) AS Febuary_Registrations
FROM
    enrollment
WHERE
    enroll_date like '%FEB-07%'
--idk why but the number don't completly line up but this is the correct query i think
;

--3--done
SELECT
    ROUND(AVG(numeric_grade), 1) AS Average,
    MAX(numeric_grade) AS Highest,
    MIN(numeric_grade) AS Lowest
FROM
    grade
WHERE 
    grade_type_code like 'FI'
    AND
    section_id = '141'
;

--4
SELECT
    city,
    state,
    count(*) AS zipcode
FROM
    zipcode
WHERE
    zip < 100
;

--5
SELECT
    section_id
FROM
    enrollment
;

--6
SELECT
    student_id,
    section_id
FROM
    grade
;

--7
SELECT
    student_id
FROM
    section
;

--8
SELECT 
    section_id
FROM
    grade
;

--9
SELECT
    employer
FROM
    student
;

--10
SELECT
    section_id
FROM 
    grade
;