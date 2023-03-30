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


--3 done
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
    gtc.num_gtc DESC
;



--4– done
WITH avg_hm AS 
(
SELECT
    gra.student_id,
    ROUND(AVG(gra.numeric_grade), 2) AS avg_hm
FROM
    grade gra
WHERE 
    gra.grade_type_code LIKE 'HM'
    AND
    gra.section_id BETWEEN 110 AND 125-- you need to havel the same limiters in suqery
GROUP BY
    gra.student_id
)


SELECT DISTINCT
    stu.first_name,
    stu.last_name,
    gra.grade_type_code AS gr,
    hm.avg_hm AS average_grade
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
ORDER BY
    hm.avg_hm DESC,
    stu.last_name, 
    stu.first_name
;



--5 done
WITH num_codes_count AS
(
SELECT DISTINCT
    section_id,
    COUNT(*) AS num_codes
FROM
    grade_type_weight
GROUP BY
    section_id
)
SELECT
    sec.section_id,
    cou.description,
    cod.num_codes
FROM
    section sec
JOIN
    course cou
ON
    cou.course_no = sec.course_no
JOIN
    num_codes_count cod
ON
    cod.section_id = sec.section_id
WHERE
    sec.section_id < 100
    AND
    cod.num_codes >2
ORDER BY
    cou.description,
    cod.num_codes,
    sec.section_id
;

--6 done
WITH intructor_per_zip AS
(
SELECT
    zip.zip,
    COUNT(ins.instructor_id) AS instructor_per_zip
FROM
    instructor ins
JOIN
    zipcode zip
ON
    ins.zip = zip.zip
GROUP BY
    zip.zip
)
SELECT DISTINCT
    zipp.city,
    zipp.state,
    zipp.zip,
    ipz.instructor_per_zip
FROM
    zipcode zipp 
JOIN
    instructor ins
ON
    zipp.zip = ins.zip
JOIN
    intructor_per_zip ipz
ON
    zipp.zip = ipz.zip
WHERE
    ipz.instructor_per_zip > 1
ORDER BY
    ipz.instructor_per_zip DESC
;

--7 -fix
WITH num_grades AS
(
SELECT
    gra.description,
    COUNT(*) AS numgrades
FROM
    grade_type gra
GROUP BY
    gra.description
)
SELECT
    description
FROM
    grade_type

;

--8
WITH num_students  AS
(
SELECT
    cou.description,
    COUNT(enr.student_id) AS num_students
FROM
    enrollment enr
JOIN
    section sec
ON
    enr.section_id = sec.section_id
JOIN
    course cou
ON
    sec.course_no = cou.course_no
GROUP BY
    cou.description
)
SELECT
    cou.description,
    ns.num_students
FROM
    course cou
JOIN
    num_students ns
ON
    cou.description = ns.description
WHERE
    ns.num_students > 10
ORDER BY
    ns.num_students
;

--9
SELECT
    stu.student_id,
    stu.first_name,
    stu.last_name
FROM    
    student stu
;

--10-done
WITH num_students AS
(
SELECT
    gra.grade_type_code,
    enr.student_id,
    COUNT(*) AS num_students
FROM
    enrollment enr
JOIN
    grade gra
ON
    enr.student_id = gra.student_id
    AND
    enr.section_id = gra.section_id
HAVING
    COUNT(*) > 10
group by
    enr.student_id,
    gra.grade_type_code


)

SELECT DISTINCT
    stu.first_name,
    stu.last_name,
    gra.grade_type_code,
    ns.num_students
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
    num_students ns
ON
    enr.student_id = ns.student_id
    AND
    gra.grade_type_code = ns.grade_type_code
WHERE
    ns.num_students > 10
ORDER BY
    stu.first_name,
    stu.last_name
    

