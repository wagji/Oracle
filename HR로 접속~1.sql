/*
    -- SQL ; �����������, SELECT, CREAT,ALTAR,DROP,INSSERT,UPDATE,DELETE,GRANT,REVEK,ROLLBACK,COMMIT
    -- ����ȭ�� ���Ǿ��
    -- SQL ����
    -- DQL :(DATA QUERY LANGUAGE) :��� ,�˻�,SELECT,
    -- DDL :(DATE DEFINTION LANGUAGE) : ��Ű�� (Ʋ,���� ) ��ü (���̺�,��,�Լ�,������  ,Ʈ����,�������α׷�,�ε��� ���� ,������ü
     
       -- CREATE(���� ) ,ALTER (����) ,DROP  (���� )
    
    -- DNL : (DATA NANUPULARTION LANGUAE ) : ���̺��� ���ڵ带 �����ϴ¾�� 
      
       -- INSERT (�Է� ) , UPDATE (����) ,DELETE (����)
       -- Ʈ�������� �߻� (RAM) ,  COMMIT : RAM �� ����� ������ DB�� �����ض� ,ROLLBACK :������� �ǵ���
       -- Ʈ�������� INSERT, UPDATE, DELETE ������ �ڵ����� ���۵Ǹ� ,
       -- Ʈ�������� ���� :ROLLBACK : �޸𸮿� ����� ����Ⱥκ��� ������� �ǵ����� , COMMIT :DB�� ���������� ������.
       -- Ʈ�������� ������� ������ LOCK �� �ɷ��� Ʈ������ ����ɋ����� �ٸ������ �����̾ȵȴ� .
       -- ����Ŭ :DNL ���� �����ϸ� �ڵ����� Ʈ�������� ���۵� , ���۸��ǰ� ����� ���Ѿ��� ,INSERT , UPDATE, DELETE �� �����԰� ���ÿ� �ڵ����� �۵��Ѵ� , <== ���
       -- MYSQL .MSSQL : �ڵ����� ���� �������̽��۵� ,���� (ROLLBACK , COMMIT) �ڵ����� 
      
       -- ��������� Ʈ�������� �����Ҽ��ְ� ��������� ������ �ִ� .
   -- DCL : DATA CONTOROL LANUAGE :  ���� (ACOUNT 
   -- TCL : TRANSACTCI LCOUNT :Ʈ�������� �����ϴ� ��� <== DNL ������ ���� 
   -- Ʈ������ : �۾� (��) �� ó���ϴ� �ּҴ����� Ʈ�������̶�� �Ѵ�  :ALL OR NOTHING : �Ǹ� ���εǰ��ϰų� .�ȵǸ����ξȵǰ���
   -- Ʈ������ LOG �� ��ϵǾ��ִ� , < ==������ �������� ���� ,������� �����̾ƴ϶� ���������������������� 
   -- Ʈ�������� 4���� Ư¡ 
   -- ���ڼ� :(ATOMICITY) : ���� ó���ϴ� �ּҴ��� 
   -- �ϰ��� : (CONSTISTENCY) :Ʈ�����ǿ��� ó���� ����� ���ϰ����� ������ ALL ,NOTHING
   -- ������ : (ISOLATION) : �ϳ��� Ʈ�������� �ٸ� Ʈ�����ǰ� ����Ǿ��ִ�  , LOCK 
   -- ���Ӽ� : (DURAVILITY) :COMMIT , DB �� ���������� ����
   
*/

-- ���̺� ����

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

UPDATE ACCOUNT10 SET ACOUNT = ACOUNT - 1000000000 WHERE NO = 7369; -- SMITH ACCOUNT - 10��
UPDATE ACCOUNT10 SET ACOUNT = ACOUNT + 1000000000 WHERE NO = 1934; -- MILLER ACCOUNT + 10��

-- Commit the transaction

COMMIT;

-- If there is an issue, rollback the transaction
-- ROLLBACK;

CREATE TABLE EMP03
AS
SELECT ENO AS NO, ENAME, SALARY AS ACCOUNT
FROM EMPLOYEE;

-- SMITH ���� MILLER ���� 10���� �Ա� : 2���� UPDATE ������ �ϳ��� TRANSECTION ���� ����  :ALL OR NOTGING
-- SMITH ACCOUNT - 10�� : UPDATE ACCOUNT 10 SET ACCOUN = ACCOUNT -10 WHERE NO = 7369
-- MILLER ACOOUNT +10�� : UPDATE ACOUNT10 SET ACOUNT = ACCOUNT +10 WHERE NO = 1934 

BEGIN TRANSACTION; -- ��������� Ʈ�������� ����

UPDATE ACCOUNT10
SET ACCOUNT= ACCOUNT -10
WHERE NO = 7369;

UPDATE ACOUNT10
SET ACOUNT -10 WHERE NO = 7369;

UPDATE ACOUNT10 
SET ACOUNT +10 WHERE NO = 1934;

SELECT * FROM ACCOUNT10;

-- Ʈ������ ���� 

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

DML; INSERT (���� �Է� ) , UPDATE, ( ���� ) ,DELETE (����)
*/

-- ���̺���
CREATE TABLE DEPT04
AS
SELECT * FROM DEPARTMENT;

SELECT * FROM DEPT04;

-- dept03 : primary key �������� �߰�

alter Table dept04
add constraint PK_DEPT04_DNO PRIMARY KEY (DNO); 


-- INSERT : ���ο� ���� �߰��Ҷ� . ���ǻ��� :�� �÷��� �ڷ���  : NUMBER ,���� ,��¥ ,

desc dept04;

select * from user_constraints where table_name in ('DEPT04') ;

-- INSERT INTO  ���̺�� ( �÷��� ,�÷���,�÷��� ) VALUES (�� ,��, �� 0 ; 

INSERT INTO DEPT04 (DNO,DNAME,LOC)
VALUES (50,'HR','SEOUL') ;

ROLLBACK ;
COMMIT ;

SELECT * FROM DEPT04;

-- INSERT �� �÷��̸��� ��� �����ʴ� ��� ����÷��� ���� �־����
INSERT INTO DEPT04
VALUES (60, '�λ��' , '�λ�');

INSERT INTO DEPT04
VALUES (70,'�λ��' );

INSERT INTO DEPT04 (DNAME,DNO) 
VALUES ('������' , 80);


-- UPDATE �� :�Էµ� ���� ������ ��� ,�ݵ�� WHERE ���Ŵ� ����ؾ��Ѵ� ,WHERE ���ǿ� ��ꤷ�Ǵ� �÷��� PROMARY KEY �� Ŀ���Ͽ�����
/*
UPDATE ���̺��
SET �÷��� = �ٲܰ�, Ŀ���� = �ٲܰ�
WHERE ����
*/
-----
COMMIT ;
ROLLBACK ;
SELECT * FROM DEPT04;
---
UPDATE DEPT04
SET LOC = '�뱸'
WHERE DNO= 80;
--
UPDATE DEPT04
SET DNAME = '������'
WHERE DNO= 40;
--
UPDATE DEPT04
SET LOC = '����'
WHERE DNO= 40;
--
INSERT INTO DEPT04
VALUES ( 90,'������','û��' );

INSERT INTO DEPT04
VALUES ( 70,'�μ�','����' );

-- UPDATE ���� �ݵ�� WHERE ���� , ������ ó���ϴ� PRI MARY KEY UNIQUE Ű�÷�������

UPDATE DEPT04
SET DNAME = '�����' 
WHERE DNO = 80;

-- UP DATE �� GIRMARY KEY �÷��� �������� ó���ؼ� ���ϴ� ����������
UPDATE DEPT04
SET DANME = '�μ��'
WHERE DNO IN (91 ,80) ;

-- DELETE : ���ڵ带 �����ҋ� ,WHERE�� �ʼ� , 
-- DELETE ���̺�� WHERE����

SELECT * FROM DEPT04;

DELETE DEPT04 ;

--DELETE , WHERE ���ǻ�� :

DELETE DEPT04
WHERE DNO= 91 ;

-- ��緹�ڵ�� ,���̺��ִ� ��簪�� ���� : 
-- DELETE �� WHERE���Ǿ��� : ���ڵ� �ϳ��ϳ��� ������ :�������ϳ��ϳ��ؼ��ð��̿����ɸ� LOW LEVEL FORMAT
-- TRUNCAT TABLE ���̺�� :  PAST FORMAT �Ѳ����� ��緹�ڵ带 ����
-- DROP TABLE ���̺�� : ���̺� ��ü�� ���� 

SELECT * FROM DEPT03;
ROLLBACK;
DELETE DEPT03;
/*
DML :INESRT (�����Է� 
 <== Ʈ������ �ڵ�����
 <== 
*/
TRUNCATE TABLE EMP04;
  
  CREATE TABLE EMP05
  AS 
    SELECT * FROM EMPLOYEE;

  SELECT * FROM EMP05;

  CREATE TABLE EMP05;

/* EMP05
 ������ �����߰� :INSERT
  ������ ���� ���� : UPDATE 
  �����ǰ������� : DELETE 

  */
  SELECT * FROM EMP05;
  
    ROLLBACK;
    
  COMMIT;

UPDATE EMP05
SET DNAME = '������'
WHERE DNO= 40;

INSERT INTO EMP05 (DNAME,DNO) 
VALUES ('������' , 80);
  
DELETE EMP05
WHERE = NULL ;

INSERT INTO EMP05 (COMMISSION)
VALUES (300);
  


