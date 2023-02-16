-- Boston Lingwall
-- January 27th 2023
--SQL 1

-- 1 
SELECT
	salutation, 
	first_name, 
	last_name
FROM
	instructor
ORDER BY
	last_name ASC
; 

-- 2 
SELECT
	location
FROM
	section
GROUP BY
	location 
ORDER BY
	location ASC
;

-- 3 

SELECT
	first_name,
	last_name
FROM
	instructor
WHERE
	first_name LIKE 'T%'
ORDER BY
	first_name
;

-- 4 

SELECT
	phone,
	(first_name || ' ' || last_name) AS FULLNAME,
    	employer
FROM
	student
WHERE
    	last_name LIKE 'Torres'
ORDER BY 
    	employer
;
-- 5

SELECT
	course_no,
	description
FROM
	course

WHERE
    prerequisite = 350 

ORDER BY
	course_no 
;
	
-- 6 

SELECT
	course_no,
	description,
	cost
	
FROM
	course
WHERE
	course_no >= 200 AND course_no < 300 AND cost < 1100
;


-- 7 

SELECT
	course_no,
	section_id,
	location
FROM
	section
WHERE
	course_no >= 100 AND course_no < 200 AND (location = 'L214' OR location = 'L509')
ORDER BY
	location ASC, course_no ASC 
;



-- 8 

SELECT
	course_no,
	section_id,
	capacity
FROM
	section
WHERE
	capacity IN (12, 15)
ORDER BY
	course_no,
    	section_id
;

-- 9

SELECT
	student_id,
	numeric_grade
FROM
	grade
WHERE
	grade_type_code = 'MT' AND section_id = 141
ORDER BY
	student_id,
    	numeric_grade
;
-- 10

SELECT
	course_no,
	description
FROM
	course
WHERE
	course_no BETWEEN 300 AND 399 AND prerequisite IS NOT NULL
ORDER BY
	description
;



