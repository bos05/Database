--BOston Lingwall
--sql 9
--APRIL 19TH
 

--1
SELECT
    stu.student_id,
    stu.last_name,
    stu.first_name
FROM
    student stu
;

--2
SELECT
    ins.zip,
    ins.first_name,
    ins.last_name
FROM
    instructor ins
;

--3(combine with SET OPeration)
SELECT
    stu.first_name,
    stu.last_name
FROM
    student stu
;

--4
SELECT
    sec.location
FROM
    section
;

--5
SELECT
    gra.grade_type_code,
    gra.numeric_grade
FROM
    grade gra
;

--6
SELECT
    ins.first_name,
    ins.last_name
FROM
    instructor ins
;

--7
SELECT
    cou.course_no,
    cou.description
FROM
    course cou
;

--8
SELECT
    zip.zip,
    zip.city
FROM
    zipcode zip
;

--9
SELECT
    cou.course_no,
    cou.description
FROM
    course cou
;

--10
SELECT
    stu.student_id,
    stu.first_name,
    stu.last_name
FROM
    student stu
;