SELECT * FROM employees; 

SELECT employee_id , first_name , last_name FROM employees ORDER BY employee_id DESC;

SELECT DISTINCT job_id FROM employees;

SELECT employee_id AS 사원번호 , first_name AS 이름 , last_name AS 성 FROM employees;

SELECT employee_id ,first_name || last_name FROM employees;

SELECT employee_id, first_name || ' ' || last_name,
       email || '@company.com'
FROM employees;

SELECT employee_id AS 사원번호, 
       salary AS 급여, 
       salary+500 AS 추가급여, 
       salary-100 AS 인하, 
       (salary*1.1)/2 AS 조정급여 
FROM employees;

SELECT * FROM employees WHERE employee_id = 100;

SELECT * FROM employees WHERE first_name = 'David';

SELECT * FROM employees WHERE employee_id >= 105;

SELECT * FROM employees WHERE salary IN(10000 , 17000 , 24000);

SELECT * FROM employees WHERE job_id LIKE 'AD%';

-- job_id AD이후 3글자
SELECT * FROM employees WHERE job_id LIKE 'AD___';

SELECT * FROM employees WHERE salary >400 AND job_id = 'IT_PROG';

SELECT 
UPPER(last_name) UPPER적용 , 
LOWER(last_name) LOWER적용 , 
INITCAP(email),
INITCAP(last_name) 
FROM employees;  

SELECT job_id , SUBSTR(job_id ,1 ,2) 적용결과 FROM employees;

SELECT job_id , REPLACE(job_id , 'ACCOUNT' , 'ACCNT') 적용결과 FROM employees;

SELECT first_name , LPAD(first_name , 12 , '*') FROM employees;

SELECT 'start'||TRIM('  -space-  ')||'end' 제거된_공백 FROM dual;

SELECT salary , 
       salary/30 일급,
       TRUNC(salary/30 ,0) 적용결과0,
       TRUNC(salary/30 , 1) 적용결과1,
       TRUNC(salary/30 , -1) 적용결과2
FROM employees;





