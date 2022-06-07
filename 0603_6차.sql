UPDATE departments
SET (manager_id , location_id) = (SELECT  manager_id , location_id    
                                          FROM departments
                                          WHERE department_id = 40)
WHERE department_name = 'Sample_Dept';

SELECT
manager_id , location_id
FROM departments
WHERE department_id = 40;

SELECT
    *
FROM departments
WHERE department_name = 'Sample_Dept';

--department_id 에는 null이 입력될 수 없기때문에 오류남.
UPDATE departments
SET department_id = null
WHERE department_name = 'Sample_Dept';

-일반적인 방법
DELETE FROM departments 
WHERE department_name = 'Sample_Dept';

--서브쿼리를 사용한 방법
DELETE FROM departments
WHERE department_id IN (SELECT department_id 
                        FROM departments
                        WHERE department_name = 'Sample_Dept'); 
                        
commit;

-- 1. 기본키 제약 조건 -> 데이터 중복 불허
INSERT INTO departments
VALUES(1000 , 'Sample_Dept' ,200 , 1700);

-- 2. 외래키 제약 조건 : 열 값이 부모 테이블의 참조 열의 값을 반드시 참조
-- 111은 부모테이블의 행에 존재하지 않음.
INSERT INTO departments (department_id , department_name , manager_id , location_id)
VALUES(273 , 'Sample_Dept' , 200 , 111);

-- 3. 유일키 : 중복은 허락하지 않지만 (null값 허용 가능)
-- SKING가 중복입력 되어 오류 발생
INSERT INTO employees (employee_id , first_name , last_name , email , phone_number , 
hire_date , job_id , salary)
VALUES(207 , 'first_name' , 'last_name' , 'SKING' , '111.11.11' , to_date('030617' , 'YYMMDD') , 'IT_PROG', 6000);

SELECT
    *
FROM employees
WHERE email = 'SKING';

-- 4. NOT NULL : null값을 허용하지 않는다.
INSERT INTO departments (department_id , department_name , manager_id , location_id)
VALUES(273, null , 200 , 700);

-- 5. CHECK : 범위나 조건 등 지정된 값만 허용
-- 맨끝에 값은 0을 초과하는 값만 허용 
INSERT INTO employees (employee_id , first_name , last_name , email , phone_number , 
hire_date , job_id , salary)
VALUES(209 , 'first_name' , 'last_name' , 'TEST' , '111.11.11' , to_date('030617' , 'YYMMDD') , 'IT_PROG', 0);


--테이블 생성
CREATE TABLE sample_product
             (product_id number,
              product_name VARCHAR2 (30),
              manu_date date
              );
              
INSERT INTO sample_product (product_id , product_name , manu_date)
VALUES(3 , 'cleaner' , '160101');



SELECT
    *
FROM sample_product;

ALTER TABLE sample_product ADD(factory varchar(10));

ALTER TABLE sample_product MODIFY(factory char(8));

--칸을 줄이려고 하는데 기존에 삽입되어있던 데이터가 바꿀려는 타입보다 더 큰 값이 있어서 에러메세지 출력
ALTER TABLE sample_product MODIFY(product_name varchar(5));

-- 열삭제
ALTER TABLE sample_product DROP COLUMN factory_name;

-- 내용삭제
TRUNCATE TABLE sample_product;

-- 테이블 삭제
DROP TABLE sample_product;