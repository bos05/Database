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

--2--can not figure out how to have two descriptions
SELECT
    course.course_no,
    course.description,
    course.prerequisite,
    course.description
FROM
    course course
WHERE 
    course_no BETWEEN 300 AND 399
    AND
    prerequisite IS NOT NULL
GROUP BY
    prerequisite

;

--3--gives to many things for some reason
SELECT
    cou.course_no,
    cou.description, 
    inst.first_name,
    inst.last_name
FROM
    course cou, instructor inst

WHERE 
    cou.course_no BETWEEN 100 AND 199
    AND
    inst.first_name = 'Charles'
    AND
    inst.last_name = 'Lowry'
   
;
--4 --can not figure this out ahhhhhhhhh
SELECT
    gtw.grade_type_code AS grade,
    gt.description,
    COUNT(*) AS number_per_section
FROM
    grade_type gt
JOIN 
    grade_type_weight gtw
ON
    gt.grade_type_code = gtw.grade_type_code
JOIN
    section sec
ON
    gtw.section_id = sec.section_id
WHERE
    sec.course_no = 144
GROUP BY 
    gtw.grade_type_code
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
