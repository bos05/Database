--Boston Lingwall
--SQL 6
--March 22 2023

--1 --done
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


--2 done
WITH num_instructors AS
(
SELECT
    enr.student_id,
    count(*) AS num_instructors
FROM
    instructor inst
JOIN
    section sec
ON
    sec.instructor_id = inst.instructor_id
JOIN
    enrollment enr
ON
    enr.section_id = sec.section_id
GROUP BY
    enr.student_id
)
SELECT    
    stu.student_id,
    stu.first_name,
    stu.last_name,
    num_inst.num_instructors
FROM
    student stu
JOIN
    num_instructors num_inst
ON
    stu.student_id = num_inst.student_id
WHERE
    num_inst.num_instructors >= 3
ORDER BY
    num_inst.num_instructors DESC,
    last_name,
    first_name 
;


--3
WITH num_gtc AS 
(
    SELECT
        enr.student_id,
        gra.grade_type_code,
        count(*) AS num_gtc
    FROM
        enrollment enr
    JOIN
        grade gra
    ON
        enr.student_id = gra.student_id
        AND
        enr.section_id = gra.section_id
    GROUP BY
        enr.student_id,
        gra.grade_type_code
)
SELECT DISTINCT
    stu.first_name,
    stu.last_name,
    gra.grade_type_code,
    gtc.num_gtc
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
JOIN
    num_gtc gtc
ON
    enr.student_id = gtc.student_id
    AND
    gra.grade_type_code = gtc.grade_type_code
WHERE
    enr.section_id LIKE '147'
ORDER BY 
    stu.last_name,
    stu.last_name,
    gtc.num_gtc
    ;




--4– needs fixing
WITH avg_hm AS (
SELECT
    gra.student_id,
    AVG(gra.numeric_grade) AS avg_hm
FROM
    grade gra
WHERE 
    gra.grade_type_code LIKE 'HM'
GROUP BY
    gra.student_id
)


SELECT DISTINCT
    stu.first_name,
    stu.last_name,
    gra.grade_type_code AS gr,
    ROUND(hm.avg_hm, 2) AS average_grade
FROM    
     student stu
JOIN 
    enrollment enr
ON
     enr.student_id = stu.student_id
JOIN
     grade gra
ON
    gra.student_id = enr.student_id
    AND
     gra.section_id = enr.section_id
JOIN
     avg_hm hm
ON
      hm.student_id = enr.student_id
WHERE
     gra.grade_type_code LIKE 'HM'
    AND
     enr.section_id BETWEEN 110 AND 125
    AND
     hm.avg_hm > 80
ORDEr BY
    hm.avg_hm DESC,
    stu.last_name, 
    stu.first_name
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
