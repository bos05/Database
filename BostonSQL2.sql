-- Boston Lingwall
-- February 13th 2023
--SQL 2

-- 1 

SELECT 
	(first_name || ' ' || last_name) AS STUDENT_NAME,
    	phone,
    	zip
FROM
	student
WHERE
    	employer = 'New York Culture'
ORDER BY
    	last_name ASC
;

-- 2 

SELECT DISTINCT
	employer
FROM
	student
WHERE
	employer LIKE '%Co.'
ORDER BY
    	employer
;

-- 3 

SELECT
	UPPER(last_name || ' ' || SUBSTR(first_name, 1,1)) AS student_name,
	LPAD(phone, 17, '*'),
	street_address
FROM
	student
WHERE
    phone LIKE '203%'
ORDER BY 
    student_name ASC
;

-- 4 

SELECT
	(first_name || ' ' || last_name) AS instructor,
	street_address
FROM
	instructor
WHERE
	zip IS NULL
	
;

-- 5 

SELECT
	zip
FROM
	zipcode
WHERE
	city Like 'Jersey City' AND state LIKE 'NJ'
ORDER BY
	zip
;

-- 6 done

SELECT
	course_no,
	description,
	cost
FROM
	course
WHERE
	MOD(prerequisite, 2) <> 0
ORDER BY
	course_no
;

-- 7 

SELECT 
    CASE
        WHEN state = 'FL' THEN 'Florida'
        WHEN state = 'MI' THEN 'michigan'
        WHEN state = 'PR' THEN 'puerto rico'
        WHEN state = 'WV' THEN 'west virginia'
    END as full_state_name,
    state AS st,
	city
FROM
	zipcode
WHERE
    state = 'FL'
    OR
    state = 'MI'
    OR
    state = 'PR'
    OR
    state = 'WV'
ORDER BY
    state
;


-- 8

SELECT
	(salutation || ' ' || first_name || ' ' || last_name || ' ' || street_address || ' ' || zip) AS instructor_address
    
FROM
	instructor
    
WHERE
    zip = 10015
    
ORDER BY
    instructor_address
;

-- 9

SELECT
	student_id,
	numeric_grade

FROM
	grade

WHERE
    section_id = 119 AND grade_type_code = 'QZ'

ORDER BY
    numeric_grade DESC
;

-- 10

SELECT
	student_id,
	numeric_grade,
    CASE
        WHEN numeric_grade >= 85 THEN 'pass'
        ELSE 'fail'
    END as result

FROM
	grade

WHERE
    section_id = 87 AND grade_type_code = 'FI'

ORDER BY
    student_id DESC
;





