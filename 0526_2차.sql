SELECT * FROM employees; 

SELECT employee_id , first_name , last_name FROM employees ORDER BY employee_id DESC;

SELECT DISTINCT job_id FROM employees;

SELECT employee_id AS �����ȣ , first_name AS �̸� , last_name AS �� FROM employees;

SELECT employee_id ,first_name || last_name FROM employees;

SELECT employee_id, first_name || ' ' || last_name,
       email || '@company.com'
FROM employees;

SELECT employee_id AS �����ȣ, 
       salary AS �޿�, 
       salary+500 AS �߰��޿�, 
       salary-100 AS ����, 
       (salary*1.1)/2 AS �����޿� 
FROM employees;

SELECT * FROM employees WHERE employee_id = 100;

SELECT * FROM employees WHERE first_name = 'David';

SELECT * FROM employees WHERE employee_id >= 105;

SELECT * FROM employees WHERE salary IN(10000 , 17000 , 24000);

SELECT * FROM employees WHERE job_id LIKE 'AD%';

-- job_id AD���� 3����
SELECT * FROM employees WHERE job_id LIKE 'AD___';

SELECT * FROM employees WHERE salary >400 AND job_id = 'IT_PROG';

SELECT 
UPPER(last_name) UPPER���� , 
LOWER(last_name) LOWER���� , 
INITCAP(email),
INITCAP(last_name) 
FROM employees;  

SELECT job_id , SUBSTR(job_id ,1 ,2) ������ FROM employees;

SELECT job_id , REPLACE(job_id , 'ACCOUNT' , 'ACCNT') ������ FROM employees;

SELECT first_name , LPAD(first_name , 12 , '*') FROM employees;

SELECT 'start'||TRIM('  -space-  ')||'end' ���ŵ�_���� FROM dual;

SELECT salary , 
       salary/30 �ϱ�,
       TRUNC(salary/30 ,0) ������0,
       TRUNC(salary/30 , 1) ������1,
       TRUNC(salary/30 , -1) ������2
FROM employees;





