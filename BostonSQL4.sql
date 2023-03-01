--Boston Lingwall
--Feb 21rst 2023
--SQL 4

--1 -- done
SELECT
    ROUND(AVG(cost), 2)
FROM 
    course
;

--2 -- done
SELECt
    count(*) AS Febuary_Registrations
FROM
    enrollment
WHERE
    enroll_date like '%FEB-07%'
--idk why but the number don't completly line up but this is the correct query i think
;

--3--done
SELECT
    ROUND(AVG(numeric_grade), 1) AS Average,
    MAX(numeric_grade) AS Highest,
    MIN(numeric_grade) AS Lowest
FROM
    grade
WHERE 
    grade_type_code like 'FI'
    AND
    section_id = '141'
;

-- 4 done

SELECT 
    city,
    state AS st,
    COUNT(zip) AS zipcodes
FROM
    zipcode
GROUP BY
    state,
    city
HAVING
    COUNT(zip) > 3
ORDER BY
    COUNT(zip) desc, city desc
;  
-- 5 

SELECT
    section_id,
    COUNT(*) AS enrolled
FROM
    enrollment
WHERE
    enroll_date LIKE '21-FEB-07'
GROUP BY
    section_id
ORDER BY
    enrolled desc
; 
    
-- 6 done

SELECT
    student_id,
    section_id,
    CAST(AVG(numeric_grade) AS DECIMAL(10, 4)) AS Average_grade
FROM
    grade
WHERE
    section_id LIKE '147'
GROUP BY
    student_id,
    section_id
ORDER BY
    student_id
; 

--7--done
SELECT
    student_id,
    COUNT(section_id) AS section
FROM
    enrollment
WHERE
     student_id IN (214, 215, 232, 238)
GROUP BY
    student_id
;

--8-done
SELECT 
    section_id,
    MIN(numeric_grade) AS lowscore
FROM
    grade
WHERE
    grade_type_code like 'QZ'
GROUP BY
    section_id
HAVING 
    min(numeric_grade) > 80
ORDER BY
    section_id
;

--9
SELECT DISTINCT
    employer,
    COUNT(student_id) AS employee
FROM
    student
GROUP BY
    employer
HAVING
    COUNT(student_id) >= 6
ORDER BY
    employee DESC
;

--10--done
SELECT
    section_id,
    COUNT(numeric_grade) AS participation_grade,
    MIN(numeric_grade) AS lowest_grade
FROM 
    grade
WHERE
    grade_type_code like 'PA'
GROUP BY
    section_id
HAVING
    COUNT(numeric_grade) >= 15
ORDER BY
    section_id
;