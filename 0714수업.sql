SELECT length('한글'), lengthb('한글')
FROM dual;

SELECT LENGTHB(CONVERT('한글','KO16MSWIN949')) AS LENGTHB_1,
       LENGTHB(CONVERT('한글 HANGUL', 'KO16MSWIN949')) AS LENGTHB_2
FROM DUAL;

--날짜 표시 형식
SELECT TO_CHAR(SYSDATE, 'YYYY"년" MM"월" DD"일" HH24"시" MI"분" SS"초"') FROM DUAL;

-- 여러 언어로 날짜(월) 출력
SELECT SYSDATE,
    TO_CHAR(SYSDATE,'MM') AS MM,
    TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE=KOREAN') AS MON_KOR,
    TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN,
    TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_ENG,
    TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN') AS MONTH_KOR,
    TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE') AS MONTH_JPN,
    TO_CHAR(SYSDATE,'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH') AS MONTH_ENG
FROM DUAL;

--여러가지 숫자 형식 사용하여 급여 출력하기 
SELECT SAL,
    TO_CHAR(SAL, '$999,999') AS SAL_$,
    TO_CHAR(SAL, 'L999,999') AS SAL_L,
    TO_CHAR(SAL, '999,999.00') AS SAL_1, 
    TO_CHAR(SAL, '000,999,999.00') AS SAL_2,
    TO_CHAR(SAL, '000999999.99') AS SAL_3,
    TO_CHAR(SAL, '999,999,00') AS SAL_4
FROM EMP;

--1981년 6월 1일 이후에 입사한 사원의 정보 출력
SELECT *
FROM emp
where hiredate > TO_DATE('1981/06/01' , 'YYYY/MM/DD'); 

-- NVL
SELECT EMPNO , ENAME , SAL , COMM , SAL+COMM,
       NVL(COMM, 0),
       SAL+NVL(COMM, 0)
FROM EMP;

-- NVL2
SELECT EMPNO , ENAME , SAL , COMM,
       NVL2(COMM, 'O' , 'X'),
       NVL2(COMM, SAL*12+COMM, SAL*12) AS ANNSAL
FROM EMP;

-- DECODE 함수
SELECT EMPNO, ENAME, JOB,SAL,
    DECODE(JOB,
          'MANAGER', SAL*1.1,
          'SALESMAN', SAL*1.05,
          'ANALYST', SAL,
          SAL*1.03) AS UPSAL
FROM EMP;

-- 다중행
select sal from emp;
SELECT sum(sal) from emp; -- <- 이렇게 짜면 다중행

-- 2. emp 전체 직원의 수
SELECT COUNT(*) 
FROM emp;
-- 3. 부서 번호가 30인 직원 수
SELECT COUNT(*)
FROM EMP
WHERE DEPTNO = 30;
-- 4. 추가 수당 행의 개수
SELECT COUNT(COMM) comm
FROM EMP
WHERE COMM IS NOT NULL;
-- 5. 부서 번호가 20인 사원의 일사일 중 제일 최근 입사일
select max(to_char(hiredate))
from emp
where deptno = 20;

SELECT
    *
FROM EMP;

--WHERE절과 HAVING절의 차이
SELECT deptno, job , AVG(sal)
FROM EMP
GROUP BY deptno , job
  HAVING AVG(sal) >= 2000
ORDER BY deptno, job;

select job, round(avg(sal))
from emp
group by job
having avg(sal) >= 1000;

select job, round(avg(sal))
from emp
where sal <= 3000
group by job
having avg(sal) >= 1000;

-- where절을 사용하면 Group보다 우선 처리함.
SELECT deptno, job , AVG(sal)
FROM emp
WHERE sal <= 3000
GROUP BY deptno , job
  HAVING AVG(sal) >= 2000
ORDER BY deptno, job;

-- PIVOT 함수 사용
SELECT *
FROM(SELECT deptno, job , sal
        FROM EMP)
    PIVOT(MAX(sal)
        FOR deptno IN(10,20,30)
        )
ORDER BY job;

-- JOIN
SELECT e.empno, e.ename, d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno
order by d.deptno, e.empno;

-- 6. 서브쿼리로 JONES의 급여보다 높은 급여를 받는 사원 정보 출력
SELECT *
FROM emp
where sal > (SELECT sal
             FROM emp
             WHERE ename = 'JONES');
             
-- 실무형 쿼리 -조인과 서브쿼리를 같이 사용
SELECT e.empno, e.ename, d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno
AND e.deptno = 20
AND e.sal > (SELECT AVG(sal)
             FROM emp);
             
