
-- VIEW (��) :������ ���̺� ,���� ������ �ʰ� �ڵ常 ������
-- 1. �������̺��� Ư���÷��� ����ҋ�  <== ����
-- 2. Ư���������� �ѹ����� ���� 

-- VIEW �� �ǽ��ϱ� ���� ���̺� :EMP02 



-- ������ �������̺�  : EMPLOYEE , DEPARTMENT ==> EMP01,DEPT01 
  -- �ʵ��, ���� �����
  -- �÷��� �ο��� ���� ������ ������� ���� ,  <== ALTER TABLE �� ����ؼ� �������� �߰�
  
  SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME IN('EMPLOYEE','DEPARTMENT');
    SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME IN('EMP02','DEPT02');

-- 1. DEPT02 ���̺��� DNO (PRIMARY KEY)
-- 2. EMP01 ���̺��� ENO (PRIMARY KEY) , DNO (FK) ==> DEPT02(DNO)

DROP TABLE EMP02;

-- WWWWWWWW
CREATE VIEW V_EMP02 ;
AS

SELECT * FROM MP02;

ALTER TABLE DEPT02 
ADD CONSTRAINTS PK_DEP02_DNO RIMARY KEY (DNO)

ALTER TABLE EMP02
ADD CONSTRAINTS PK_EMP02_ENO PRIMARY KEY (ENO);


ALTER TABLE EMP02
ADD CONSTRAINTS PK_EMP02_ENO PRIMARY KEY (ENO);

SELECT * FROM EMP02;

CREATE VIEW V_EMP02
AS
SELECT NAME,JOB,DNO
FROM EMP02;

-- CREOAM0000----\

CREATE VIEW V_EMP02
AS
SELECT ENAME, JOB, DNO
FROM EMP02;
--SYSTEM �������ü� HR �������� CREAT VIEW �ų����� �״�� �ο���
GRANT CREATE VIEW TO C#HR;     

CREATE VIEW V_EMP02
AS
SELECT ENAME,JOB,DNO
FROM EMP02 ;

SELECT*FROM V_EMP02;
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

select * from employee;               -- employee ���̺��� dno �÷��� �����Ѵ� (Foreign Key ) 
                                                        -- department ���̺��� dno �÷��� �����Ѵ�. 
select * from department; 


-- ���̺� ����  : ���� ���̺��� ���� ������ ���� �Ǿ� ���� �ʴ´�.  Alter Table �� ����ؼ� ���� ������ �ο� 


create table emp01 
as 
select * from employee; 

create table dept01
as 
select * from department; 


/* 
        ���̺��� ���� ������ Ȯ�� �ϴ� ��ɾ� 
        user_constraints   : ������ ����  <== ���̺��� ���� ������ �˷��ִ� ���̺� 
*/ 
select * from user_constraints ;

select * from user_constraints
where table_name in ('EMPLOYEE', 'DEPARTMENT') ; 

-- ���̺��� �����ϸ� ���̺��� �÷��� �ο��� ���� ������ ���� �Ǿ� ���� �ʴ´�.  �÷��� ���� ����Ǿ�´�. 
-- alter table �� ����ؼ� ���� ������ �ο��ؾ� ��.
-- alter table : ������ ���̺��� ���� 
select * from user_constraints
where table_name in ('EMP01', 'DEPT01') ; 

-- dept01 ���̺� dno�÷���  Primary Key ���� ������ �߰� 
alter table dept01 
add constraint PK_DEPT01_DNO primary key (dno); 

-- emp01 ���̺� eno �÷��� Primary Key ���� ���� �߰� 
alter table emp01 
add constraint PK_EMP01_ENO primary key (eno); 

-- emp01 ���̺��� dno �÷��� Foreign Key �ο� , ����(references)�� ���̺��� �÷��� Dept01 ���̺��� dno �÷��� ���� 
alter table emp01 
add constraint FK_EMP01_DNO foreign key (dno) references dept01(dno); 

--  Primary Key �÷��� Ȯ�� : 
desc emp01 ; 

select * from emp01 ; 

-- ���� ������ �÷��� �ο��� ���� ������ �� Ȯ�� �ϰ� ���� insert
-- eno : Primary Key �� ���, �ߺ��� ���� ������ �ȵ� 
-- dno : Foreign Key ��� ,  Dept01 ���̺��� dno �÷��� �����ϴ� ���� �־�� �Ѵ�. 

insert into emp01 ( eno, ename, job, manager, hiredate, salary, commission, dno )
values ( 7977, 'PJW', 'CLERK', 7782 , '23/12/11', 1500 , null , 40 ); 

commit ;     -- DML ( insert, update, delete ) ���� DB�� ������ ����ǵ��� ��.   <����Ŭ> 

select * from emp01; 
select * from dept01; 

-- dept ���̺� �� �ֱ�  : dno �÷� : Primary key �� ����. 
desc dept01 ; 

insert into dept01 ( dno, dname, loc)
values ( 50 , 'HR', 'SEOUL') ; 

commit ;     -- DML ( insert, update, delete) ���� �ݵ�� ����. 

select * from dept01; 

select * from emp01 ; 

-- JOIN : ���� ���̺��� �÷��� ��� �Ҷ� JOIN�� ����ؼ� �ϳ��� ���̺� ó�� �����. 
      -- �� ���̺��� ���� Ű �÷��� Ȯ��, 
      -- emp01, dept01 ���̺��� ���� Ű �÷��� dno   �̴�. 
      -- EQUI JOIN : ����Ŭ������ �۵��ϴ� JOIN ���� 
      -- ANSI JOIN :  ��� DBMS���� �������� ���Ǵ� JOIN ���� 
      
-- EQUI JOIN �������� �� ���̺� ���� 
 -- from ������ JOIN �� ���̺��� ��� (,)
 -- ���̺� �̸��� ��Ī�̸����� ��. 
 -- where ������ �� ���̺��� ���� Ű �÷��� ��� 
 -- and ������ ������ ó�� 
 -- ���� Ű �÷��� ��½� �ݵ�� ���̺��.�ķ��� 
 
select e.eno, e.ename, e.job,d.dno , d.dname, d.loc 
from emp01 e , dept01 d 
where e.dno = d.dno

select eno, ename, job, d.dno , dname, loc 
from emp01 e , dept01 d 
where e.dno = d.dno
and d.dno = 10 ; 

-- ANSI JOIN : ��� DBMS���� �������� ���Ǵ� JOIN ���� 
    -- INNER JOIN  : �� ���̺��� Ű�÷��� ���� �Ǵ� �κи� ���     <=== 80 % 
    -- OUTER JOIN : 
                 -- LEFT OUTER JOIN 
                 -- RIRGHT OUTER JOIN 
                 -- FULL OUTER JOIN 
    -- SELF JOIN 
    -- CLOSS JOIN 

-- INNER JOIN :  ANSI JOIN 
      -- from ���� JOIN ���̺� �̸��� ��� , 
      -- INNER Ű�� ���� �� �� �ִ�.   <===  80 % �̻� 
      -- on ���� �� ���̺��� ���� Ű �÷��� ��� ,  �� ���̺��� ������ �͸� ���  
      -- where ������ ���� ó��

-- ���̺� �̸��� alias (��Ī)  ��Ű�� �ʴ� ��� 
select eno, ename, salary,dept01.dno, dname, loc 
from emp01  INNER JOIN dept01 
on emp01.dno = dept01.dno 

-- ���̺� �̸��� alias (��Ī)  ����� ��� 
select eno, ename, salary, d.dno, dname, loc 
from emp01 e  JOIN dept01 d 
on e.dno = d.dno 
where  e.dno = 20 
order by ename desc ; 

-- INNER JOIN : ANSI SQL : ��� DBMS���� �������� ���Ǵ� SQL ���� ( Oracle, MySQL, MSSQL, DB2, .....)  
           -- ON ���� �� ���̺��� ����и� ��� 
select * 
from emp01 e JOIN dept01 d
on e.dno = d.dno 

-- OUTER JOIN : 
    -- LEFT OUTER JOIN     : ���� ���̺��� ��� ������ �����. 
    -- RIGHT OUTER JOIN   : ������ ���̺��� ��� ������ �����. 
    -- FULL OUTER JOIN     : ����, ������ ���̺��� ��� ������ �����. 

select * from dept01; 

insert into dept01 (dno , dname, loc) 
values ( 60 , 'MANAGE', 'PUSAN'); 

commit ; 


-- ���� ��� ��. 
-- RIGHT OUTER JOIN : �� ���̺��� ���� �κа� ������ (dept01) ���̺��� ��� ���� ��� 
select * 
from emp01 e  RIGHT OUTER JOIN dept01 d 
on e.dno = d.dno 

-- FULL OUTER JOIN : �� ���̺�(����, ������)�� ��� ������ ��� 
select * 
from emp01 e FULL OUTER JOIN dept01 d
on e.dno = d.dno ; 

-- SELF JOIN : �ڽ��� ���̺��� JOIN, �ڽ��� ���̺��� ��Ī�̸����� �������� �����ؼ� JOIN 
    -- ������ ���, ���� ��縦 �ٷ� ��� �Ҷ� ���� 
    
select e.eno �����ȣ, e.ename ����̸�, e.manager ���ӻ����ȣ, m.eno ���ӻ�����, m.ename ���ӻ����  
from  emp01 e  JOIN emp01 m 
on e.manager = m.eno ; 


-- SELF JOIN���� ����̸������� ���� ����� �������� ��� 
-- ���ӻ���� ���� ����� ��� : LEFT OUTER JOIN 
select e.eno �����ȣ, e.ename ����̸�, e.manager ���ӻ����ȣ, m.eno ���ӻ�����, m.ename ���ӻ����  
from  emp01 e  LEFT OUTER JOIN emp01 m 
on e.manager = m.eno ;

-- �����ȣ�� ������ � ����� ����� �ƴ� ����� ��� ��� �ض� : RIGHT OUTER JOIN 
select e.eno �����ȣ, e.ename ����̸�, e.manager ���ӻ����ȣ, m.eno ���ӻ�����, m.ename ���ӻ����  
from  emp01 e  RIGHT OUTER JOIN emp01 m 
on e.manager = m.eno ;


-- ���� ����� ���°� (����), �����ȣ�� �������� ������ ���� ����� �ƴ� ���(������) : FULL OUTER JOIN 
select e.eno �����ȣ, e.ename ����̸�, e.manager ���ӻ����ȣ, m.eno ���ӻ�����, m.ename ���ӻ����  
from  emp01 e FULL OUTER JOIN emp01 m 
on e.manager = m.eno ;




select eno , ename , manager,  eno, ename
from employee; 

--1. ����̸� 'SCOTT' �� �μ���(dname), �μ���ġ(loc)    <=== ename : 'SCOTT'�� emp01,   dept01 : dname, loc
-- ANSI JOIN    
select * from emp01 ; 
select * from dept01; 

-- emp01 , dept01 �� JOIN �ؼ� ��� 
select ename, dname,loc ,e.dno
from emp01 e JOIN dept01 d
on e.dno = d.dno 
where ename = 'SCOTT'; 


--2. ������ 2000���� �̻��� ����� �̸�, ����, �μ���, �μ���ġ, �� ��� : ANSI JOIN 

select ename, salary, dname, loc , e.dno
from emp01 e JOIN dept01 d
on e.dno = d.dno 
where salary >= 2000 
order by d.dno desc; 

-- ANSI JOIN 
--3 .   ��å(job) �� 'MANAGER' �� ����̸�(ename), �μ���ȣ(dno), �μ���(dname), �μ���ġ(loc) ����ϵ� ����̸� �������� ����   
select job ��å, ename ����̸�, e.dno �μ���ȣ, dname �μ���, loc �μ���ġ
from emp01 e JOIN dept01 d 
on e.dno = d.dno
where job = 'MANAGER'; 

-- SELF JOIN���� ����̸������� ���� ����� �������� ��� 
-- ���ӻ���� ���� ����� ��� : LEFT OUTER JOIN 
select e.eno �����ȣ, e.ename ����̸�, e.manager ���ӻ����ȣ, m.eno ���ӻ�����, m.ename ���ӻ����  
from  emp01 e  LEFT OUTER JOIN emp01 m 
on e.manager = m.eno ;

-- �����ȣ�� ������ � ����� ����� �ƴ� ����� ��� ��� �ض� : RIGHT OUTER JOIN 
select e.eno �����ȣ, e.ename ����̸�, e.manager ���ӻ����ȣ, m.eno ���ӻ�����, m.ename ���ӻ����  
from  emp01 e  RIGHT OUTER JOIN emp01 m 
on e.manager = m.eno ;


-- ���� ����� ���°� (����), �����ȣ�� �������� ������ ���� ����� �ƴ� ���(������) : FULL OUTER JOIN 
select e.eno �����ȣ, e.ename ����̸�, e.manager ���ӻ����ȣ, m.eno ���ӻ�����, m.ename ���ӻ����  
from  emp01 e FULL OUTER JOIN emp01 m 
on e.manager = m.eno ;




select eno , ename , manager,  eno, ename
from employee; 

--1. ����̸� 'SCOTT' �� �μ���(dname), �μ���ġ(loc)    <=== ename : 'SCOTT'�� emp01,   dept01 : dname, loc
-- ANSI JOIN    
select * from emp01 ; 
select * from dept01; 

-- emp01 , dept01 �� JOIN �ؼ� ��� 
select ename, dname,loc ,e.dno
from emp01 e JOIN dept01 d
on e.dno = d.dno 
where ename = 'SCOTT'; 


--2. ������ 2000���� �̻��� ����� �̸�, ����, �μ���, �μ���ġ, �� ��� : ANSI JOIN 

select ename, salary, dname, loc , e.dno
from emp01 e JOIN dept01 d
on e.dno = d.dno 
where salary >= 2000 
order by d.dno desc; 

-- ANSI JOIN 
--3 .   ��å(job) �� 'MANAGER' �� ����̸�(ename), �μ���ȣ(dno), �μ���(dname), �μ���ġ(loc) ����ϵ� ����̸� �������� ����   
select job ��å, ename ����̸�, e.dno �μ���ȣ, dname �μ���, loc �μ���ġ
from emp01 e JOIN dept01 d 
on e.dno = d.dno
where job = 'MANAGER'; 


-- VIEW ( �� ) :  ������ ���̺� ,  ���� ������ �ʰ�, �ڵ� �� ������. 
    -- 1. ���� ���̺��� Ư�� �÷��� ��� �Ҷ� <== ���� 
    -- 2. ������ ������ �ѹ� ���� ����  <== ������ JOIN ������ �ܼ�ȭ �� �� �ִ�. 

-- view �� �ǽ��ϱ����� �������̺� : emp02 
drop table EMP02 cascade constraints ; 

create table EMP02 
as 
select eno, ename , salary , commission, job, hiredate , dno 
from employee 
where salary > 1500; 


select * from emp02; 

create table dept02 
as 
select * from department; 

-- ������ �������̺� : employee, department ===> emp01, dept01 
    -- �ʵ��, �� �� ����� 
    -- �÷��� �ο��� ���� ������ ������� ����. <== Alter Table �� ����ؼ� ���� ���� �߰� 
    
    select * from user_constraints where table_name in ('EMPLOYEE', 'DEPARTMENT'); 
    select * from user_constraints where table_name in ('EMP02', 'DEPT02'); 

--1.  DEPT02 ���̺��� dno (Primary Key) 
--2. EMP02 ���̺��� eno (Primary Key), dno (FK) ==> dept02(dno) 

alter table DEPT02 
add constraints PK_DEPT02_DNO primary key (dno) ; 

alter table EMP02
add constraints PK_EMP02_ENO primary key (eno); 

alter table EMP02 
add constraints FK_EMP02_DNO foreign key (dno) references dept02(dno); 


-- VIEW ����  1. ���� ���̺��� �߿� ������ ���߰� ��� , ������ ����� �� �ִ�. 
        -- as ������ select �ڵ带 ������ ����. 

select * from emp02 ;   -- ���� ���̺� : emp02 


-- �� ���� : ���� ���̺��� ���� ������ ���� �ƴ϶� ���� �ڵ常 ������. 
create view v_emp02
as 
select ename, job, dno 
from emp02 ; 

-- �� ���� : 
select �ķ��� from ���̺��[���]

select * from v_emp02; 

-- ������ ���� : user_���̺�     <== �ý����� ������ ����Ǿ��ִ� ���̺� 

select * from user_views; 

-- 2. ����� ���Ǽ� , ������ ������ view�� �����ؼ� ������� �ΰ� ����, <== JOIN 

-- �� ���̺��� �����ؼ� ������ 2500 �̻��� ��� ������ ��� 
create view v_join 
as 
select ename, job, salary, dname, loc 
from emp02 e 
    join dept02 d 
        on e.dno = d.dno
where salary >= 2500 ; 


select * from v_join ; 

-- employee, department ���̺��� �μ����� �ּ� ������ �޴� ����̸�, ����� ��å, �μ���, �μ���ġ �� ��µ� �ּҿ����� 900�̻� 
    -- ��� ������ ��� , �μ���ȣ 20���� �����ϰ� 
    -- ��ȿ� ������ �����ϰ� �並 �����ؼ� ���          <== JOIN, group by, where, having , subquery 
   
-- �μ����� �ּ� ������ �޴� ��� ������ ����ϴ� view , 20 �μ��� ���ܵ�     
create view v_join2 
as 
select ename ����̸�, job ��å, dname �μ���, loc �μ���ġ, d.dno �μ���ȣ
from employee e 
    join department d 
        on e.dno  = d.dno 
where salary in (
    -- �μ����� �ּ� ���� 
    select min(salary) from employee 
    where dno <> 20 
    group by dno 
    having min(salary) > 900 
) 

-- �� ���� 
select * from v_join2;

-- view �� ���� �÷� ���� ����� 
create view v_join3 
as 
select ename ����̸�, job ��å, dname �μ���, loc �μ���ġ, d.dno �μ���ȣ
from employee e 
    join department d 
        on e.dno  = d.dno 
where salary in (
    -- �μ����� �ּ� ���� 
    select min(salary) from employee 
    where dno <> 20 
    group by dno 
    having min(salary) > 900 
) 
order by ename desc


select * from v_join3

-- view �� as ����� select ���� �� 
    -- ���� ���� ������ ���� ����. select �ڵ常 ��� ����. 
    -- ���� ���̺��� �÷��� �� ��Ī �ɰ�� 
    -- insert, update, delete�� view ���ؼ� �� �� �ִ�. �� ���� ���̺� �� �÷��� ���� ���ǿ� ������ ���� 

select * from emp02 ; 

-- view ����
drop view v_test01 ; 

create view v_test01 
as 
select eno, ename , dno 
from emp02;  

-- view ���� 
select * from v_test01; 

--view �� ���� ���� �� �ִ� ==> ���� ���̺� ���� ��. 
insert into v_test01 (eno, ename, dno) 
values ( 8080, 'HONG', 30); 

commit; 

-- view �� ����ؼ� ���� ���� : update   <== where ������ �ݵ�� ����ؾ��ϰ� �÷����� Primary Key �� �� �÷� 
update v_test01 
set ename = 'KIM'
where eno = 8080 ; 

commit ; 

-- view �� ����ؼ� ���� ���� : delete   <== where ������ �ݵ�� ����ؾ��ϰ� �÷����� Primary Key �� �� �÷� 

delete v_test01 
where eno = 8080 ; 

commit ; 


select * from emp02 

-- v_test02 : insert (�ȵ�) , update (����), delete( ����) ==> ���� ���̺��� ���� ���ǿ� �� �¾ƾ� �Ѵ�. 
create view v_test02 
as 
select eno, ename, salary
from emp02 ; 

insert into v_test02 (eno, ename , salary) 
values ( 9090 , 'SIM', 3500); 

-- ���̺��� Ư�� �÷��� not null  ���� ���� �߰� 
alter table emp02 
modify dno NOT NULL ; 

delete v_test02
where eno = 9090; 
commit; 
