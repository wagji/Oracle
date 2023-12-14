

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


/*    DDL : create (����), alter (����) , drop (����) <== ���̺�, ��, �Լ�, ������, Ʈ����, �������ν��� ,   ��ī���� ���� , ����, ���� 

    �ڷ��� : �����͸� �����ϴ� Ÿ�� 
        - ���� :   number (3)  : ���� 3�ڸ� 
                       number ( 7, 2 )    : �Ҽ�   ,    ��ü 7�ڸ� , �Ҽ������� 2�ڸ� ���� 
        - ���� : char (n) ;  ���� 1�� (1byte) , �ѱ� 1�� (3byte) 
                    `    - ������ ������. �ϵ� ���� ���� �߻��� �� �ִ�. 
                         - �ֹι�ȣ(13) , �ڸ��� �� ������ ���� ���� 
                     varchar2 (n) : ���� 1�� (1byte) , �ѱ� 1�� (3byte)  
                         - ������������ ����� , ������ char ���� ������ �ִ�. �ϵ���� ���� ��Ű�� �ʴ´�. 
                         - �ڸ����� �˼� ���� ���ڿ� �� ���� 
                      nchar(n)       :  nchar(10) :  �ѱ� 10�� 
                      nvarchar2(n) : nchar(10) :  �ѱ� 10�� 
            - ��¥ : date  :  BC 4712�� 1�� 1��  ~~~ 9999�� 12�� 31�ϱ�������,    ��, ��, �� �� ��, �� ������ ���� ���� 
                         timestamp : insert (���� ������ �ý����� �ð�) : ��, ��, ��, ��, ��,�� �и������� ���� ���� 
            - LOB ������ Ÿ�� : �뷮�� ���� ����, ���̳ʸ� ���� 
                         CLOB : ���ڸ� �뷮���� ������ �ִ�.    <== �� ���� 
                         BLOB : mp3, jpeg, hwp   ���� ������ ���� 
                         BFile : ��뷮 ���� ����                                                
*/ 

-- 
drop table test10 ; 

create table test10 (
        id number(4) not null primary key ,    -- �ߺ��� ���� �� ����. ���� 4�� 
        n1 char(10)  ,                              -- ���� 10��, �ѱ� 3�� 
        n2 nchar(10) ,                              -- ���� 10�� , �ѱ� 10�� 
        n3 varchar2(10) ,                      -- ���� 10��, �ѱ� 3�� 
        n4 nvarchar2(10)                       -- ���� 10�� , �ѱ� 10�� 
); 

select * from test10 ; 
commit; 

insert into test10 ( id , n1 , n2, n3, n4) 
values ( 1111, 'abcdefghij', '�����ٶ󸶹ٻ�ī��Ÿ' , 'abcdefghij', '�����ٶ󸶹ٻ�ī��Ÿ' ) ; 

insert into test10 ( id , n1 ) 
values ( 1112, '������') ; 

/*
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
                     
            ���� ������ ����ϴ� ������ ���� : user_constraints 
                select * from user_constraints where table_name in ('���̺��') ; 

*/ 

-- ���� ���� �̸��� ���� �ʰ� ���̺� ���� �� ��� : Oracle���� ���������̸��� �����ϰ� �����Ѵ�. 
--  insert �� ������ �߻��� ��� ���������̸����� ������ �÷��� ã�� �����. 
create table member1 (
    id varchar2(50) not null primary key ,     -- ���� ���� �̸��� �����ϸ� Oracle���� �ڵ����� ������. 
    pass varchar2(50) not null, 
    addr varchar2(100) null , 
    jumin char(13) null ,               -- �ڸ����� ������ �÷� 
    phone varchar2(50) , 
    age number(3) ,                 -- ���� 3�ڸ�
    weight number (5,2)         -- �Ǽ� ��ü 5�ڸ�, �Ҽ������� 2�ڸ�
    ) ; 

desc member1 ; 

insert into member1 (id , pass, addr, jumin, phone, age, weight) 
values ( 'abc', '1234', '����', '123456-789101', '010-1111-1111', 30 , 77.77); 
commit ; 

select * from member1; 

select * from user_constraints where table_name in ('MEMBER1') ; 

-- ���̺� ������ ���� ���� �̸� �ο�
create table member2 (
    id varchar2(50) not null constraint PK_MEMBER2_ID  primary key ,     -- ���� ���� �̸��� �����ϸ� Oracle���� �ڵ����� ������. 
    pass varchar2(50) constraint NN_MEMBER2_PASS not null, 
    addr varchar2(100) null , 
    jumin char(13) null ,               -- �ڸ����� ������ �÷� 
    phone varchar2(50) , 
    age number(3) ,                 -- ���� 3�ڸ�
    weight number (5,2)         -- �Ǽ� ��ü 5�ڸ�, �Ҽ������� 2�ڸ�
    ) ; 

select * from user_constraints where table_name in ('MEMBER2') ; 

insert into member2 (id , addr, jumin, phone, age, weight) 
values ( 'abcd', '����', '123456-789101', '010-1111-1111', 30 , 77.77); 
commit ; 


/* UNIQUE :  �ߺ��� ���� ������ ����. null�� ���� �� �ִ�.  ���̺� ������ ������ �ִ�. 

*/ 


create table member3 (
    id varchar2(50) not null constraint PK_MEMBER3_ID  primary key ,     -- ���� ���� �̸��� �����ϸ� Oracle���� �ڵ����� ������. 
    pass varchar2(50) constraint NN_MEMBER3_PASS not null, 
    addr varchar2(100) null , 
    jumin char(13) null constraint U_MEMBER3_JUMIN unique  ,               -- �ߺ��Ǹ� �ȵ� 
    phone varchar2(50) not null constraint U_MEMBER3_PHONE unique , -- �ߺ��Ǹ� �ȵ� 
    age number(3) ,                 -- ���� 3�ڸ�
    weight number (5,2)         -- �Ǽ� ��ü 5�ڸ�, �Ҽ������� 2�ڸ�
    ) ; 

insert into member3 (id , pass,  addr, jumin, phone, age, weight) 
values ( 'abc', '1234', '����', '123456-789102', '010-1111-1112', 30 , 77.77); 
commit ; 

-- CHECK ���� ���� : �÷��� ���ǿ� �´� ���� ���� �� �ֵ��� ��. 
drop table member4 ; 

create table member4 (
    id varchar2(50) not null constraint PK_MEMBER4_ID  primary key ,     -- ���� ���� �̸��� �����ϸ� Oracle���� �ڵ����� ������. 
    pass varchar2(50) constraint NN_MEMBER4_PASS not null, 
    addr varchar2(100) null constraint CK_MEMBER4_ADDR check (addr in ('����', '�λ�','�뱸')) , 
    jumin char(13) null constraint U_MEMBER4_JUMIN unique  ,               -- �ߺ��Ǹ� �ȵ� 
    phone varchar2(50) not null constraint U_MEMBER4_PHONE unique , -- �ߺ��Ǹ� �ȵ� 
    age number(3) constraint CK_MEMBER4_AGE check (age > 0 and age < 200)  ,                 -- ���� 3�ڸ�
    gender char(1) constraint CK_MEMBER4_GENDER check ( gender in ('w', 'm')), 
    weight number (5,2)        -- �Ǽ� ��ü 5�ڸ�, �Ҽ������� 2�ڸ�

    ) ; 

insert into member4 (id , pass,  addr, jumin, phone, age, weight, gender  ) 
values ( 'abc', '1234', '�뱸', '123456-789102', '010-1111-1112', 100, 77.77, 'w'); 
commit ; 

-- default : ���������� �ƴϴ�. �������� �̸��� �ο� �� �� ����. 
        -- ���� ������ ���� ���� ���� ���� ������ default �� ������ ���� ����. 

create table member5 (
    id varchar2(50) not null constraint PK_MEMBER5_ID  primary key ,     -- ���� ���� �̸��� �����ϸ� Oracle���� �ڵ����� ������. 
    pass varchar2(50) constraint NN_MEMBER5_PASS not null, 
    addr varchar2(100) null constraint CK_MEMBER5_ADDR check (addr in ('����', '�λ�','�뱸')) , 
    jumin char(13) null constraint U_MEMBER5_JUMIN unique  ,               -- �ߺ��Ǹ� �ȵ� 
    phone varchar2(50) not null constraint U_MEMBER5_PHONE unique , -- �ߺ��Ǹ� �ȵ� 
    age number(3) constraint CK_MEMBER5_AGE check (age > 0 and age < 200)  ,                 -- ���� 3�ڸ�
    gender char(1) constraint CK_MEMBER5_GENDER check ( gender in ('w', 'm')), 
    weight number (5,2),         -- �Ǽ� ��ü 5�ڸ�, �Ҽ������� 2�ڸ�
    hiredate date  default sysdate, 
    addr2 char(10) default '����' , 
    age2 number default 0 
    ) ; 
    
select * from member5; 

insert into member5 (id , pass,  addr, jumin, phone, age, weight, gender  ) 
values ( 'abc', '1234', '�뱸', '123456-789102', '010-1111-1112', 100, 77.77, 'w'); 

insert into member5 (id , pass,  addr, jumin, phone, age, weight, gender , hiredate, addr2, age2 ) 
values ( 'abcd', '1234', '�뱸', '123456-789103', '010-1111-1113', 100, 77.77, 'w', '22/11/11', '����', 30); 

commit ; 


-- ��¥ Ÿ�Կ� üũ ���� ���� 

CREATE TABLE emp55 (
    e_id NUMBER PRIMARY KEY, -- ���̵� �÷�
    h_date DATE  CHECK (h_date BETWEEN TO_DATE('1981-01-01', 'YYYY-MM-DD') AND TO_DATE('1981-12-31', 'YYYY-MM-DD')) 
);

insert into emp55 
values ( 10, '81/11/11'); 

commit ; 
CREATE TABLE SALE (
    SALE_DATE DATE NOT NULL,
    WINE_CODE VARCHAR2(6) NOT NULL,
    MEM_ID VARCHAR2(30) NOT NULL,
    SALE_AMOUNT VARCHAR2(5) NOT NULL,              
    SALE_PRICE VARCHAR2(6) NOT NULL, 
    SALE_TOT_PRICE VARCHAR2(15) NOT NULL,
    CONSTRAINT PK_SALE_SALE_DATE PRIMARY KEY (SALE_DATE),
    CONSTRAINT FK_SALE_WINE_CODE 
 FOREIGN KEY (WINE_CODE) 
 REFERENCES SALE_WINE_TABLE(WINE_CODE), CONSTRAINT FK_SALE_MEM_ID FOREIGN KEY (MEM_ID) 
 REFERENCES SALE_MEMBER_TABLE(MEM_ID) 
);



   CREATE TABLE MEMBER (
    MEMBER_ID VARCHAR2(6) NOT NULL,
    MEM_GRADE VARCHAR2(20) NOT NULL,
    MEM_PW VARCHAR2(20) NOT NULL,
    MEM_BIRTH DATE DEFAULT SYSDATE NOT NULL,
    MEM_TEL VARCHAR2(20),
    MEM_PT VARCHAR2(10) NOT NULL,
    PRIMARY KEY (MEMBER_ID, MEM_GRADE)
);



CREATE TABLE GRADE_PT_RADE (
    MEM_GRADE VARCHAR2(20) NOT NULL PRIMARY KEY,
    GRADE_PT NUMBER(3,2)
);




CREATE TABLE TODAY (
    TODAY_CODE VARCHAR2(6) NOT NULL PRIMARY KEY,
    TODAY_SENS_VALUE NUMBER(3),
    TODAY_INTELL_VALUE  NUMBER(3),
    TODAY_PHY_VALUE  NUMBER(3)
);



CREATE TABLE NATION (
    NATION_CODE VARCHAR2(26) NOT NULL PRIMARY KEY,
    NATION_NAME VARCHAR2(50)
);




CREATE TABLE WINE (
    WINE_CODE VARCHAR2(20) NOT NULL, 
    WINE_NAME VARCHAR2(100) NOT NULL,
    WINE_URL BLOB,
    NATION_CODE VARCHAR2(6),
    WINE_TYPE_CODE VARCHAR2(6),
    WINE_SUGAR_CODE NUMBER(2),
    WINE_PRICE NUMBER(15) NOT NULL,
    WINE_VINTAGE DATE DEFAULT SYSDATE,
    THEME_CODE VARCHAR2(6),
    TODAY_CODE VARCHAR2(6),
    CONSTRAINT PK_WINE PRIMARY KEY (WINE_CODE),
    CONSTRAINT FK_WINE 
        FOREIGN KEY (NATION_CODE, WINE_TYPE_CODE, THEME_CODE, TODAY_CODE)
        REFERENCES OTHER_TABLE(NATION_CODE, WINE_TYPE_CODE, THEME_CODE, TODAY_CODE)
    -- Add other columns as needed
);





CREATE TABLE THEME(
    THEME_COE VARCHAR2(6) NOT NULL PRIMARY KEY,
    THEME_NAME VARCHAR2(50) NOT NULL
);





CREATE TABLE STOCK_MANAGEMENT (
    STOCK_CODE VARCHAR2(6) NOT NULL PRIMARY KEY,
    WINE_CODE VARCHAR2(6) NOT NULL,
    MANAGER_ID VARCHAR2(30) NOT NULL,
    WARE_DATE DATE DEFAULT SYSDATE NOT NULL,
    STOCK_AMOUNT NUMBER(5) NOT NULL,
    CONSTRAINT FK_MANAGEMENT_WINECODE FOREIGN KEY (WINE_CODE) REFERENCES WINE(WINE_CODE),
    CONSTRAINT FK_MANAGEMENT_MANAGER_ID FOREIGN KEY (MANAGER_ID) REFERENCES MANAGER(MANAGER_ID)
);

    
    
    
CREATE TABLE MANAGER (
    MANAGER_ID VARCHAR2(30) NOT NULL PRIMARY KEY,
    MANAGER_PWD VARCHAR2(20) NOT NULL,
    MANAGER_FEL  VARCHAR2(20)
    );
    





CREATE TABLE WINE_TYPE (
    WINE_TYPE_CODE VARCHAR2(6) NOT NULL PRIMARY KEY,
    WINE_TYPE_NAME  VARCHAR2(50) 
    );
    
    
    -----------------------------------------------------------------
    
    
    CREATE TABLE SALE (
    SALE_DATE DATE NOT NULL,
    WINE_CODE VARCHAR2(6) NOT NULL,
    MEM_ID VARCHAR2(30) NOT NULL,
    SALE_AMOUNT NUMBER(10,2) NOT NULL,              
    SALE_PRICE NUMBER(10,2) NOT NULL, 
    SALE_TOT_PRICE NUMBER(15,2) NOT NULL,
    CONSTRAINT PK_SALE_SALE_DATE PRIMARY KEY (SALE_DATE),
    CONSTRAINT FK_SALE_WINE_CODE 
        FOREIGN KEY (WINE_CODE) 
        REFERENCES WINE(WINE_CODE),
    CONSTRAINT FK_SALE_MEM_ID 
        FOREIGN KEY (MEM_ID) 
        REFERENCES MEMBER(MEMBER_ID)
);

CREATE TABLE MEMBER (
    MEMBER_ID VARCHAR2(6) NOT NULL,
    MEM_GRADE VARCHAR2(20) NOT NULL,
    MEM_PW VARCHAR2(20) NOT NULL,
    MEM_BIRTH DATE DEFAULT SYSDATE NOT NULL,
    MEM_TEL VARCHAR2(20),
    MEM_PT NUMBER(10,2) NOT NULL,
    PRIMARY KEY (MEMBER_ID, MEM_GRADE)
);

CREATE TABLE GRADE_PT_GRADE (
    MEM_GRADE VARCHAR2(20) NOT NULL PRIMARY KEY,
    GRADE_PT NUMBER(3,2)
);

CREATE TABLE TODAY (
    TODAY_CODE VARCHAR2(6) NOT NULL PRIMARY KEY,
    TODAY_SENS_VALUE NUMBER(3),
    TODAY_INTELL_VALUE NUMBER(3),
    TODAY_PHY_VALUE NUMBER(3)
);

CREATE TABLE NATION (
    NATION_CODE VARCHAR2(26) NOT NULL PRIMARY KEY,
    NATION_NAME VARCHAR2(50)
);

CREATE TABLE WINE (
    WINE_CODE VARCHAR2(20) NOT NULL, 
    WINE_NAME VARCHAR2(100) NOT NULL,
    WINE_URL BLOB,
    NATION_CODE VARCHAR2(6),
    WINE_TYPE_CODE VARCHAR2(6),
    WINE_SUGAR_CODE NUMBER(2),
    WINE_PRICE NUMBER(15,2) NOT NULL,
    WINE_VINTAGE DATE DEFAULT SYSDATE,
    THEME_CODE VARCHAR2(6),
    TODAY_CODE VARCHAR2(6),
    CONSTRAINT PK_WINE PRIMARY KEY (WINE_CODE),
    CONSTRAINT FK_WINE 
        FOREIGN KEY (NATION_CODE, WINE_TYPE_CODE, THEME_CODE, TODAY_CODE)
        REFERENCES OTHER_TABLE(NATION_CODE, WINE_TYPE_CODE, THEME_CODE, TODAY_CODE) -- Replace with the correct table name
    -- Add other columns as needed
);

CREATE TABLE THEME (
    THEME_CODE VARCHAR2(6) NOT NULL PRIMARY KEY,
    THEME_NAME VARCHAR2(50) NOT NULL
);

CREATE TABLE STOCK_MANAGEMENT (
    STOCK_CODE VARCHAR2(6) NOT NULL PRIMARY KEY,
    WINE_CODE VARCHAR2(6) NOT NULL,
    MANAGER_ID VARCHAR2(30) NOT NULL,
    WARE_DATE DATE DEFAULT SYSDATE NOT NULL,
    STOCK_AMOUNT NUMBER(5) NOT NULL,
    CONSTRAINT FK_MANAGEMENT_WINECODE 
        FOREIGN KEY (WINE_CODE) 
        REFERENCES WINE(WINE_CODE),
    CONSTRAINT FK_MANAGEMENT_MANAGER_ID 
        FOREIGN KEY (MANAGER_ID) 
        REFERENCES MANAGER(MANAGER_ID)
);

CREATE TABLE MANAGER (
    MANAGER_ID VARCHAR2(30) NOT NULL PRIMARY KEY,
    MANAGER_PWD VARCHAR2(20) NOT NULL,
    MANAGER_FEL  VARCHAR2(20) -- Complete the definition if needed
);

CREATE TABLE WINE_TYPE (
    WINE_TYPE_CODE VARCHAR2(6) NOT NULL PRIMARY KEY,
    WINE_TYPE_NAME VARCHAR2(50)
);



