/*
    SQL : ��� ���� ���� , select, create, alter, drop , insert, update, delete, grant, revoke, rollbac, commit 
       - ����ȭ�� ���� ��� 
    
    SQL ���� 
        - DQL(Data Query Language)  : ���, �˻� , select 
        - DDL (Date Definition Language) : ��Ű�� (Ʋ, ����), ��ü (���̺�, ��, �Լ�, ������, Ʈ����, �������ν���, �ε���) ����, ����,����
                    create (����), alter (����), drop(����) 
        - DML ( Data Manupulation Language) : ���̺��� ���ڵ�(��) �� �����ϴ� ��� 
                    insert( �Է� ) , update( ���� ) , delete ( ���� ) 
                    -- Ʈ������� �߻�( RAM )  , commit : RAM�� ����� ������ DataBase ������ �����ϵ��� ��. , rollback : ������� �ǵ���. 
                    -- Ʈ������ insert, update, delete  ���۵Ǹ� �ڵ����� Ʈ������� ���� 
                    -- Ʈ������� ���� : rollback : �޸𸮿� ����� ������ �ٽ� ���� ���·� �ǵ���, commit : DB�� ���������� ������. 
                    -- Ʈ������ ���� ���� ������ LOCK �ɷ��� Ʈ���� Ʈ����� ����ɶ� ���� LOCK �ɷ� �ִ�. 
                    -- ����Ŭ :   DML ���� �����ϸ� �ڵ����� Ʈ������� ���۵� .     ���� (rollback, commit)  <== ��� 
                    -- MySQL, MSSQL : DML ���� �����ϸ� �ڵ����� Ʈ������� ���۵� . commit �ڵ����� ó���� 
                    -- ��������� Ʈ������� ���� �� �� �ְ�, ��������� ���� �� �ִ�. 
        - DCL ( Data Control Language) :  ����(Account) ���� ��ü(Resource) �� ������ �ο���.  grant(�ο�), revoke (����)
        - TCL ( Transaction Control Language) : Ʈ������� ���� �ϴ� ���,  <== DML ������ ���� 
                commit (DB�� ������ ����), rollback ( �����Ƿ� �ǵ���), savepoint ( Ʈ����� ������ �ӽ� ������� ���� ) 
                begin transaction   : ��������� Ʈ����� ���� 
*/ 

/*
        Ʈ����� :  �۾�(��) �� ó���ϴ� �ּ� ����  : ALL or NOTHING :  �Ǹ� ���� �ǰ� �ϰų� �ȵǸ� ���� �ȵǰ� ��.
            - Ʈ����� log  �� ��� �Ǿ� �ִ�.   <== ������ �������� ���� ,  ��� ���� ������ �ƴ϶� ������ �������� �������� 
            
            - Ʈ������� 4���� Ư¡ 
                - ���ڼ� (Atomicity) : ���� ó���ϴ� �ּ� ���� 
                - �ϰ��� (Consistency) : Ʈ����ǿ��� ó���� ����� �ϰ����� ������. ALL or NOTHING 
                - ������ (lsolation) : �ϳ��� Ʈ������� �ٸ� Ʈ����ǰ� �ݸ��Ǿ� �ִ�. , LOCK, 
                - ���Ӽ� ( Durability) : commit  , DB�� ���������� �����               
                
                
*/ 

-- ���̺� ���� 

create table account10 
as 
select eno as no, ename as name , salary as  account
from employee ; 

-- ������ ���� ���̺� :  no : ���¹�ȣ,  name : �������� , account : �� (�Աݾ�), ��  
select * from account10; 

-- SMITH ���� Miller���� 10���� �Ա�  :  2���� update ������ �ϳ��� transaction ���� ó�� : ALL or NOTHING 
    -- SMITH Account - 10��    :     update account10 set account = account - 10 where no= 7369
    -- Miller Account + 10��   :      update account10 set account = account + 10 where no = 7934 

begin transaction ;      -- ��������� Ʈ������� ���� 

update  account10 
    set  account = account - 10 
where no = 7369;

update account10 
set account = account + 10 
 where no = 7934; 

select * from account10; 

-- Ʈ����� ���� 
rollback; 
commit ; 

desc account10 ; 


/* 
    DML : insert(���� �Է�) , update (����) , delete (����)  
        <== Ʈ����� �ڵ� ����, 
        <== Ʈ����� ���� ( rollback, commit) �� ��� (����Ŭ) 

*/ 

-- ���̺� ���� 
create table dept03 
as 
select * from department ; 

select * from dept03 ; 

-- dept03 : primary key ���� ���� �߰� 
alter table dept03 
add constraint PK_DEPT03_DNO primary key (dno) ; 


-- INSERT : ���� ���� , �� �÷��� �ڷ��� : number , ����, ��¥ , �÷��� ����� ���� ������ Ȯ�� 
desc dept03 ; 
select * from user_constraints where table_name in ('DEPT03') ; 

-- insert into ���̺�� (�÷���, �÷���,�÷���) values ( ��, ��, �� ) ; 

insert into dept03 ( dno, dname, loc ) 
values ( 50, 'HR', 'SEOUL') ; 

rollback ; 
commit ; 

select * from dept03 ; 

-- insert �� �÷� �̸��� ��� ���� �ʴ� ��� ��� �÷��� ���� �־����. 
insert into dept03 
values ( 60, '�λ��', '�λ�'); 

commit ; 

-- �÷� ���� �Ҷ��� ��� �÷��� ���� ������ �°� �Է� 
insert into dept03 
values ( 70, '�λ��');

-- �÷��� ����Ҷ� ������ �ٲ� �� �ְ� , Ư���÷��� ���� ���� �ʾƵ� ��. 
insert into dept03 ( dname, dno) 
values ( '������', 80) ; 

commit ; 


--UPDATE �� : �Էµ� ���� ������ ��� , �ݵ�� where ������ ���, where ���ǿ� ���Ǵ� �÷��� Primary Key �÷��̾�� ��. 
/*
    update ���̺�� 
    set �÷��� = �ٲܰ� , �÷���=�ٲܰ�
    where ���� 
*/ 

update dept03 
set loc = '�뱸'  
where dno = 80 ;  

rollback ; 
commit ; 

select * from dept03 ; 

-- 
update dept03
set dname = '������', loc = '����'
where dno = 40 ; 

--
insert into dept03 
values ( 90, '������', '�뱸') ; 

insert into dept03 
values ( 91, '������', '����') ; 

-- update ���� �ݵ�� where ���� ,   ������ ó���ϴ� �÷��� Primary key, Unique Ű �÷��� ���� 
update dept03
set dname = '�μ��' 
where loc = '����' ;         -- �ߺ��� �� 

-- update �� primary key �÷��� �������� ó���ؼ� ���ϴ� ���� ���� 
update dept03
set dname = '�μ��'
where dno in ( 91 , 80) ; 


-- Delete : ���ڵ带 ���� �Ҷ� , where <����>  ,  <���� :  �ߺ����� �ʴ� �÷�> 
/*
    delete ���̺�� 
    where ���� 
*/ 

select * from dept03; 

-- delete ������ ������ ������� �ʴ� ��� ��� ���ڵ尡 ������ ,  
delete dept03 

rollback ; 
commit ; 

-- delete , where ���� ��� ,    <== 
delete dept03 
where dno = 91 ;  


-- ��� ���ڵ带 ���� :  
    -- delete               :   ���ڵ� �ϳ� �ϳ��� ������. �ð��� ���� �ɸ�.  << �ο췹�� ���� >>
    -- truncate table ���̺��  :    �Ѳ����� ��ä�� ��� ���ڵ带 ���� ,  <<���� ����>>
    
    -- drop table ���̺��      : ���̺� ��ü�� ����   

select * from dept03; 

rollback ; 
commit ; 

-- ��� ���ڵ� ���� : ���� ����
delete dept03 ; 

-- ��� ���ڵ� ���� : ���� ����    <== DDL ���̱� ������ Rollback�� �ȵ�.  ������ �ٷ� Ŀ�Ե� 
            -- ������ ó���� 
            
truncate table dept03 ; 

-----------------------------------------------------------
create table emp04 
as 
select * from employee ; 

select * from emp04 ; 

/* emp04 
    ������ ���� �߰� : insert 
    ������ ���� ���� : update 
    ������ ���� ���� : delete  
    rollback ; 
    commit ; 
*/ 
/* DDL :CREATE  (���� ),ALTER ( ���� ) ,DROP (���� ) , <== ���̺� ,�� ,�Լ� ,������ ,Ʈ���� ,���� ���ν��� /��Ű�������� ,���� ,����
 �ڷ��� :�����͸� �����ϴ� ���� ,
 --- ���� : NUMBER : (�����ڸ��� ) : ����
  -- NIMBER (7,2 )  :�Ҽ��� : ��ü 7 �ڸ� �Ҽ��� �ڸ�2�ڸ� ���� 
 -- ���� :CHAR (N) :����1�� (1BYTE) ,������������ �ѱ�1��(3BYTE)  ,
-- ������ ������ ,�ϵ� �������� �߻��Ҽ� �ִ� .
-- �ֹι�ȣ (13) , �ڸ����� ������ ���� ����
--������ ������ŭ ���������� ����ȴ�VARCHAR2 (N) : ���� 1�� (1BYTE) ,�ѱ� 1�� (3BYTE) 
  --���� ���� ���� ����� , : ������ CHAR ���� �������ִ� , �ϵ���� ���� ��ų���ִ�
   -- �ڸ����� �˼����� ���ڿ��ϋ� ���ȴ� .
   -- NCHAR (N) �����ڵ� 10�ڱ��� ���� �ִ� . NCHAR (10 ) �ѱ� 10�ڱ��� �� . 
   NVARCHAR2( N) ; 
   -- ��¥ DATE : BC 4712�� 1��1�� ~ 999�� 999�� ��,��,��,��,��,�ʱ����� ���尡��
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
VALUES(1111,'ASDFGHJQWE','�����ٶ󸶹ٻ������','ABCEDFGHJI','����Ÿ�ٰ������ٿ�');

INSERT INTO TEST10 (ID,N1)
VALUES(1112,'������');

/*
        JOIN : DataBase ���� ���� ���̺��� �����մϴ�.  �𵨸��� ���ؼ� ���̺��� �и� �Ǿ� �ִ�. ( R-DBMS) 
        employee ���̺�� department ���̺��� �ϳ��� ���̺��ε� �𵨸�(1,2,3����ȭ), �� ���ؼ� ���̺��� �и� 
        ���ڸ� :  �ߺ� ����, �������
        
        ���� ���� : ���̺��� �÷��� ���� Ű , �������� ���Ἲ (���Ծ��µ�����, ���ϴ� ���� ) 
            Primary Key :  
                  - ���̺��� �÷��� 1���� ���� �� �ִ�.  
                  - �ΰ� �÷��� ��� PK�� ���� �� �ִ�. 
                  - ���̺��� �����Ҷ� �ݵ�� PK �� �����ؾ� �Ѵ�.  - Update, Delete �������� PK �÷��� where �������� �����. 
                  - Ư�� �÷��� �ߺ� �� ���� ���� ���ϵ��� ��. 
                  - �ݵ�� not null �÷��̾����.  null�� ���� �� ����. 
                  - index �� �ڵ����� ���� �ȴ�. �÷��� �˻��� ������ ��. 
                  - JOIN �� ON ���� ���� ����ϴ� Ű �÷�. 
            Unique Key : 
                  - �÷��� �ߺ��� ���� ���� ���ϵ��� ��. 
                  - null�� ���� �� �ִ�. �� 1���� ���� �� �ִ�.  not null, null 
                  - �ϳ��� ���̺� ������ Unique Key �� ���� �� �ִ�. 
                  - index �� �ڵ����� ������.  JOIN �� ON�� ���� 
            Foreign Key : 
                  - �ٸ� ���̺�(�θ� ���̺�) �� Ư�� �÷��� ���� �ؼ� ���� �ֵ��� ��. 
                  - Foreign Key �� �����ϴ� �÷��� �θ����̺��� Primary Key , Unique Key �� ������. 
             NOT NULL 
                   - �÷��� NULL�� ���� �� ������ �ϴ� ���� ���� 
             CHECK 
                    - �÷��� ������ �־ ���� ���ϴ� ���� ���� �� �ֵ��� ��. 
                    -  �� �÷���  1 ~ 12 ���� ���� �� �ֵ��� 
             default  : ���� ������ �ƴ����� ���� ����ó�� ���� 
                     -  �÷��� ���� ���� ������ default �� ������ ���� ��ϵ�. 
*/ 

CREATE TABLE MEMBER1(
ID VARCHAR2(50) NOT NULL PRIMARY KEY,
PASS VARCHAR2(50) NOT NULL,
ADDR VARCHAR2(100) NULL,
JOMIN CHAR(13) NULL,--�ڸ����� ������ �÷� 
PHONE VARCHAR(50),
AGE NUMBER(3),  -- ���� 3�ڸ�
WEIGHT NUMBER(5,2) -- �Ǽ� �ȿ�5�ڸ� ,�Ҽ���2�ڸ�
);

DESC MEMBER;

INSERT INTO MEMBER1(ID,PASS,ADDR,JUMIN,PHONE,AGE,WEIGHTO
VALUES ('ABC' ,'1234' ,'��Ʋ','222345-444567','010-6546-7897','30l25
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
VALUES ('ABC', '1234', '����', '2225-4567', '010-6546-7897', 30, 25);

 
 CREATE TABLE MEMBER4 (
    ID VARCHAR2(50) NOT NULL CONSTRAINT PK_MEMBER4_ID PRIMARY KEY, --����������̸��� �����ϸ� ORCLE���� �ڵ�����
    PASS VARCHAR2(50) CONSTRAINT NN_MEMBER4_PASS NOT NULL,
    ADDR VARCHAR2(100)NULL CONSTRAINT CK_MEMVER4_ADDR CHECK (ADDR IN ('����','�λ�','�뱸')) ,
    JUMIN CHAR(13) CONSTRAINT U_MEMBER4_JUMIN UNIQUE,                     -- �ߺ��Ǹ� �ȵ� 
    PHONE VARCHAR2(50) NOT NULL CONSTRAINT U_MEMBER4_PHONE UNIQUE,         -- �ߺ��Ǹ� �ȵ� 
    AGE NUMBER(3) CONSTRAINT CK_MEMBER4_AGE CHECK (AGE > 0 AND AGE < 200),    -- ����3�ڸ� 
    GENDER CHAR(1) CONSTRAINT CK_MEMBER4_GENDER CHECK (GENDER IN ('W','IN')),
    WEIGHT NUMBER(5,2), -- ���� ��ü4�ڸ� ,�Ҽ��� ����2�ڸ� 
    HIREDATE DATE DEFAULT SYSDATE,
    ADDR2 CHAR(10) DEFAULT '����',
    AGE2 NUMBER DEFAULT 0
);

INSERT INTO MEMBER4(ID,PASS,ADDR,JUMIN,PHONE,AGE,WEIGHT,GENDER)
VALUES ('ABC','1234','����','2225-4567','010-6546-7897',100,77.77,'W');

-- DEFAULT :���������� �ƴϴ� .���������̵��� �ο��Ҽ�����.
-- ���� ������ ���� ���� ���� ���������� DEFAULT�� �����Ȱ��̵��� .

INSERT INTO MEMBER4(ID,PASS,ADDR,JUMIN,PHONE,AGE,WEIGHT,GENDER,HIREDATE,ADDR2,AGE2)
VALUES ('ABC','1234','����','2225-4567','010-6546-7897',100,77.77,'W','22/11/11',30);



SELECT * FROM MEMBER4;

 DROP TABLE MEMBER4;


COMMIT ;
 
 
 
 
 
 
 
 
 
 
 
 
 




