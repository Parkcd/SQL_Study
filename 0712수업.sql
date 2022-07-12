-- emp ���̺��� �μ� ��ȣ ������ Ȯ��
select DISTINCT deptno
from emp;

--���ϱ⸦ ������� �ʰ� ����� ���� �� ���� ���
select ename ,sal ,sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+comm, comm
from emp;

select ename ,sal , comm,sal*12+comm as ������
from emp;

--�޿� �������� �������� ����
SELECT *
FROM emp
order by sal desc;

SELECT
    *
FROM emp
order by deptno asc , sal desc;

--emp ���̺��� ��ü ���� �μ���ȣ(��������) �� �޿�(��������)�� ����
SELECT ename , deptno , sal
FROM emp
order by deptno , sal desc;

--�μ� ��ȣ�� 30�� ������ ���
SELECT
    *
FROM emp
where deptno = 30;

--�����ȣ�� 7900�� ������ ���
select *
from emp
where empno = 7900;

--�μ���ȣ�� 30�̸鼭 job�� CLERK �� ����
SELECT
    *
FROM emp
where deptno=30 and job='CLERK';

--�޿� ���� 12�� ���� ���� 36000�� �����鸸 ���
SELECT
    *
FROM emp
where sal*12=36000;

--ename�� F���� �۰ų� ���� ������ ���
select * from emp where ename<= 'FORD';

--���� �ʴ� ���� != , <> , ^= , not �� ���
SELECT * FROM emp where sal != 3000;
SELECT * FROM emp where sal <> 3000;
SELECT * FROM emp where sal ^= 3000;
SELECT * FROM emp where NOT sal = 3000;

--������ �ڵ带 ª�� �ٿ��� ǥ��
select * from emp 
where job = 'MANAGER' OR job = 'SALESMAN' OR job = 'CLERK';

select * from emp where job = any('MANAGER' , 'SALESMAN' , 'CLERK');
select * from emp where job IN ('MANAGER' , 'SALESMAN', 'CLERK');

--������ �ڵ带 ª�� �ٿ��� ǥ��2
-- �޿� ���� 2000�̻� 3000���� ��ȸ
select * from emp where sal >= 2000 AND SAL <= 3000;

SELECT * FROM emp where sal between 2000 AND 3000;

--ename�� S�� �����ϴ� �����͸� ���
SELECT
    *
FROM emp
where ename LIKE '%S';

--ename�� �� ��° ���ڰ� L�� ����� ���
SELECT
    *
FROM emp
where ename LIKE '_L%';

--��� �̸��� AM�� ���Ե� ��� �����͸� ���
SELECT
    *
FROM emp
where ename LIKE '%AM%';

-- NULL�� ���� ���� �ذ�
select * from emp where comm IS NULL;

-- UNION (���տ�����) - �ߺ�����
-- UNION ALL - �ߺ�����
-- MINUS
-- INTERSECT
SELECT empno, ename, sal ,deptno
FROM emp
where deptno = 10
UNION
SELECT empno, ename, sal ,deptno
FROM emp
where deptno = 20;

--��� �̸��� �빮�� , �ҹ��� , ù���� �빮�ڷ� ���
SELECT ename, UPPER(ename) , LOWER(ename) , INITCAP(ename) 
FROM emp;

--��� �̸��� SCOTT �ܾ ���� , ������ ������ ���
SELECT
    *
FROM


SELECT
    *
FROM emp
where ename ='SCOTT';