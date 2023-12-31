
CREATE TABLE ZIPCODE9 (
    ZIPCODE VARCHAR2(7) NOT NULL CONSTRAINT PK_ZIPCODE9_ZIPCODE PRIMARY KEY, 
    SI_DO VARCHAR2(30), 
    GU_GUN VARCHAR2(30), 
    DONG VARCHAR2(30),
    BUNGI VARCHAR2(30)
);

CREATE TABLE MEMBER9 (
    ID VARCHAR2(20) NOT NULL CONSTRAINT PK_MEMBER9_ID PRIMARY KEY, 
    PAWD VARCHAR2(20), 
    NAME VARCHAR2(50), 
    ZIPCODE VARCHAR2(7), 
    ADDRESS VARCHAR2(20), 
    TEL VARCHAR2(13),
    INDATE DATE,
    CONSTRAINT FK_MEMBER9_ZIPCODE FOREIGN KEY (ZIPCODE) REFERENCES ZIPCODE9(ZIPCODE)
);

CREATE TABLE PRODUCT9 (
    PRO_CODE VARCHAR2(20) NOT NULL CONSTRAINT PK_PRODUCT9_PRO_CODE PRIMARY KEY, 
    PRO_NAME VARCHAR2(100), 
    PRO_KIND CHAR(1), 
    PRO_PRICE1 VARCHAR2(10),
    PRO_PRICE2 VARCHAR2(10),
    PRO_CONTENT VARCHAR2(1000),
    PRO_IMAGE VARCHAR2(50),
    SIZEST VARCHAR2(5),
    SIZEET VARCHAR2(5),
    PRO_QUANTITY VARCHAR2(5),
    USEYN CHAR(1),
    INDATE DATE
);

CREATE TABLE ORDER9 (
    O_SEQ NUMBER(10) NOT NULL CONSTRAINT PK_ORDER9_O_SEQ PRIMARY KEY,
    PRO_CODE VARCHAR2(20),
    O_ID VARCHAR2(16),
    PRO_SIZE VARCHAR2(5),
    QUANTITY VARCHAR2(5),
    RESULT CHAR(1),
    INDATE DATE,
    CONSTRAINT FK_ORDER9_ID FOREIGN KEY (O_ID) REFERENCES MEMBER9(ID),
    CONSTRAINT FK_ORDER9_PRO_CODE FOREIGN KEY (PRO_CODE) REFERENCES PRODUCT9(PRO_CODE)
);

INSERT INTO ZIPCODE9 (ZIPCODE, SI_DO, GU_GUN,DONG,BUNGI)
VALUES ('1','서울','강동구','구월동','12번지');

INSERT INTO ZIPCODE9 (ZIPCODE, SI_DO, GU_GUN,DONG,BUNGI)
VALUES ('2','인천','노원구','중곡동','14번지');

INSERT INTO ZIPCODE9 (ZIPCODE, SI_DO, GU_GUN,DONG,BUNGI)
VALUES ('3','부산','서초구','속초동','19번지');

INSERT INTO ZIPCODE9 (ZIPCODE, SI_DO, GU_GUN,DONG,BUNGI)
VALUES ('4','천안','동대문구','가락동','88번지');

INSERT INTO ZIPCODE9 (ZIPCODE, SI_DO, GU_GUN,DONG,BUNGI)
VALUES ('5','대구','동성구','성동동','00번지');

COMMIT;


INSERT INTO MEMBER9 (ID, PAWD, NAME, ZIPCODE,ADDRESS,TEL,INDATE)
VALUES ('AAA','1111','젤리','1','WL@NAVER.COM','02-003-222','1993/3/3');

INSERT INTO MEMBER9 (ID, PAWD, NAME, ZIPCODE,ADDRESS,TEL,INDATE)
VALUES ('ABA','1122','엘리','2','KL@NAVER.COM','02-033-222','1945/3/3');

INSERT INTO MEMBER9 (ID, PAWD, NAME, ZIPCODE,ADDRESS,TEL,INDATE)
VALUES ('CCA','2211','켈리','3','WLL@NAVER.COM','02-323-222','1983/3/3');

INSERT INTO MEMBER9 (ID, PAWD, NAME, ZIPCODE,ADDRESS,TEL,INDATE)
VALUES ('BBB','3311','넬리','4','WTL@NAVER.COM','02-993-222','1999/3/3');

INSERT INTO MEMBER9 (ID, PAWD, NAME, ZIPCODE,ADDRESS,TEL,INDATE)
VALUES ('GGG','5551','릴리','5','WCL@NAVER.COM','02-563-222','1924/3/3');

COMMIT;
SELECT *FROM MEMBER9;


INSERT INTO PRODUCT9 (PRO_CODE,PRO_NAME,PRO_KIND,PRO_PRICE1,PRO_PRICE2,PRO_CONTENT,PRO_IMAGE,SIZEST,SIZEET,PRO_QUANTITY,USEYN,INDATE)
VALUES ('6','비타', 'A','2000','4000','비타민','비타오백','230','500','600','O','1923/2/4'); 

INSERT INTO PRODUCT9 (PRO_CODE,PRO_NAME,PRO_KIND,PRO_PRICE1,PRO_PRICE2,PRO_CONTENT,PRO_IMAGE,SIZEST,SIZEET,PRO_QUANTITY,USEYN,INDATE)
VALUES ('7','미타', 'C','4300','220','비민','비타백','20','50','60','O','1234/2/4'); 

INSERT INTO PRODUCT9 (PRO_CODE,PRO_NAME,PRO_KIND,PRO_PRICE1,PRO_PRICE2,PRO_CONTENT,PRO_IMAGE,SIZEST,SIZEET,PRO_QUANTITY,USEYN,INDATE)
VALUES ('8','티타', 'B','2040','700','비타','비타오','30','100','20','O','1723/2/4'); 

INSERT INTO PRODUCT9 (PRO_CODE,PRO_NAME,PRO_KIND,PRO_PRICE1,PRO_PRICE2,PRO_CONTENT,PRO_IMAGE,SIZEST,SIZEET,PRO_QUANTITY,USEYN,INDATE)
VALUES ('9','비', 'D','260','800','민','타오백','930','400','900','O','1823/2/4'); 

INSERT INTO PRODUCT9 (PRO_CODE,PRO_NAME,PRO_KIND,PRO_PRICE1,PRO_PRICE2,PRO_CONTENT,PRO_IMAGE,SIZEST,SIZEET,PRO_QUANTITY,USEYN,INDATE)
VALUES ('10','타', 'E','50','8000','비','비오백','830','790','88','O','1883/2/4'); 

COMMIT;


INSERT INTO ORDER9 (O_SEQ,PRO_CODE,O_ID,PRO_SIZE,QUANTITY,RESULT,INDATE)
VALUES (1111,'6','AAA','400','20','O','2023/3/21');

INSERT INTO ORDER9 (O_SEQ,PRO_CODE,O_ID,PRO_SIZE,QUANTITY,RESULT,INDATE)
VALUES (1111,'7','ABA','400','20','O','2023/3/20');

INSERT INTO ORDER9 (O_SEQ,PRO_CODE,O_ID,PRO_SIZE,QUANTITY,RESULT,INDATE)
VALUES (1111,'8','CCA','400','20','O','2023/3/13');

INSERT INTO ORDER9 (O_SEQ,PRO_CODE,O_ID,PRO_SIZE,QUANTITY,RESULT,INDATE)
VALUES (1111,'9','BBB','400','20','O','2023/3/11');

INSERT INTO ORDER9 (O_SEQ,PRO_CODE,O_ID,PRO_SIZE,QUANTITY,RESULT,INDATE)
VALUES (1111,'10','GGG','400','20','O','2023/3/10');

COMMIT;



SELECT * FROM ORDER11;

-- ZOIN :ANSI JOIN,
-- INNER JOIN : ON절에 공통의 값만 출력한다
-- LEFT OUTER JOIN: 왼쪽테이블의 모든내용
-- RIGHT OUTER JOIN : 오른쪽의모든내용 출력
SELECT *
FROM MEMBER10 M
JOIN ZIPCODE10 Z
ON M.ZIPCODE = Z.ZIPCODE;

-- MEMBER10(다) ,ZIPCODE (1)테이블

-- MEMBER10 에는 ON 절에 매칭되지 않더라도 오른쪽 테이블 에 있는 모든값은 출력한다.  :RIGHT OUTER JOIN 

SELECT *
FROM MEMBER10 M
RIGHT OUTER JOIN ZIPCODE10 Z
ON M.ZIPCODE = Z.ZIPCODE;

-- 주문 테이블 (ORDER10) ,주문자번호 ( MEMBER10) , <====ON M_ID


SELECT *
FROM MEMBER10 M
LEFT OUTER JOIN ZIPCODE10 Z
ON M.ZIPCODE = Z.ZIPCODE;

SELECT * 
FORM ORDER10;

SELECT *
FROM ORDER10 O
JOIN MEMBER10 M
ON O.M_ID = M.M_ID ;

-- 3배 테이블 로만 : ORDER11,ZIPCODE 11

SELECT *
FROM ORDER10 O
JOIN MEMBER10 M
ON O.M_ID=M.M_ID
JOIN ZIPCODE10 Z
ON M.ZIPCODE = Z.ZIPCODE;

-- 4개 테이블 조인  :ORDER10,MEMBER10,ZIPCODE10,PRODUCT10

SELECT *
FROM ORDER10 O
JOIN MEMBER10 M
ON O.M_ID=M.M_ID
JOIN ZIPCODE10 Z
ON M.ZIPCODE = Z.ZIPCODE
JOIN PRODOUCT10 P
ON O.PRO_ID = P.PRO_ID;

-- FULL OUTER JOIN ,RIGHT OUTER JOIN  ,LEFT OUTER JOIN 

-- RIGHT OUTER JOIN 주문하지 않는 사용자 정보도 출력 , 판매되지 않는 제품도 OUTER JOIN 을 사용해서 출력

SELECT *
FROM ORDER10 O
RIGHT OUTER JOIN MEMBER10 M
ON O.M_ID=M.M_ID
RIGHT OUTER JOIN ZIPCODE10 Z
ON M.ZIPCODE = Z.ZIPCODE
RIGHT OUTER JOIN PRODOUCT10 P
ON O.PRO_ID = P.PRO_ID;

-- FULL OTER JOIN

SELECT *
FROM ORDER10 O
FULL OUTER JOIN MEMBER10 M
ON O.M_ID=M.M_ID
FULL OUTER JOIN ZIPCODE10 Z
ON M.ZIPCODE = Z.ZIPCODE
FULL OUTER JOIN PRODOUCT10 P
ON O.PRO_ID = P.PRO_ID;

-- LEGFT OUTER JOIN

SELECT *
FROM ORDER10 O
LEFT OUTER JOIN MEMBER10 M
ON O.M_ID=M.M_ID
LEFT OUTER JOIN ZIPCODE10 Z
ON M.ZIPCODE = Z.ZIPCODEL
LEFT OUTER JOIN PRODOUCT10 P
ON O.PRO_ID = P.PRO_ID;

-- VIEW 에 AS 를 클락이 ?
-- 실제 값을 가지고 있지않음 ,SELECT 코드만드렁있음
-- 실제 테이블의 컬럼에 잘재임
-- INSERT, UPDATE,DELETE 등 VIWE 통해서 할수있다 ,단실제 테이블에 각컬럼에 새로 오건에있을떄가능

DROP VIEW V_TEST01;


SELECT * FROM EMP02;

CREATE VIEW V_TEST01
AS
SELECT ENO,ENAME,DNO
FROM EMP02;
 --뷰생성
 
 -- 뷰실행
 
 SELECT * FROM V_TEST01;
    
 -- VIEW 에 값을 넣을수 있다 ==> 실제 테이블에 값이 들어감.
 
 INSERT INTO V_TEST01 (ENO,ENAME,DNO)
 VALUES (8080,'HONG',30) ;
 
 
 COMMIT;
 
 UPDATE V_TEST01
 SET ENAME ='KIM'
 WHERE ENO=8080;
 
 COMMIT;
 
 -- VIEW 를 사용해서 값을 삭제 :
 DELETE V_TEST01
 WHERE
 
 CREATE VIEW V_TEST02
 AS
 SELECT ENO,ENAME,SALARY
 FROM EMP02;
 
 SELECT * FROM V_TEST02;
 
 INSERT INTO V_TEST02 (ENO,ENAME,SALARY)
 VALUES (9090,'SIM',3500);
 
 ALTER TABLE EMP02
 ADD CONSTARAINT NN_EMP02_DNO DON NOT NULL
 
 -- 테이블의 특정 컬럼에 NOT NULL 조건추가
 ALTER TABLE EMP
 MODIFY DNO =
