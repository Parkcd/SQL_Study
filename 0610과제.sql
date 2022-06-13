SELECT TEAM_ID 팀ID,
    TO_NUMBER (ZIP_CODE1, '999') + TO_NUMBER (ZIP_CODE2, '999') 우편번호함
FROM TEAM;

SELECT ENAME , CASE WHEN SAL > 2000 THEN SAL
    ELSE 2000
    END REVISED_SALARY
FROM EMP;

SELECT LOC,
       CASE LOC
            WHEN 'NEW YORK' THEN 'EAST'
            WHEN 'BOSTON' THEN 'EAST'
            WHEN 'CHICAGO' THEN ' CENTER'
            WHEN 'DALLAS' THEN 'CENTER'
            ELSE 'ETC'
        END AS AREA
FROM DEPT;

SELECT ENAME,
       CASE
           WHEN SAL >= 3000 THEN 'HIGH'
           WHEN SAL >= 1000 THEN 'MID'
           ELSE 'LOW'
        END SALARY_GRADE
FROM EMP;

SELECT ENAME, SAL
      , CASE
            WHEN SAL >= 2000 THEN 1000
            
            ELSE (CASE
                      WHEN SAL>= 1000 THEN 500
                      ELSE 0
                      END)
                END BONUS
FROM EMP;