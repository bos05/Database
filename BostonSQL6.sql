--Boston Lingwall
--SQL 6
--March 22 2023

--1
WITH num_students AS
(
    SELECT
        sec.instructor_id,
        COUNT(*) AS num_students
    FROM
        enrollment enr
    JOIN
        section sec
    ON
        sec.section_id = enr.section_id

    GROUP BY
        sec.instructor_id
)

SELECT 
    inst.instructor_id,
    inst.first_name,
    inst.last_name,
    num.num_students
FROM
    instructor inst
JOIN
    num_students num
ON
    num.instructor_id = inst.instructor_id

WHERE
    num.num_students >= 25
ORDER BY
    num.num_students DESC
;


--2
FROM    
    stu.student_id,
    stu.first_name,
    stu.last_name
SELECT
    student stu
;

--3
SELECT
    stu.first_name,
    stu.last_name,
    gra.grade_type_code
FROM
    student stu,
    grade gra
;

--4
SELECT
    stu.first_name,
    stu.last_name,
    gra.grade_type_code,
    gra.numeric_grade
FROM    
    student stu,
    grade gra
;

--5
SELECT  
    sec.section_id
    cou.description,
FROM
    section sec,
    course cou
;

--6
SELECT  
    zip.city,
    zip.state,
    zip.zip
FROM
    zpcode.zip 
;

--7
SELECT
    gra.grade_type_code
FROM 
    grade gra
;

--8
SELECT
    cou.description
FROM    
    course cou
;

--9
SELECT
    stu.student_id,
    stu.first_name,
    stu.last_name
FROM    
    student stu
;

--10
SELECT  
    stu.first_name, 
    stu.last_name, 
    gra.grade_type_code
FROM
    student stu, 
    grade gra
;
