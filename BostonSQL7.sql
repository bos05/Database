--Boston Lingwall
--SQL 7
--March 28th

--1
SELECT
    ins.last_name,
    ins.first_name
FROM
    instructor ins
WHERE
    ins.instructor_id NOT IN
    (
        SELECT DISTINCT
            sec.instructor_id
        FROM
            section sec
        JOIN
            grade_type_weight gtw
        ON
            sec.section_id = gtw.section_id
        WHERE EXISTS
        (
            SELECT
                'x'
            FROM
                grade_type_weight gt
            WHERE
                gt.section_id = sec.section_id
                AND
                gtw.grade_type_code = 'PJ'
        )
    )
    ORDER BY
        ins.last_name
;
    

--2
sELECT
    COUNT(*) AS below_average
FROM
    grade gra
WHERE
    gra.grade_type_code = 'FI'
    AND 
    section_id = 89
    AND
    gra.numeric_grade <
    (
        SELECT
            AVG(gr.numeric_grade)AS average
        FROM
            grade gr
        WHERE
            gr.grade_type_code = 'FI'
            AND 
            gr.section_id = 89
    )
;

--3
SELECT
    zip.city,
    zip.state
FROM
    zipcode zip
;

--4
SELECT 
    stu.student_id,
    stu.first_name,
    stu.last_name
FROM
    student stu
;

--5
SELECT  
    stu.student_id.
    stu.first_name,
    stu.last_name
FROM    
    student stu
;

--6
SELECT
    ste.first_name,
    stu.last_name
FROM
    student stu
;

--7
SELECT
    cou.course_no,
    cou.course_description
FROM 
    course cou
;

--8
SELECT
    stu.first_name,
    stu.last_name
FROM
    student stu 
;

--9
SELECT
    stu.first_name,
    stu.last_name
FROM
    student stu
;

--10
SELECT
    stu.first_name,
    stu.last_name,
    stu.phone
FROM
    student stu
;

