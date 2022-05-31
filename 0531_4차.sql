SELECT COUNT(salary)
FROM employees;


SELECT SUM(salary) �հ�, SUM(salary) / COUNT(salary) ����_���
FROM employees;

SELECT MAX(salary) �ִ밪 , MIN(salary) �ּҰ� , MAX(first_name) �ִ빮�ڰ� , MIN(first_name) �ּҹ��ڰ�
FROM employees;

SELECT job_id ���� , SUM(salary) ������_�ѱ޿� , AVG(salary) ������_��ձ޿�
FROM employees
WHERE employee_id >= 10
GROUP BY job_id
ORDER BY ������_�ѱ޿� DESC, ������_��ձ޿�;

SELECT job_id job_id_��׷�,
       manager_id manager_id_�߱׷�,
       SUM(salary) �׷���_�ѱ޿�,
       AVG(salary) �׷���_��ձ޿�
FROM   employees
WHERE  employee_id >= 10
GROUP BY job_id, manager_id ----job_id���� �� �� �׷�ȭ�ϰ� manager_id���� �ٽ� �� �� �׷�ȭ
ORDER BY �׷���_�ѱ޿� DESC, �׷���_��ձ޿�;


SELECT job_id ���� , SUM(salary) ������_�ѱ޿� , AVG(salary) ������_��ձ޿�
FROM employees
WHERE employee_id >= 10
GROUP BY job_id
HAVING SUM(salary) > 30000
ORDER BY ������_�ѱ޿� DESC, ������_��ձ޿�;

SELECT a.first_name, a.last_name, B.*
FROM employees A, job_history b
WHERE a.employee_id = b.employee_id
AND a.employee_id = 101;


SELECT
    a.employee_id, a.department_id, b.department_name, c.location_id, c.city
FROM employees A, departments B, locations C
WHERE a.department_id = b.department_id
AND b.location_id = c.location_id;


SELECT COUNT(*) ���εȰǼ�
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