--Boston Lingwall
--SQL 8
--APRIL 10TH

--1
SELECT  
    stu.first_name,
    stu.last_name
FROM
    student stu
;

--2
SELECT  
    cou.description,
    sec.section_no,
    cou.cost,
    sec.capacity
FROM    
    course cou, 
    section sec
;

--3
SELECT 
    cou.course_no,
    cou.description,
    sec.capacity
FROM
    course cou,
    section sec

--4
SELECT
    stu.student_id,
    stu.first_name,
    stu.last_name,
    most_classes
FROM 
    student stu
;

--5
SELECT
    stu.first_name,
    stu.last_name
FROM
    student stu
;

--6 
SELECT
    cou.course_no,
    cour.description
FROM    
    course cou

--7
SELECT
    stu.first_name,
    stu.last_name
FROM
    student stu

--8
SELECT
    stu.first_name,
    stu.last_name,
    cou.description,
    sec.section_id
FROM    
    student stu,
    course cou,
    section sec

--9
SELECT
    sec.section_id,
    sec.capacity
FROM
    section sec

--10
SELECT
    cou.course_no,
    cou.description,
    cou.cost 
FROM
    courese cou
