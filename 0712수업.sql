-- emp 테이블의 부서 번호 종류를 확인
select DISTINCT deptno
from emp;

--곱하기를 사용하지 않고 사원의 연간 총 수입 출력
select ename ,sal ,sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+comm, comm
from emp;

select ename ,sal , comm,sal*12+comm as 연수입
from emp;

--급여 기준으로 내림차순 정렬
SELECT *
FROM emp
order by sal desc;

SELECT
    *
FROM emp
order by deptno asc , sal desc;

--emp 테이블의 전체 열을 부서번호(오름차순) 와 급여(내림차순)로 정렬
SELECT ename , deptno , sal
FROM emp
order by deptno , sal desc;

--부서 번호가 30인 직원만 출력
SELECT
    *
FROM emp
where deptno = 30;

--사원번호가 7900인 직원만 출력
select *
from emp
where empno = 7900;

--부서번호가 30이면서 job이 CLERK 인 직원
SELECT
    *
FROM emp
where deptno=30 and job='CLERK';

--급여 열에 12를 곱한 값이 36000인 직원들만 출력
SELECT
    *
FROM emp
where sal*12=36000;

--ename이 F보다 작거나 같은 직원을 출력
select * from emp where ename<= 'FORD';

--같지 않다 쓸때 != , <> , ^= , not 를 사용
SELECT * FROM emp where sal != 3000;
SELECT * FROM emp where sal <> 3000;
SELECT * FROM emp where sal ^= 3000;
SELECT * FROM emp where NOT sal = 3000;

--다음의 코드를 짧게 줄여서 표시
select * from emp 
where job = 'MANAGER' OR job = 'SALESMAN' OR job = 'CLERK';

select * from emp where job = any('MANAGER' , 'SALESMAN' , 'CLERK');
select * from emp where job IN ('MANAGER' , 'SALESMAN', 'CLERK');

--다음의 코드를 짧게 줄여서 표시2
-- 급여 값이 2000이상 3000이하 조회
select * from emp where sal >= 2000 AND SAL <= 3000;

SELECT * FROM emp where sal between 2000 AND 3000;

--ename이 S로 시작하는 데이터만 출력
SELECT
    *
FROM emp
where ename LIKE '%S';

--ename이 두 번째 글자가 L인 사원만 출력
SELECT
    *
FROM emp
where ename LIKE '_L%';

--사원 이름에 AM이 포함된 사원 데이터만 출력
SELECT
    *
FROM emp
where ename LIKE '%AM%';

-- NULL에 대한 오류 해결
select * from emp where comm IS NULL;

-- UNION (집합연산자) - 중복제거
-- UNION ALL - 중복가능
-- MINUS
-- INTERSECT
SELECT empno, ename, sal ,deptno
FROM emp
where deptno = 10
UNION
SELECT empno, ename, sal ,deptno
FROM emp
where deptno = 20;

--사원 이름을 대문자 , 소문자 , 첫글자 대문자로 출력
SELECT ename, UPPER(ename) , LOWER(ename) , INITCAP(ename) 
FROM emp;

--사원 이름에 SCOTT 단어가 포함 , 같은된 데이터 출력
SELECT
    *
FROM


SELECT
    *
FROM emp
where ename ='SCOTT';