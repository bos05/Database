--Boston Lingwall
--SQL 8
--04/24/23

--1 --insert

--2 --insert

--3 --insert

--4 --delete

--5 --delete

--6 --update

--7 --update

--8 --update

--9
SELECT
    enr.section_id,
    loation, 
    enrolled
FROM
    enrollment enr
;
--10
SELECT
    ins.first_name, 
    ins.last_name, 
    ins.phone
FROM
    instructor ins
;
--11
SELECT
    stu.student_id,
    stu.first_name, 
    stu.last_name,
    avg_grade
FROM    
    student stu
;
--12
SELECT  
    num_of_instructors
FROM  
    instructor ins
;
--13
SELECT
    ins.instructor,
    ins.phone
FROM
    instructor ins
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