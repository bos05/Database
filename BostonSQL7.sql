--Boston Lingwall
--SQL 7
--March 28th

--1 --done
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
    

--2 --done
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

--3 --done
WITH sub AS
(
SELECT
    zip.city,
    zip.state,
    COUNT(stu.student_id) AS number_#
FROM
    student stu
JOIN
    zipcode zip
ON
    zip.zip = stu.zip
GROUP BY
     zip.city,
     zip.state
)

SELECT
    sub.city,
    sub.state
FROM
    sub
WHERE
    sub.number_# =
    (
        SELECT
            MAX(sub.number_#)
        FROM
            sub
    )




--4 --done
WITH sub_qary AS
(
    SELECT
        grade.grade_type_code,
        MIN(grade.numeric_grade) AS numeric_grade
    FROM
        grade
    GROUP BY
        grade.grade_type_code
)
SELECT
    stu.student_id,
    stu.first_name,
    stu.last_name,
    sub.numeric_grade
    
FROM
    student stu
JOIN
    enrollment enro
ON
    stu.student_id = enro.student_id
JOIN
    grade gra
ON
    gra.section_id = enro.section_id
    AND
    gra.student_id = enro.student_id
JOIN
    sub_qary sub
ON
    sub.grade_type_code = gra.grade_type_code
    AND
    sub.numeric_grade = gra.numeric_grade
WHERE
    gra.grade_type_code = 'FI'
    AND 
    gra.section_id = 89

;

--5 --done
SELECT DISTINCT
    stu.student_id,
    stu.last_name,
    stu.first_name
FROM 
    student stu
JOIN
    enrollment enr
ON
    stu.student_id = enr.student_id
JOIN
    section sec
ON
    enr.section_id = sec.section_id
JOIN
    course cou
ON
    sec.course_no = cou.course_no
WHERE
    stu.student_id IN
    (
        SELECT
            enr1.student_id
        FROM
            enrollment enr1
        JOIN
            enrollment enr2
        ON
            enr1.student_id = enr2.student_id
            AND enr1.section_id <> enr2.section_id
        JOIN
            section sec1
        ON
            enr1.section_id = sec1.section_id
        JOIN
            section sec2
        ON
            enr2.section_id = sec2.section_id
        WHERE
            sec1.course_no = sec2.course_no
        GROUP BY
            enr1.student_id
        HAVING
            COUNT(DISTINCT sec1.section_id) > 1
    )
ORDER BY
    stu.last_name,
    stu.first_name;

--6 --kind of done
SELECT
    stu.first_name,
    stu.last_name,
    COUNT(sec.course_no) AS number_#
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
WHERE
    course_no BETWEEN 300 AND 399
    
GROUP BY
    stu.first_name,
    stu.last_name
ORDER BY
    last_name
;

--7 --done
WITH sub AS
(
    SELECT
        cou.course_no,
        cou.description,
        COUNT(student_id) AS student_amount
    FROM 
        course cou
    JOIN
        section sec
    ON
        cou.course_no = sec.course_no
    JOIN
        enrollment enr
    ON
        sec.section_id = enr.section_id
    GROUP BY
        cou.course_no,
        cou.description
)
SELECT
    course_no,
    description
FROM
    sub 
WHERE
    sub.student_amount =
    (
        SELECT
            MAX(sub.student_amount)
        FROM
            sub
    )
;


--8 --done
SELECT DISTINCT
    stu.first_name,
    stu.last_name
FROM 
    student stu
JOIN
    enrollment enr
ON
    stu.student_id = enr.student_id
JOIN
    section sec
ON
    enr.section_id = sec.section_id
WHERE
    sec.course_no = ANY
    (
        SELECT DISTINCT
            cou.course_no
        FROM
            course cou
        JOIN 
            section sec
        ON
            cou.course_no = sec.course_no
        JOIN
            enrollment enr
        ON
            sec.section_id = enr.section_id
        WHERE
            TO_CHAR(sec.start_date_time, 'hh24:mi') = '10:30'
        

    )
ORDER BY
    stu.last_name
;

--9 -- done
SELECT
    stu.first_name,
    stu.last_name,
    gra.numeric_grade
FROM
    student stu
JOIN
    enrollment enr
ON
    stu.student_id = enr.student_id
JOIN
    grade gra
ON
    enr.student_id = gra.student_id
    AND
    enr.section_id = gra.section_id
WHERE
    gra.grade_type_code = 'FI'
    AND
    gra.section_id = 89
    AND
    gra.numeric_grade < 
    (
        SELECT 
            AVG(gra.numeric_grade) AS avg_grade
        FROM 
            grade gra
        WHERE
            gra.grade_type_code = 'FI'
            AND 
            gra.section_id = 89
    )
ORDER BY
    gra.numeric_grade DESC,
    stu.last_name,
    stu.first_name
;

--10 --done
SELECT
    stu.first_name,
    stu.last_name,
    stu.phone
FROM
    student stu
JOIN
    enrollment enr
ON
    stu.student_id = enr.student_id
JOIN
    section sec
ON
    enr.section_id = sec.section_id
JOIN
    course cou
ON
    sec.course_no = cou.course_no
WHERE
    cou.description LIKE 'Intro to SQL'
    OR
    cou.description LIKE 'Oracle Tools'
    OR
    cou.description LIKE 'PL/SQL Programming'
    OR
    cou.description LIKE 'Database Design'
    OR
    cou.description LIKE 'Database System Principles'
    OR
    cou.description LIKE 'DB Programming with Java'

ORDER BY
    stu.last_name
    
    
;

