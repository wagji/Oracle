-- �Ѷ��� �ּ� 
/*
   �������� �ּ� 
*/

-- 1. ����� DataBase ���� 
create database myDB; 

-- 2. �ش� ����� DataBase �� ���� 
use myDB;

-- 3. ������ DB���� ���̺� ���� 
create table member (
	idx int not null, 
    name varchar(50) not null, 
    addr varchar(50) not null 
    );

-- 4. ���̺��� ������ ��� : select
select * from member; 

-- 5. ������ ���̺� ���ֱ� (���ڵ� ) : �ڵ� Ŀ�� <== commit; ������� �ʾƵ��� 
insert into member ( idx, name , addr)
values ( 1 , 'ȫ�浿', '����'); 

insert into member ( idx, name , addr)
values ( 2 , '��浿', '�λ�');

DROP TABLE MEMEBER10;
DROP TABLE MEMEBER11;
DROP TABLE PRODUCT10;
DROP TABLE ORDER11;
DROP TABLE RPODUCT11;
DROP TABLE ZIPCODE10;
DROP TABLE ZIPCODE11;