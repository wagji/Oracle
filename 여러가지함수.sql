/*
Oracle �� �پ��� �Լ�����ϱ�      :��ǲ=> ���=> ���     (){}
1.���ڸ� ó���ϴ� �Լ�
2.���ڸ� ó���ϴ� �Լ�
3.��¥�� ó���ϴ� �Լ�
4.��ȯ �Լ�
5.�Ϲ� �Լ�
 */
 
 /*
 1. ���ڸ� ó���ϴ� �Լ� :  
 
-- UPPER   : �ҹ��ڸ� �빮�ڷ� ��ȯ���ִ� �Լ� 
-- LOWER   : �ҹ��ڷ� ó���� �ִ� �Լ�
-- INITCAP : ù�ڸ� �빮�ڷ� ó�����ִ� �Լ�
-- LENGTH  : ���ڼ��� ��ȯ (���� :1byte , �ѱ� :2byte,3byte ;)
-- LENGTHB : ���ڼ� ��ȯ (����  :1byte, �ѱ� : 3 byte
-- CONCAT  : ���ڿ��� ���� ���ִ� �Լ� 
-- SUBSTR  : ���ڸ� �߶�����Լ�
-- INSTR   : Ư�� ������ ��ġ���� ���
-- LPAD    : ���� �ڸ����� �Է� �޾Ƽ��������� Ư�� ��ȣ�� ä�� (����)
-- RPAD    : ���� �ڸ����� �Է� �޾Ƽ� �������� Ư�� ��ȣ�� ä�� (������)
-- RTRIM   : �������� ���� ����
-- LTRIM   : ������ ���� ���� 

  dual  : ������ ���̺�
 */
 
 select *
from employee;
 
  select UPPER ('Oracle') from dual ;
  select *from employee;
  select ename �����̸�,UPPER(ename) �빮���̸�,LOWER(ename) �ҹ����̸�,INITCAP(ename)ù�ڸ��빮�� from employee;
 
 -- �˻��� �ȵ�  :�÷��� ���� ��ҹ��ڸ� �����Ѵ�
 
  select *
  from employee
  where ename = 'smith';
 
  select *
  from employee
  where ename = UPPER('smith');
 
  select LENGTH ('Orecle mania') from dual ; -- 12
  select LENGTH ('����Ŭ �ŴϾ�') from dual ;    -- 7
 
  select LENGTHB ('Orecle mania') from dual ; -- 12
  select LENGTHB ('����Ŭ �ŴϾ�') from dual ;  -- 19  ,�ѱ� 1�� : 3byte ( UTF--8)
 
  select ename ����, LENGTH (ename) ���ڼ� from employee;
  select ename ����, LENGTHB (ename) ���ڼ� from employee;
  
-- CONCAT : ���ڿ��� ���ڿ��� ���� ���ִ� �Լ�
-- || �÷��� �������ִ� ������

 select 'Oracle' , 'Mania' from dual ;
 select concat ('Oracle' ,'Mania' )as ����� from dual ;
 select concat (ename ,job )from employee;
 
 select ename || job from employee;
 select ename ||'    '|| job as �̸�����å from employee;
 
 -- SUBSTR  : ���ڸ� �߶���� �Լ� , ;SUBSTR (�÷�,4.3)  <==�÷��� ���ִ� ���ڿ��߿� 4��° �ڸ����� 3�ڸ��� �߶�ͼ� ���
  
 select substr ('Oracle Mania',4,3) from dual; -- index :1������ ����
 
 select ename �����̸�,substr(ename, 2, 3)�߶���̸� from dual;
 SELECT ename AS �����̸�, SUBSTR(ename, 2, 3) AS �߶���̸� FROM dual;
 
 select*from employee;
 
-- employee ���̺��� �̸�,�Ի糯�ڸ� ��� �ϼ���  
select ename as �̸�, substr(hiredate, 4,2)�Ի�� from employee;
-- employee ���̺��� �̸�,�Ի���� ����ϼ��� substr �Լ��� ��� --�̿��޿� �Ի��� ������ 

select ename as �̸�,substr(hiredate, 4,2)�Ի��
from employee
where substr (hiredate, 4,2) = '02' ;

--81�⵵�� �Ի��� ����� �̸�,�Ի��,�Ի�� ,�Ի����� ����ϼ���, <== substr,where

select ename as �̸�,substr(hiredate, 1,2)�Ի��,substr(hiredate, 4,2)�Ի��,substr(hiredate, 7,2)�Ի���
from employee
where substr (hiredate, 1,2) = '81' ;

 -- INSTR :Ư�������� index ��ȣ�� ��� , index ��ȣ�� 1����
 -- instr(�÷���,'A'  ) ; �÷����� ���ڿ����� 'a'���ִ� index ��ȣ�� ���
 -- instr ( �÷��� 'A' ,4)  ;index 4�����Ϳ������� A�����ִ� inde��ȣ�� ���
 
 select (instr ('Oracle Mania','a'))from dual; -- 3 <== a �� ��ġ�� index
 select (instr ('Oracle Mania','a',4))from dual; -- 9 <== index 4�����ĺ��� �˻� a�� ��ġ��index �˻�
 
 select ename �̸�,instr(ename,'M')as M����ġ
 from employee;
 
 -- LPAD :LPAD(�÷���,�ø��ڸ���,'*' ) �����ڸ��� *������ (����
 -- RPAD : RPAD (�÷���,�ø��ڸ���'*' ) �����ڸ��� *������ ������
 
SELECT '770824-123456' AS �ֹι�ȣ, LPAD('770824-1', 20, '*') AS LPAD FROM dual;
SELECT '770824-123456' AS �ֹι�ȣ, RPAD('770824-1', 20, '*') AS RPAD FROM dual;
 select*from employee;
 
 -- hiredate Į�� �� �⵵�� ����ϰ� �������� *����� < == suna
 
 select ename �̸�,RPAD(substr(hiredate, 1,2),8,'*')�Ի�� 

 -- ���� ó�� : RTRIM : �������� ������ ���� , LTRIM : ������ ������ ���� 

 select'        Oracle Mania     ' from dual ;
  LTRIM ( ''
 RTRIM ( ''
 TRIM  ( ''
 
 -- ���� ���������� ���� �빮�ڷ� ��ȯ
 select *
 from employee
 where ename =UPPER (TRIM ( ' SMITH' ) ;
 
 -- 2. ���ڸ� ó���ϴ� �Լ� : ROUND : �������ϴ��Լ� TRIdIC : Ư���ڸ� ������ �߶󳻼����� 
 
 -- ROUND :Ư�� �ڸ������� �ݿø� ,5�̻����ݿø� 5���ϴ� �߶� 
 /*
 ROUND (�Ǽ� ) : �Ҽ��� �ڸ����� �ݿø�
 ROUND (�Ǽ�,�Ҽ����ڸ�
 -- �Ҽ��� �ڸ� (���) �Ҽ��� �������� ���������� �̵��ؼ� �׹��ڸ��ݿø�
 */

  select 98,7845 as ����,
 round (98,7562) ,  -- �Ҽ��� ������ �ݿø�
  round (98.7565,2)as R2, --�Ҽ���  ���������� 2�ڸ� �̵��� �ݿø� 
  round (98.7565,-10)as R3 --
  from dual;
 
 -- �ٷμҵ漼 : ������ 3.3 % salary 0.33 �ҵ漼

select salary ����, salary*0.033 �ҵ漼 ,Round(salary*0.033)R1, Round (salary*0.033,2)R2,
 salary - (salary*0.033)
from employee ;

 -- TRUNC : Ư�� �ڸ����� �߶� ����  <== Ư�� ��¥���� ���� ,���� ��¥���� 100�������� ��¥�� ������ ? 
 
 select trunc (98.7653)T1,
       trunc (98.7435,2)T2,
       trunc(98.7631-1)T3,
       trunc(98.5362-2)T4
       from dual;
       
-- MOD  : ������ ���� ��� ; MOD  (����1, ����2)�տ� ���ڸ� �ڿ����ڷ� ����� �������� �����
-- TRUNC :�� ����Ҷ���

select MOD(3,2) ,
      TRUNC (32/2)
from dual; 

 
 