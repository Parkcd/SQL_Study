-- Join
SELECT
    *
FROM emp , dept
where emp.deptno = dept.deptno --양쪽 테이블에 같은 속성의 필드가 있어야 함.
order by empno;

--각 부서별 최고 급여와 동일한 급여를 받는 사원 정보
SELECT
    *
FROM emp
where sal IN(SELECT MAX(sal)
             from emp
             group by deptno);

--30번 부서 사원들의 최소 급여보다 많은 급여를 받는 사원 정보
select 
*
from emp
where sal > any (select sal
                 from emp
                 where deptno=30);
                 
-- 테이블 복사                 
create table dep_tel
     as select *
        from dept;
        
insert into dep_tel values(50,'DATABASE','SEOUL');
update dep_tel set loc='BUSAN' where deptno = 40;
delete from dep_tel where dname ='RESEARCH';

SELECT * FROM dep_tel;
SELECT * FROM dept;

rollback;

commit;

--인덱스 생성
create index emp_ix01 ON emp(hiredate);

select * from user_ind_columns; -- 전체 인덱스 목록을 확인해라

select /* + INDEX(a emp_ix01) */ a.*
from emp a
where hiredate BETWEEN '1981-01-01'
                AND '1981-12-31';

DROP INDEX emp_ix01;

create view vw_em20
    as(select empno , ename , job , deptno from emp where deptno=20);

select * from user_views;
select * from vw_em20;

create view vw_em20
    as(select empno , ename , hiredate from emp where emptno=20);
    
DROP view vw_em20;

create table dept_fk(
    deptno number(2) constraint deptfk_deptno_pk primary key,
    dname varchar2(14),
    loc varchar2(13)
    );

desc dept_fk;

------------------------------

create table emp_fk(
    empno number(4) constraint empfk_empno_pk primary key,
    ename varchar2(10),
    job varchar2(9),
    mgr number(4),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2) constraint empfk_dept_fk references dept_fk(deptno)
    );
    
desc emp_fk;

desc dept_fk;
    