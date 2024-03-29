--Boston Lingwall
--SQL 8
--04/24/23

--1 --insert --done
INSERT INTO 
    instructor
    
(
    instructor_id,
    salutation,
    first_name, 
    last_name,
    street_address,
    zip,
    phone, 
    created_by,
    created_date,
    modified_by,
    modified_date
    
)
VALUES
(
    815,
    'Mr',
    'Hugo',
    'Reyes',
    '2342 Ocreanic Way',
    '07002',
    null,
    'ME >:)',
    SYSDATE,
    'ME >:(',
    SYSDATE
)
;
--2 --insert --done
INSERT INTO
    section
(
    section_id,
    course_no, 
    section_no, 
    start_date_time, 
    location,
    instructor_id,
    capacity, 
    created_by,
    created_date,
    modified_by,
    modified_date
)
VALUES
(
    48,
    142,
    4,
    TO_DATE('22-SEP-11 8:15', 'dd-MONTH-yy hh:mi'),
    'L211',
    815,
    15, 
    'ME>:)',
    SYSDATE,
    'ME:>:(',
    SYSDATE
    
)
;
--3 --insert --done
INSERT INTO 
enrollment (
    student_id, 
    section_id,
    enroll_date, 
    final_grade,
    created_by,
    created_date,
    modified_by,
    modified_date
)
WITH p AS
(
    SELECT 375 as student_id, 48 as section_id, SYSDATE as enroll_date, null as final_grade, 'ME>:)' as created_by, SYSDATE as created_date, 'ME>:)' as modified_by, SYSDATE as modified_date  FROM dual UNION ALL
    SELECT 137, 48, SYSDATE, null, 'ME>:)', SYSDATE, 'ME>:)', SYSDATE  FROM dual UNION ALL
    SELECT 266, 48, SYSDATE, null, 'ME>:)', SYSDATE, 'ME>:)', SYSDATE  FROM dual UNION ALL
    SELECT 282, 48, SYSDATE, null, 'ME>:)', SYSDATE, 'ME>:)', SYSDATE  FROM dual

)
SELECT p.student_id, p.section_id, p.enroll_date, p.final_grade, p.created_by, p.created_date, p.modified_by, p.modified_date FROM p;

--4 --delete
DELETE FROM
    grade
WHERE
    student_id = 147
    AND 
    section_id = 120
;


DELETE FROM
    enrollment
WHERE
    student_id = 147
    AND 
    section_id = 120
;
--5 --delete
DELETE FROM
    grade
WHERE
    student_id = 180
    AND 
    section_id = 119
;


DELETE FROM
    enrollment
WHERE
    student_id = 180
    AND 
    section_id = 119
;
--6 --update
UPDATE
    instructor
SET
    phone = 4815162342
WHERE
    instructor_id = 815
;
    

--7 --update
UPDATE
    grade
SET
    numeric_grade = 100
WHERE
    section_id = 119
    AND
    grade_type_code = 'HM'
    AND
    grade_code_occurrence = 1
;
--8 --update
UPDATE
    grade
SET
    numeric_grade = (numeric_grade * 1.1)
WHERE
    section_id = 119
    AND
    grade_type_code = 'FI'
;
--9 --partially done I am missing one of the section_ids
SELECT
    sec.section_id,
    sec.location,
    COUNT(DISTINCT enr.student_id) AS enrolled
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
WHERE
    cou.description LIKE 'Project Management'
GROUP BY
    sec.section_id,
    sec.location
ORDER BY
    sec.section_id;

--10 --done
SELECT
    ins.first_name, 
    ins.last_name, 
    ins.phone
FROM
    instructor ins
JOIN
    section sec
ON
    ins.instructor_id = sec.instructor_id
JOIN
    course cou
ON
    sec.course_no = cou.course_no
WHERE
    cou.description like 'Project Management'
ORDER BY
    ins.first_name
;
--11 --done
SELECT
    stu.student_id,
    stu.first_name, 
    stu.last_name,
    AVG(gra.numeric_grade) as average
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
    enr.section_id = 119
GROUP BY
    stu.student_id,
    stu.first_name, 
    stu.last_name
;

--12 --done
WITH num_stu AS 
(
  SELECT
    enr.student_id,
    COUNT(*) AS student_num
  FROM
    enrollment enr
  JOIN
    section sec
  ON
    enr.section_id = sec.section_id
  WHERE
    sec.location LIKE 'L211'
  GROUP BY
    enr.student_id,
    sec.course_no
), 
num_inst AS 
(
  SELECT  
    ins.instructor_id,
    sec.course_no
  FROM  
    instructor ins
  JOIN
    section sec
  ON
    ins.instructor_id = sec.instructor_id
  JOIN
    enrollment enr
  ON
    sec.section_id = enr.section_id
  JOIN
    num_stu ns
  ON
    enr.student_id = ns.student_id
  WHERE   
    sec.location LIKE 'L211'
  GROUP BY
    ins.instructor_id,
    sec.course_no
  HAVING
    SUM(ns.student_num) > 3
)
SELECT
    COUNT(*) AS num_instructors
FROM 
    num_inst
;

--13 --done
WITH num_course as
(
SELECT
    ins.instructor_id,
    COUNT(DISTINCT sec.course_no) AS num_course
FROM
    section sec
JOIN
    instructor ins
ON
    sec.instructor_id = ins.instructor_id
GROUP BY
    ins.instructor_id

)


SELECT
    (ins.salutation || ' ' ||ins.first_name || ' ' ||ins.last_name) AS instructor,
    ins.phone
FROM
    instructor ins
JOIN
    section sec
ON
    ins.instructor_id = sec.instructor_id
JOIN
    num_course nc
ON
    ins.instructor_id = nc.instructor_id
    AND 
    sec.instructor_id = nc.instructor_id
WHERE
    sec.course_no = 142
    AND
    nc.num_course <= 1
    
;

--14
SELECT
    stu.first_name,
    stu.last_anme,
    enr.section_id,
    sec.course_no
FROM    
    student stu,
    enrollment enr,
    section sec
;
--15
SELECT
    start_time, 
    num_of_courses
FROM
    section sec
;