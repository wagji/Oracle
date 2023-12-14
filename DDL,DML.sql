/*
    SQL : 모든 쿼리 구문 , select, create, alter, drop , insert, update, delete, grant, revoke, rollbac, commit 
       - 구조화된 질의 언어 
    
    SQL 종류 
        - DQL(Data Query Language)  : 출력, 검색 , select 
        - DDL (Date Definition Language) : 스키마 (틀, 구조), 객체 (테이블, 뷰, 함수, 시퀀스, 트리거, 저장프로시져, 인덱스) 생성, 수정,삭제
                    create (생성), alter (수정), drop(삭제) 
        - DML ( Data Manupulation Language) : 테이블의 레코드(값) 를 조작하는 언어 
                    insert( 입력 ) , update( 수정 ) , delete ( 삭제 ) 
                    -- 트랜잭션이 발생( RAM )  , commit : RAM의 변경된 내용을 DataBase 영구히 저장하도록 함. , rollback : 원래대로 되돌림. 
                    -- 트랜Ъ퓽 insert, update, delete  시작되면 자동으로 트랜잭션이 시작 
                    -- 트랜잭션을 종료 : rollback : 메모리에 변경된 내용을 다시 원래 상태로 되돌림, commit : DB에 영구적으로 적용함. 
                    -- 트랜Ъ퓽 종료 되지 않으면 LOCK 걸려서 트랜Ъ 트랜잭션 종료될때 까지 LOCK 걸려 있다. 
                    -- 오라클 :   DML 문을 시작하면 자동으로 트랜잭션이 시작됨 .     종료 (rollback, commit)  <== 명시 
                    -- MySQL, MSSQL : DML 문을 시작하면 자동으로 트랜잭션이 시작됨 . commit 자동으로 처리됨 
                    -- 명시적으로 트랜잭션을 시작 할 수 있고, 명시적으로 끝낼 수 있다. 
        - DCL ( Data Control Language) :  계정(Account) 에게 객체(Resource) 에 권한을 부여함.  grant(부여), revoke (제거)
        - TCL ( Transaction Control Language) : 트랜잭션을 관리 하는 언어,  <== DML 문에서 사용됨 
                commit (DB에 영구히 저장), rollback ( 원래되로 되돌림), savepoint ( 트랜잭션 내에서 임시 저장시점 생성 ) 
                begin transaction   : 명시적으로 트랜잭션 시작 
*/ 

/*
        트랜잭션 :  작업(일) 을 처리하는 최소 단위  : ALL or NOTHING :  되면 전부 되게 하거나 안되면 전부 안되게 함.
            - 트랜잭션 log  에 기록 되어 있다.   <== 오류난 시점까지 복원 ,  백업 시점 시점이 아니라 오류난 시점까지 복원가능 
            
            - 트랜잭션의 4가지 특징 
                - 원자성 (Atomicity) : 일을 처리하는 최소 단위 
                - 일관성 (Consistency) : 트랜잭션에서 처리된 결과는 일관성을 가진다. ALL or NOTHING 
                - 독립성 (lsolation) : 하나의 트랜잭션은 다른 트랜잭션과 격리되어 있다. , LOCK, 
                - 직속성 ( Durability) : commit  , DB에 영구적으로 저장됨               
                
                
*/ 

-- 테이블 복사 

create table account10 
as 
select eno as no, ename as name , salary as  account
from employee ; 

-- 은행의 통장 테이블 :  no : 계좌번호,  name : 통장주인 , account : 돈 (입금액), 억  
select * from account10; 

-- SMITH 에서 Miller에게 10억을 입금  :  2개의 update 구문을 하나의 transaction 으로 처리 : ALL or NOTHING 
    -- SMITH Account - 10억    :     update account10 set account = account - 10 where no= 7369
    -- Miller Account + 10억   :      update account10 set account = account + 10 where no = 7934 

begin transaction ;      -- 명시적으로 트랜잭션을 시작 

update  account10 
    set  account = account - 10 
where no = 7369;

update account10 
set account = account + 10 
 where no = 7934; 

select * from account10; 

-- 트랜잭션 종료 
rollback; 
commit ; 

desc account10 ; 


/* 
    DML : insert(값을 입력) , update (수정) , delete (삭제)  
        <== 트랜잭션 자동 시작, 
        <== 트랜잭션 종료 ( rollback, commit) 는 명시 (오라클) 

*/ 

-- 테이블 복사 
create table dept03 
as 
select * from department ; 

select * from dept03 ; 

-- dept03 : primary key 제약 조건 추가 
alter table dept03 
add constraint PK_DEPT03_DNO primary key (dno) ; 


-- INSERT : 주의 사항 , 각 컬럼에 자료형 : number , 문자, 날짜 , 컬럼에 적용된 제약 조건을 확인 
desc dept03 ; 
select * from user_constraints where table_name in ('DEPT03') ; 

-- insert into 테이블명 (컬럼명, 컬럼명,컬럼명) values ( 값, 값, 값 ) ; 

insert into dept03 ( dno, dname, loc ) 
values ( 50, 'HR', 'SEOUL') ; 

rollback ; 
commit ; 

select * from dept03 ; 

-- insert 시 컬럼 이름을 명시 하지 않는 경우 모든 컬럼에 값을 넣어야함. 
insert into dept03 
values ( 60, '인사부', '부산'); 

commit ; 

-- 컬럼 생략 할때는 모든 컬럼에 값이 순서에 맞게 입력 
insert into dept03 
values ( 70, '인사부');

-- 컬럼을 명시할때 순서를 바꿀 수 있고 , 특정컬럼은 값을 넣지 않아도 됨. 
insert into dept03 ( dname, dno) 
values ( '영업부', 80) ; 

commit ; 


--UPDATE 문 : 입력된 값을 수정시 사용 , 반드시 where 조건을 사용, where 조건에 사용되는 컬럼은 Primary Key 컬럼이어야 함. 
/*
    update 테이블명 
    set 컬럼명 = 바꿀값 , 컬럼명=바꿀값
    where 조건 
*/ 

update dept03 
set loc = '대구'  
where dno = 80 ;  

rollback ; 
commit ; 

select * from dept03 ; 

-- 
update dept03
set dname = '관리부', loc = '광주'
where dno = 40 ; 

--
insert into dept03 
values ( 90, '영업부', '대구') ; 

insert into dept03 
values ( 91, '영업부', '광주') ; 

-- update 에서 반드시 where 조건 ,   조건을 처리하는 컬럼은 Primary key, Unique 키 컬럼을 정의 
update dept03
set dname = '인쇄부' 
where loc = '광주' ;         -- 중복된 값 

-- update 시 primary key 컬럼을 조건으로 처리해서 원하는 값만 수정 
update dept03
set dname = '인쇄부'
where dno in ( 91 , 80) ; 


-- Delete : 레코드를 삭제 할때 , where <조건>  ,  <조건 :  중복되지 않는 컬럼> 
/*
    delete 테이블명 
    where 조건 
*/ 

select * from dept03; 

-- delete 문에서 조건을 사용하지 않는 경우 모든 레코드가 삭제됨 ,  
delete dept03 

rollback ; 
commit ; 

-- delete , where 조건 사용 ,    <== 
delete dept03 
where dno = 91 ;  


-- 모든 레코드를 삭제 :  
    -- delete               :   레코드 하나 하나를 삭제함. 시간이 오래 걸림.  << 로우레벨 포멧 >>
    -- truncate table 테이블명  :    한꺼번에 통채로 모든 레코드를 날림 ,  <<빠른 포멧>>
    
    -- drop table 테이블명      : 테이블 자체를 삭제   

select * from dept03; 

rollback ; 
commit ; 

-- 모든 레코드 삭제 : 값만 삭제
delete dept03 ; 

-- 모든 레코드 삭제 : 값만 삭제    <== DDL 문이기 때문에 Rollback이 안됨.  실행후 바로 커밋됨 
            -- 빠르게 처리됨 
            
truncate table dept03 ; 

-----------------------------------------------------------
create table emp04 
as 
select * from employee ; 

select * from emp04 ; 

/* emp04 
    임의의 값을 추가 : insert 
    임의의 값을 수정 : update 
    임의의 값을 삭제 : delete  
    rollback ; 
    commit ; 
*/ 
/* DDL :CREATE  (생성 ),ALTER ( 수정 ) ,DROP (삭제 ) , <== 테이블 ,뷰 ,함수 ,시퀀스 ,트리거 ,저장 프로시져 /스키마를생성 ,수정 ,삭제
 자료형 :데이터를 저장하는 파일 ,
 --- 숫자 : NUMBER : (정수자릿수 ) : 정수
  -- NIMBER (7,2 )  :소수ㅡ : 전체 7 자리 소숫점 자리2자리 까지 
 -- 문자 :CHAR (N) :영문1자 (1BYTE) ,영문을제외한 한글1자(3BYTE)  ,
-- 성능이 빠르다 ,하드 공간낭비가 발생할수 있다 .
-- 주민번호 (13) , 자릿수가 지정된 곳에 사용됨
--들어오는 공간만큼 가변적으로 변경된다VARCHAR2 (N) : 영문 1자 (1BYTE) ,한글 1자 (3BYTE) 
  --가변 공간 으로 적용됨 , : 성능은 CHAR 보다 느릴수있다 , 하드공간 낭비를 지킬수있다
   -- 자릿수를 알수없는 문자열일떄 사용된다 .
   -- NCHAR (N) 유니코드 10자까지 들어갈수 있다 . NCHAR (10 ) 한글 10자까지 들어감 . 
   NVARCHAR2( N) ; 
   -- 날짜 DATE : BC 4712년 1월1일 ~ 999년 999일 년,월,일,시,분,초까지만 저장가능
TIMESTAMP : 
-IOE 
*/

DROP TABLE TEST10;

CREATE TABLE TEST10(
ID NUMBER(4) NOT NULL PRIMARY KEY,
N1 CHAR(10) ,
N2 NCHAR(10) ,
N3 VARCHAR2(10),
N4 NVARCHAR2(10) 
);


INSERT INTO TEST10 (ID,N1,N2,N3,N4)
VALUES(1111,'ASDFGHJQWE','가나다라마바사아자차','ABCEDFGHJI','하파타다가바제다우');

INSERT INTO TEST10 (ID,N1)
VALUES(1112,'가나다');

/*
        JOIN : DataBase 에는 많은 테이블이 존재합니다.  모델링을 통해서 테이블이 분리 되어 있다. ( R-DBMS) 
        employee 테이블과 department 테이블은 하나의 테이블인데 모델링(1,2,3정규화), 을 통해서 테이블을 분리 
        모텔링 :  중복 제거, 성능향상
        
        제약 조건 : 테이블의 컬럼에 들어가는 키 , 데이터의 무결성 (결함없는데이터, 원하는 값만 ) 
            Primary Key :  
                  - 테이블의 컬럼에 1번만 넣을 수 있다.  
                  - 두개 컬럼을 묶어서 PK를 넣을 수 있다. 
                  - 테이블을 생성할때 반드시 PK 이 존재해야 한다.  - Update, Delete 구문에서 PK 컬럼을 where 조건으로 사용함. 
                  - 특정 컬럼에 중복 된 값을 넣지 못하도록 함. 
                  - 반드시 not null 컬럼이어야함.  null을 넣을 수 없다. 
                  - index 가 자동으로 생성 된다. 컬럼의 검색을 빠르게 함. 
                  - JOIN 시 ON 에서 많이 사용하는 키 컬럼. 
            Unique Key : 
                  - 컬럼에 중복된 값을 넣지 못하도록 함. 
                  - null을 넣을 수 있다. 단 1번만 넣을 수 있다.  not null, null 
                  - 하나의 테이블에 여러번 Unique Key 를 넣을 수 있다. 
                  - index 가 자동으로 생성됨.  JOIN 시 ON에 사용됨 
            Foreign Key : 
                  - 다른 테이블(부모 테이블) 의 특정 컬럼을 참조 해서 값을 넣도록 함. 
                  - Foreign Key 가 잠조하는 컬럼은 부모테이블의 Primary Key , Unique Key 를 참조함. 
             NOT NULL 
                   - 컬럼에 NULL을 넣을 수 없도록 하는 제약 조건 
             CHECK 
                    - 컬럼에 조건을 넣어서 내개 원하는 값만 넣을 수 있도록 함. 
                    -  월 컬럼에  1 ~ 12 까지 넣을 수 있도록 
             default  : 제약 조건은 아니지만 제약 조건처럼 사용됨 
                     -  컬럼에 값을 넣지 않으면 default 로 설정된 값이 등록됨. 
*/ 

CREATE TABLE MEMBER1(
ID VARCHAR2(50) NOT NULL PRIMARY KEY,
PASS VARCHAR2(50) NOT NULL,
ADDR VARCHAR2(100) NULL,
JOMIN CHAR(13) NULL,--자릿수가 지정된 컬럼 
PHONE VARCHAR(50),
AGE NUMBER(3),  -- 정수 3자리
WEIGHT NUMBER(5,2) -- 실수 안에5자리 ,소숫점2자리
);

DESC MEMBER;

INSERT INTO MEMBER1(ID,PASS,ADDR,JUMIN,PHONE,AGE,WEIGHTO
VALUES ('ABC' ,'1234' ,'셔틀','222345-444567','010-6546-7897','30l25
 );   
 

CREATE TABLE MEMBER3(
ID VARCHAR(50) NOT NULL CONSTRAINT PK_MEMBER3_ID PRIMARY KEY,
PASS VARCHAR2(50) CONSTRAUNT NN_MEMBER3_PASS NOT NULL,
ADDR VARCHAR2(100) NULL,
JUMUN CHAR(13)NULL CONSTRAINT U_MEMBER3_JUMIN UNIQUE ,
PHONE VARCHAR2(50) NOT NULL CONSTRAINT U_MEMEBER3_PHONE UNIQUE,
AGE NUMBER(3),
WEIGHT NUMBER (5,2)
);
 
 INSERT INTO MEMBER3 (ID, PASS, ADDR, JUMUN, PHONE, AGE, WEIGHT)
VALUES ('ABC', '1234', '서울', '2225-4567', '010-6546-7897', 30, 25);

 
 CREATE TABLE MEMBER4 (
    ID VARCHAR2(50) NOT NULL CONSTRAINT PK_MEMBER4_ID PRIMARY KEY, --ㄱ계약조건이름을 생략하면 ORCLE에서 자동으로
    PASS VARCHAR2(50) CONSTRAINT NN_MEMBER4_PASS NOT NULL,
    ADDR VARCHAR2(100)NULL CONSTRAINT CK_MEMVER4_ADDR CHECK (ADDR IN ('서울','부산','대구')) ,
    JUMIN CHAR(13) CONSTRAINT U_MEMBER4_JUMIN UNIQUE,                     -- 중복되면 안됨 
    PHONE VARCHAR2(50) NOT NULL CONSTRAINT U_MEMBER4_PHONE UNIQUE,         -- 중복되면 안됨 
    AGE NUMBER(3) CONSTRAINT CK_MEMBER4_AGE CHECK (AGE > 0 AND AGE < 200),    -- 정수3자리 
    GENDER CHAR(1) CONSTRAINT CK_MEMBER4_GENDER CHECK (GENDER IN ('W','IN')),
    WEIGHT NUMBER(5,2), -- 정수 전체4자리 ,소숫점 이하2자리 
    HIREDATE DATE DEFAULT SYSDATE,
    ADDR2 CHAR(10) DEFAULT '서울',
    AGE2 NUMBER DEFAULT 0
);

INSERT INTO MEMBER4(ID,PASS,ADDR,JUMIN,PHONE,AGE,WEIGHT,GENDER)
VALUES ('ABC','1234','서울','2225-4567','010-6546-7897',100,77.77,'W');

-- DEFAULT :제약조건이 아니다 .제약조건이동을 부여할수없다.
-- 값을 넣을떄 값이 들어가고 값을 넣지않을떄 DEFAULT로 설정된값이들어간다 .

INSERT INTO MEMBER4(ID,PASS,ADDR,JUMIN,PHONE,AGE,WEIGHT,GENDER,HIREDATE,ADDR2,AGE2)
VALUES ('ABC','1234','서울','2225-4567','010-6546-7897',100,77.77,'W','22/11/11',30);



SELECT * FROM MEMBER4;

 DROP TABLE MEMBER4;


COMMIT ;
 
 
 
 
 
 
 
 
 
 
 
 
 




