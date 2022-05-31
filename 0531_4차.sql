SELECT COUNT(salary)
FROM employees;


SELECT SUM(salary) 합계, SUM(salary) / COUNT(salary) 계산된_평균
FROM employees;

SELECT MAX(salary) 최대값 , MIN(salary) 최소값 , MAX(first_name) 최대문자값 , MIN(first_name) 최소문자값
FROM employees;

SELECT job_id 직무 , SUM(salary) 직무별_총급여 , AVG(salary) 직무별_평균급여
FROM employees
WHERE employee_id >= 10
GROUP BY job_id
ORDER BY 직무별_총급여 DESC, 직무별_평균급여;

SELECT job_id job_id_대그룹,
       manager_id manager_id_중그룹,
       SUM(salary) 그룹핑_총급여,
       AVG(salary) 그룹핑_평균급여
FROM   employees
WHERE  employee_id >= 10
GROUP BY job_id, manager_id ----job_id별로 한 번 그룹화하고 manager_id별로 다시 한 번 그룹화
ORDER BY 그룹핑_총급여 DESC, 그룹핑_평균급여;


SELECT job_id 직무 , SUM(salary) 직무별_총급여 , AVG(salary) 직무별_평균급여
FROM employees
WHERE employee_id >= 10
GROUP BY job_id
HAVING SUM(salary) > 30000
ORDER BY 직무별_총급여 DESC, 직무별_평균급여;

SELECT a.first_name, a.last_name, B.*
FROM employees A, job_history b
WHERE a.employee_id = b.employee_id
AND a.employee_id = 101;


SELECT
    a.employee_id, a.department_id, b.department_name, c.location_id, c.city
FROM employees A, departments B, locations C
WHERE a.department_id = b.department_id
AND b.location_id = c.location_id;


SELECT COUNT(*) 조인된건수
FROM employees A, departments B
WHERE a.department_id = b.department_id;


SELECT COUNT(*)
FROM employees;


SELECT a.department_id, a.first_name, a.last_name, b.department_id, b.department_name
FROM employees A, departments B
WHERE a.department_id = b.department_id(+)
ORDER BY a.employee_id;

SELECT a.department_id, a.first_name, a.last_name, b.department_id, b.department_name
FROM employees A, departments B
WHERE a.department_id(+) = b.department_id
ORDER BY a.employee_id;


SELECT a.department_id, a.first_name, a.last_name, a.manager_id,
       b.first_name||' '||b.last_name manager_name
FROM employees A, employees B
WHERE a.manager_id = b.employee_id
ORDER BY a.employee_id;