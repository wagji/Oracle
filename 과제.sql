 -- 테이블생성
 
CREATE TABLE DEPARTMENT (
    DNO NUMBER(2),
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13),
    CONSTRAINT PK_DEPARTMENT_DNO PRIMARY KEY (DNO)
);

 -- 테이블생성
 
CREATE TABLE EMPLOYEE (
    ENO NUMBER(4) CONSTRAINT PK_EMPLOYEE_ENO PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MANAGER NUMBER(4),
    HIREDATE DATE,
    SALARY NUMBER(7,2),
    COMMISSION NUMBER(7,2),
    DNO NUMBER(2),
    CONSTRAINT FK_EMPLOYEE_DNO FOREIGN KEY (DNO) REFERENCES DEPARTMENT(DNO)
);

-- 테이블값 입력 

INSERT INTO DEPARTMENT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPARTMENT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPARTMENT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPARTMENT VALUES (40,'OPERATIONS','BOSTON');

-- 테이블값 입력 

INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','CLERK',    7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7499,'ALLEN','SALESMAN', 7698,to_date('20-2-1981', 'dd-mm-yyyy'),1600,300,30);
INSERT INTO EMPLOYEE VALUES
(7521,'WARD','SALESMAN',  7698,to_date('22-2-1981', 'dd-mm-yyyy'),1250,500,30);
INSERT INTO EMPLOYEE VALUES
(7566,'JONES','MANAGER',  7839,to_date('2-4-1981',  'dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981', 'dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMPLOYEE VALUES
(7698,'BLAKE','MANAGER',  7839,to_date('1-5-1981',  'dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMPLOYEE VALUES
(7782,'CLARK','MANAGER',  7839,to_date('9-6-1981',  'dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMPLOYEE VALUES
(7788,'SCOTT','ANALYST',  7566,to_date('13-07-1987', 'dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7839,'KING','PRESIDENT', NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMPLOYEE VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981',  'dd-mm-yyyy'),1500,0,30);
INSERT INTO EMPLOYEE VALUES
(7876,'ADAMS','CLERK',    7788,to_date('13-07-1987', 'dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7900,'JAMES','CLERK',    7698,to_date('3-12-1981', 'dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMPLOYEE VALUES
(7902,'FORD','ANALYST',   7566,to_date('3-12-1981', 'dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7934,'MILLER','CLERK',   7782,to_date('23-1-1982', 'dd-mm-yyyy'),1300,NULL,10);

SELECT * FROM DEPARTMENT;
SELECT * FROM EMPLOYEE;

-- 1. 

SELECT ename 사원이름, dno 부서번호 
FROM employee 
WHERE ENO=7788 ;

-- 2.

   select ename 사원이름 ,hiredate 입사날짜
 from employee
 where hiredate like '81%' ;
 
 -- 3.
 
  SELECT ENAME 사원이름 , JOB 담당부서 , SALARY 월급 
FROM EMPLOYEE
WHERE job IN ('CLERK','SALESMAN') AND SALARY NOT IN (1600,950,1300);

-- 4.

  SELECT TRUNC(MONTHS_BETWEEN (SYSDATE,TO_DATE('1993-03-03', 'YYYY-MM-DD')))
FROM dual;

-- 5.
 
SELECT dno 부서번호, ROUND(AVG(salary),2)
FROM employee
group by dno
having round(avg(salary),2)>=2000
order by dno asc;

-- 6.

SELECT eno 부서번호, ename 사원이름
FROM employee
WHERE salary > (SELECT AVG(salary) FROM employee)
ORDER BY salary ASC;


-- 7.

SELECT ENAME 사원이름,D.DNO,DNAME 부서명,LOC 부서위치
FROM DEPARTMENT D
JOIN EMPLOYEE E ON E.DNO = D.DNO
WHERE JOB = 'MANAGER'
ORDER BY DNAME DESC;

-- 8.

CREATE VIEW v_join 
AS
SELECT ename 사원이름, job 담당부서, dname 부서명, loc 부서위치,salary 월급
FROM employee e
JOIN department d ON e.dno = d.dno
WHERE SALARY IN (
    SELECT MIN(SALARY) 
    FROM EMPLOYEE 
    WHERE dno <> 20 
    GROUP BY DNO
    HAVING MIN(SALARY) >=900);

SELECT * FROM v_join;

-- 9 .

create table EMP50
as select *
from employee ;

create table DEPT50
as select *
from DEPARTMENT ;

ALTER TABLE EMP50
ADD CONSTRAINT PK_EMP50_ENO PRIMARY KEY (Eno);

ALTER TABLE EMP50
ADD CONSTRAINT FK_EMP50_DNO FOREIGN KEY (DNO) REFERENCES DEPT50(DNO);

alter table DEPT50
add constraint PK_DEPT50_DNO primary key (dno) ; 

-- 10 .


INSERT INTO EMP50 (ENO, ENAME, JOB, MANAGER, HIREDATE, SALARY, COMMISSION, DNO)
VALUES (8181, '홍길동', '사무원', 7788, SYSDATE, 1000, 100, 20);

 UPDATE EMP50
SET COMMISSION = 50
WHERE COMMISSION IS NULL OR COMMISSION = 0;

UPDATE DEPT50
SET DNAME = '운영부', LOC = '서울'
WHERE DNO = 40;


DELETE FROM EMP50
WHERE JOB = 'MANAGER';

COMMIT ;

SELECT * FROM DEPT50;
SELECT * FROM EMP50;
 
 