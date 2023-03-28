--Boston Lingwall
--SQL 7
--March 28th

--1
SELECT
    ins.last_name,
    ins.first_name
FROM    
    isntructor ins
;

--2
SELECT  
    COUNT(*) AS below_average
FROM
    grade gra
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

