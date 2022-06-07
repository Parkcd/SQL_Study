SELECT department_id
FROM employees
UNION
SELECT department_id
FROM departments;

SELECT department_id
FROM employees
UNION ALL
SELECT department_id
FROM departments;

SELECT department_id
FROM employees
INTERSECT
SELECT department_id
FROM departments;

SELECT 
   *
FROM employees A
WHERE a.salary = (SELECT salary 
                  FROM employees
                  WHERE last_name = 'De Haan');


SELECT
   *
FROM employees A
WHERE a.salary = 17000;
--위의 코드와 동일한 결과가 출력됨

--** 다중행 = 가 아니고 IN을 사용해 출력하면 됨.
SELECT 
   *
FROM employees A
WHERE a.salary IN (SELECT salary 
                  FROM employees
                  WHERE last_name = 'Taylor');
                  
SELECT 
  *
FROM employees A
WHERE A.salary IN(SELECT MIN(salary) 최저급여
                  FROM employees
                  GROUP BY department_id)
ORDER BY A.salary DESC;


SELECT 
  *
FROM employees A
WHERE (a.job_id , a.salary) 
                  IN(
                  SELECT job_id , MIN(salary) 그룹별_급여
                  FROM employees
                  GROUP BY job_id
                    )
ORDER BY A.salary DESC;

SELECT  *
FROM employees A,
               ( SELECT department_id
                 FROM departments
                 WHERE department_name = 'IT' )B -- B는 가상 view 임(인라인뷰 라고함)
WHERE A.department_id = B.department_id;


INSERT INTO departments (department_id, department_name , manager_id, location_id)
VALUES (271 , 'Sample_Dept' , 200 , 1700);

SELECT
   *
FROM departments
ORDER BY department_id desc;

commit;

UPDATE departments 
SET manager_id = 201,
    location_id = 1800
WHERE department_name = 'Sample_Dept';

SELECT
    *
FROM departments
WHERE department_id =40;
