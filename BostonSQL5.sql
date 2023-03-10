--Boston Lingwall
--SQL 5
--March 3rd 2023

--1 -- done
SELECT
    stu.first_name,
    stu.last_name,
    stu.phone
FROM
    student stu
JOIN 
    zipcode zip
ON 
    zip.zip = stu.zip
WHERE 
    zip.city LIKE '%Newark'
    AND 
    zip.state LIKE '%NJ'
ORDER BY
    stu.last_name,
    stu.first_name
;

--2 done
SELECT
    cou.course_no,
    cou.description,
    cou.prerequisite,
    pre.description
FROM
    course cou
JOIN
    course pre
ON
    pre.course_no = cou.prerequisite
WHERE 
    cou.course_no BETWEEN 300 AND 399
    AND
    cou.prerequisite IS NOT NULL
ORDER BY
    cou.prerequisite DESC

;

--3--done
SELECT
    cour.course_no,
    cour.description
FROM
    course cour
JOIN
    section sec
ON
    sec.course_no = cour.course_no
JOIN
    instructor inst
ON
    sec.instructor_id = inst.instructor_id
WHERE
    cour.course_no BETWEEN 100 AND 199
    AND
    first_name LIKE 'Charles'
    AND
    last_name = 'Lowry'
ORDER BY
    course_no
;

--4 --done
SELECT
    grad.grade_type_code AS grade,
    grad.description,
    wei.number_per_section

FROM
    grade_type grad
JOIN
    grade_type_weight wei
ON
    grad.grade_type_code = wei.grade_type_code
JOIN
    section sec
ON
    wei.section_id = sec.section_id
WHERE
    course_no = 144
;
    
--5 --done
SELECT DISTINCT
    stu.first_name,
    stu.last_name,
    TO_CHAR(enr.enroll_date, 'DAY MONTH dd, YYYY HH:MI') 
FROM
    student stu
JOIN
    enrollment enr
ON
    stu.student_id = enr.student_id
WHERE 
    TO_CHAR(enr.enroll_date, 'MM') LIKE '01'
    AND
    TO_CHAR(enr.enroll_date, 'YYYY') LIKE '2007'
ORDER BY 
    stu.last_name,
    stu.first_name
;  

--6 --done
SELECT
    (stu.last_name || ', ' || stu.first_name) AS full_name,
    TO_CHAR(enr.enroll_date, 'MM/DD/YYYY'),
    cour.course_no,
    gtw.grade_type_code,
    gra.numeric_grade
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
    course cour
ON 
    sec.course_no = cour.course_no
JOIN
    grade_type_weight gtw
ON
    sec.section_id = gtw.section_id
    
JOIN
    grade gra
ON
    gtw.section_id = gra.section_id
    AND 
    enr.student_id = gra.student_id
    AND
    gra.grade_type_code = gtw.grade_type_code
WHERE
    stu.last_name LIKE 'H%'
ORDER BY
    full_name
;

--7 --done
SELECT
    sec.section_id,
    sec.section_no,
    cour.description
FROM
    section sec
JOIN 
    course cour
ON 
    sec.course_no = cour.course_no
WHERE
    cour.prerequisite IS NULL
;

--8 --done
SELECT DISTINCT
    stu.first_name,
    stu.last_name,
    stu.phone
FROM 
    student stu
JOIN
    zipcode zip
ON
    stu.zip = zip.zip
JOIN 
    enrollment enr
ON
    stu.student_id = enr.section_id
WHERE
    zip.state LIKE 'NY'
    AND 
    zip.city LIKE 'Flushing'
    AND
    TO_DATE(enr.enroll_date, 'YYYY-MM-DD-HH-MI') < TO_Date('2007-02-02-10-20', 'YYYY-MM-DD-HH-MI')
ORDER BY 
    stu.last_name
;
--9 --done
SELECT
    cou.course_no,
    cou.description
FROM
    course cou
JOIN
    section sec
ON
    sec.course_no = cou.course_no
JOIN
    grade_type_weight gtw
ON
    gtw.section_id = sec.section_id
WHERE   
    grade_type_code = 'PJ'
;
--10 --done
SELECT
    gra.section_id,
    gra.grade_type_code AS code,
    gra.numeric_grade
FROM
    grade gra
JOIN
    grade_type_weight gtw
ON
    gra.grade_type_code = gtw.grade_type_code
    AND
    gra.section_id = gtw.section_id
WHERE
    gtw.grade_type_code = 'QZ'
    AND
    drop_lowest = 'N'
    AND
    numeric_grade < 76
ORDER BY
    section_id
;
