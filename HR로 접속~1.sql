/*
    -- SQL ; 모든쿼리구문, SELECT, CREAT,ALTAR,DROP,INSSERT,UPDATE,DELETE,GRANT,REVEK,ROLLBACK,COMMIT
    -- 구조화된 질의언어
    -- SQL 종류
    -- DQL :(DATA QUERY LANGUAGE) :출력 ,검색,SELECT,
    -- DDL :(DATE DEFINTION LANGUAGE) : 스키마 (틀,구조 ) 객체 (테이블,뷰,함수,시퀀스  ,트리거,저장프로그램,인덱스 생성 ,수정매체
     
       -- CREATE(생성 ) ,ALTER (수정) ,DROP  (삭제 )
    
    -- DNL : (DATA NANUPULARTION LANGUAE ) : 테이블의 레코드를 조작하는언어 
      
       -- INSERT (입력 ) , UPDATE (수정) ,DELETE (삭제)
       -- 트랜젝션이 발생 (RAM) ,  COMMIT : RAM 의 변경된 내용을 DB에 저장해라 ,ROLLBACK :원래대로 되돌림
       -- 트렌젝션이 INSERT, UPDATE, DELETE 구문이 자동으로 시작되면 ,
       -- 트렌젝션을 종료 :ROLLBACK : 메모리에 저장된 변경된부분을 원래대로 되돌려라 , COMMIT :DB에 영구적으로 저장함.
       -- 트렌젝션이 종료되지 않으면 LOCK 이 걸려서 트랜젝션 종료될떄까지 다른사용자 적용이안된다 .
       -- 오라클 :DNL 문을 시작하면 자동으로 트렌젝션이 시작됨 , 시작만되고 종료는 시켜야함 ,INSERT , UPDATE, DELETE 를 시작함과 동시에 자동으로 작동한다 , <== 명시
       -- MYSQL .MSSQL : 자동으로 시작 오랜전이시작됨 ,종료 (ROLLBACK , COMMIT) 자동으로 
      
       -- 명시적으로 트렌젝션을 시작할수있고 명시적으로 끝낼수 있다 .
   -- DCL : DATA CONTOROL LANUAGE :  개정 (ACOUNT 
   -- TCL : TRANSACTCI LCOUNT :트렌젝션을 관리하는 언어 <== DNL 문에서 사용됨 
   -- 트랜젝션 : 작업 (일) 을 처리하는 최소단위를 트렌젝션이라고 한다  :ALL OR NOTHING : 되면 전부되게하거나 .안되면전부안되게함
   -- 트렌젝션 LOG 에 기록되어있다 , < ==오류난 시점까지 복원 ,백업시점 시점이아니라 오류난시점까지복원가능 
   -- 트랜젝션의 4가지 특징 
   -- 원자성 :(ATOMICITY) : 일을 처리하는 최소단위 
   -- 일관성 : (CONSTISTENCY) :트렌젝션에서 처리된 결과는 ㄷ일관성을 가진다 ALL ,NOTHING
   -- 독립성 : (ISOLATION) : 하나의 트렌젝션은 다른 트렌젝션과 연결되어있다  , LOCK 
   -- 적속성 : (DURAVILITY) :COMMIT , DB 에 영구적으로 저장
   
*/

-- 테이블 복사

UPDATE ACCOUNT10
SET ACCOUNT-10.00
WHERE NO = 7369 ;

UPDATE ACCOUNT10
SET ACCOUNT = ACCOUNT - 10.00
WHERE NO = 7369;

-- Create table EMP03 based on EMPLOYEE with column name modifications

CREATE TABLE ACCOUNT10 AS
SELECT ENO AS NO, ENAME, SALARY AS ACCOUNT
FROM EMPLOYEE;

-- Start a transaction

BEGIN TRANSACTION;

-- Update statements within the transaction

UPDATE ACCOUNT10 SET ACOUNT = ACOUNT - 1000000000 WHERE NO = 7369; -- SMITH ACCOUNT - 10억
UPDATE ACCOUNT10 SET ACOUNT = ACOUNT + 1000000000 WHERE NO = 1934; -- MILLER ACCOUNT + 10억

-- Commit the transaction

COMMIT;

-- If there is an issue, rollback the transaction
-- ROLLBACK;

CREATE TABLE EMP03
AS
SELECT ENO AS NO, ENAME, SALARY AS ACCOUNT
FROM EMPLOYEE;

-- SMITH 에서 MILLER 에게 10억을 입금 : 2개의 UPDATE 구문을 하나의 TRANSECTION 으로 써의  :ALL OR NOTGING
-- SMITH ACCOUNT - 10억 : UPDATE ACCOUNT 10 SET ACCOUN = ACCOUNT -10 WHERE NO = 7369
-- MILLER ACOOUNT +10억 : UPDATE ACOUNT10 SET ACOUNT = ACCOUNT +10 WHERE NO = 1934 

BEGIN TRANSACTION; -- 명시적으로 트렌젝션을 시작

UPDATE ACCOUNT10
SET ACCOUNT= ACCOUNT -10
WHERE NO = 7369;

UPDATE ACOUNT10
SET ACOUNT -10 WHERE NO = 7369;

UPDATE ACOUNT10 
SET ACOUNT +10 WHERE NO = 1934;

SELECT * FROM ACCOUNT10;

-- 트렌젝션 종료 

ROLLBACK;
COMMIT;

BEGIN
   -- Your update statements
   UPDATE ACCOUNT10 SET ACCOUNT = ACCOUNT - 10.00 WHERE NO = 7369;

   -- If everything is successful, commit the transaction
   COMMIT;

   -- If there is an issue, rollback the transaction
   -- ROLLBACK;
END;

DESC ACCOUNT10;

/*

DML; INSERT (값을 입력 ) , UPDATE, ( 수정 ) ,DELETE (삭제)
*/

-- 테이블복사
CREATE TABLE DEPT04
AS
SELECT * FROM DEPARTMENT;

SELECT * FROM DEPT04;

-- dept03 : primary key 제약조건 추가

alter Table dept04
add constraint PK_DEPT04_DNO PRIMARY KEY (DNO); 


-- INSERT : 새로운 값을 추가할때 . 주의사항 :각 컬럼에 자료형  : NUMBER ,문자 ,날짜 ,

desc dept04;

select * from user_constraints where table_name in ('DEPT04') ;

-- INSERT INTO  테이블명 ( 컬럼명 ,컬럼명,컬럼명 ) VALUES (값 ,값, 값 0 ; 

INSERT INTO DEPT04 (DNO,DNAME,LOC)
VALUES (50,'HR','SEOUL') ;

ROLLBACK ;
COMMIT ;

SELECT * FROM DEPT04;

-- INSERT 시 컬럼이름을 명시 하지않는 경우 모든컬럼의 값을 넣어야함
INSERT INTO DEPT04
VALUES (60, '인사부' , '부산');

INSERT INTO DEPT04
VALUES (70,'인사부' );

INSERT INTO DEPT04 (DNAME,DNO) 
VALUES ('영업부' , 80);


-- UPDATE 문 :입력된 값을 수정시 사용 ,반드시 WHERE 조거능 사용해야한다 ,WHERE 조건에 사욧ㅇ되는 컬럼은 PROMARY KEY 를 커럶하여야함
/*
UPDATE 테이블명
SET 컬럼명 = 바꿀값, 커럶명 = 바꿀값
WHERE 조건
*/
-----
COMMIT ;
ROLLBACK ;
SELECT * FROM DEPT04;
---
UPDATE DEPT04
SET LOC = '대구'
WHERE DNO= 80;
--
UPDATE DEPT04
SET DNAME = '관리부'
WHERE DNO= 40;
--
UPDATE DEPT04
SET LOC = '광주'
WHERE DNO= 40;
--
INSERT INTO DEPT04
VALUES ( 90,'영업부','청주' );

INSERT INTO DEPT04
VALUES ( 70,'인쇄','충주' );

-- UPDATE 에서 반드시 WHERE 조건 , 조건을 처리하는 PRI MARY KEY UNIQUE 키컬럼을정의

UPDATE DEPT04
SET DNAME = '생산부' 
WHERE DNO = 80;

-- UP DATE 시 GIRMARY KEY 컬럼을 조건으로 처리해서 원하는 값ㅅ만수정
UPDATE DEPT04
SET DANME = '인쇄부'
WHERE DNO IN (91 ,80) ;

-- DELETE : 레코드를 삭제할떄 ,WHERE가 필수 , 
-- DELETE 테이블명 WHERE조건

SELECT * FROM DEPT04;

DELETE DEPT04 ;

--DELETE , WHERE 조건사용 :

DELETE DEPT04
WHERE DNO= 91 ;

-- 모든레코드들 ,테이블에있는 모든값을 삭제 : 
-- DELETE 에 WHERE조건없이 : 레코드 하나하나를 삭제함 :삭제를하나하나해서시간이오래걸림 LOW LEVEL FORMAT
-- TRUNCAT TABLE 테이블명 :  PAST FORMAT 한꺼번에 모든레코드를 날림
-- DROP TABLE 테이블명 : 테이블 자체를 삭제 

SELECT * FROM DEPT03;
ROLLBACK;
DELETE DEPT03;
/*
DML :INESRT (값을입력 
 <== 트렌젝션 자동시작
 <== 
*/
TRUNCATE TABLE EMP04;
  
  CREATE TABLE EMP05
  AS 
    SELECT * FROM EMPLOYEE;

  SELECT * FROM EMP05;

  CREATE TABLE EMP05;

/* EMP05
 임의의 값을추가 :INSERT
  임의의 값을 수정 : UPDATE 
  임의의값을삭제 : DELETE 

  */
  SELECT * FROM EMP05;
  
    ROLLBACK;
    
  COMMIT;

UPDATE EMP05
SET DNAME = '관리부'
WHERE DNO= 40;

INSERT INTO EMP05 (DNAME,DNO) 
VALUES ('영업부' , 80);
  
DELETE EMP05
WHERE = NULL ;

INSERT INTO EMP05 (COMMISSION)
VALUES (300);
  


