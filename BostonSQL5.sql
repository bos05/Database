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

--2
SELECT
    cou.course_no,
    cou.description,
    cou.prerequisite,
    cour.description
FROM
    course cou
JOIN

ON 
    cou.course_no = cour.course_no
;
--3