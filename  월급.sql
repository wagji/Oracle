/*select 
 select * from employee ;
*/
-- employee ���̺��� ��� �÷���
 
select 
from employee
whrere ;
-- Ư�� �÷��� ��� 

 select eno, ename ,job
 from employee ;
 
 -- Ư�� �÷��� ������ ��� �ϱ� . �÷��� ������ �Ҽ��ִ� .�÷��̸��� �ٲ�� �ִ� . 
 
 select eno, ename , salary ,ename ,ename ,salary ,salary * 12
 from employee ;
 
 -- �÷� �ϵ��� ��Ī���� �ٲٰ� ����ϱ�
 
 select eno as �����ȣ , ename �����, salary as ���� ,salary *12 as ���� 
 from employee ; 
 
 -- employee ���̺��� ���÷��� �ǹ�  . 
 
 select * 
 from employee ; 
 
 select eno �����ȣ,ename �����,job ��å,manager ���ӻ��,
 hiredate �Ի糯¥,salary ����,commission ���ʽ�,dno �μ���ȣ 
 from employee ;
 
 -- ���̺� ������ Ȯ���ϱ� , desc ���̺�� ,���� �÷��� ,null ��뿩�� ,�ڷ��� (number  : ���� ,�Ǽ�  char ,varohar2 : ���ڸ� ) 
 
 desc employee ; --insert �� �÷��� �ڷ���, Null ��뿩�θ� Ȯ���� ���� ���� , 
 
 select*from employee ; 
 
 -- ������ ��� :����  :  NULL ���� ������ ����� NULL
   --null �÷��� ������ �ϸ� ��� null
   
   -- null ó���� �ȵ� 
   
 select eno �����ȣ,ename ����� ,salary ����,commission ���ʽ�,  -- �������̺� ���
       salary * 12 + commission ����
 from employee;
 
 -- nvl (�÷���,0 ) ; null �� ó���ϴ� �Լ� , �÷��� ���� null �� 0���� ��ȯ�ϴ� �Լ�  
 
  select eno �����ȣ,ename ����� ,salary ����,commission ���ʽ�,  -- �������̺� ���
      nvl(commission,0) ��ó���� ,salary * 12 +nvl(commission,0) ����
 from employee;
 
 -- �÷��� �÷��� �����Ҽ� �ִ�  : + , - ,* ,/ < == number ( ���� ,�Ǽ� )  Ÿ�� 
 -- number : ������ ���°�
 -- numbe(7,2)  : �Ǽ� ���ִ°�, ��ü 7�ڸ� ,�Ҽ��� ���� 2�ڸ�  
 
 select * from employee; 
 desc employee; 
 
 select ename , salary ,salary+salary as "+����"  , salary*salary as "*����"  , salary*0.1 as "������10%"
 from employee ;
 
 -- �ߺ� ó���� ��� : distinct �÷��� 
 
 select * from employee ;
 
 -- �츮 ȸ���� �μ��� ���
 
 select distinct dno 
 from employee ;
 
 -- �츮ȸ���� ��å�� �ߺ� ������ ��� (CLERK : �繫�� , SALESMAN : ������� , MANAGER : ������ , ANNALYSET ; �м��� 
  -- PRESIDENT : �����  ) 
  -- ��ҹ��ڸ� ���� ��������  : ���� (select , create, from , group by, oder by ) �÷��� , ���̺�� , 
  -- ���̺� �ȿ� ���ڵ� �� ���� ��ҹ��ڸ� ������ .
  
  
select distinct job
FROM employee;
 
 select * from employee;
 -- job (��å )�� MANAGER  (������ ) �� ����� ������ ��� 

select ename AS "�����", job AS "��å"
from employee
where job = 'MANAGER';
 
 -- �μ� ���̺�Ȯ��
 select * from department ;
 select dno �μ���ȣ, dname �μ���, loc �μ���ġ
 from department ;
 
 -- salgreade : ������ ������ �����ϴ� ���̺� <== JOIN 
 select * from salgrade ;
 select grade �����ǵ�� , losal ���ϳ�������, hisal ��������
 from salgrade ;
 

 -- SELECT ���� ��ü����
 /*
 SELECT �÷��� 
 FROM ���̺�� [ ��� ]
 WHERE ����
 GROOP BY �÷��� < == �÷��� ������ ���� �׷��ο��� ó����
 HAVIG ����   <== GROUP BY ����� ���� ����
 ODER BY �÷��� ASC[DESC] <== �÷��� �����ؼ� ��� ,ASC :������������ ,DESC :�������� ���� 
 */
 
 -- where ���� ����ϱ� :�񱳿����� (NUMBER Ÿ���� �÷����� ��� ) ; = ���� ,  >, < ,>= ,  <=
 -- �����ʴ� : <>  , != , ^= 
 -- or 
 -- and
 -- between
 -- like 
 -- in (  ) 
 
 select * from employee;
 
 select *
 from employee
 where salary > 1500;
 
 select *
 from employee
 where salary = 1500;
 
 select *
 from employee
 where salary ^= 1500;
 
 -- or ������ 
 
  select *
 from employee
 where salary = 1500 or salary = 800 or salary = 1600 ;
 
 -- in Ű���� : in  ( �� ,��, ��  )
 
  select *
 from employee
 where salary in [1500,800,1600];
 
 -- and ������ ��� :�μ� ��ȣ�� 10���� ����� ������ 1500�̻��� ����ڸ� ���
 
   select *
 from employee
 where dno = 10 and salary > 1500; 
 
 -- ��å�� manager �̸鼭 ������ 2000�̻��� ����� �����ȣ ,����� ,������ ���
 
 select eno �����ȣ , ename ����� ,salary ���� , job ��å
 from employee
 where job = 'MANAGER' and salary>=2000 ;
 
 -- �� �����ڸ� date varchar ,char : 81�⵵ �Ի��� ����� ������
 
 select *
 from employee
 where hiredate > '81/01/01' and hiredate < '81/02/28' ; 
 
 -- ���ڿ�  : char , varchar , nvarchar ,nchar  : ���ڿ� ,  ''
  
 select *
 from employee
 where ename > 'D' ;
 
 -- like : ���ڿ����� Ư�� ���� �˻�  : %  :������ �͵� ������� . _ :�ѱ��ڰ� ����� �͵� ����� ���� .
 -- �÷��� Ư�� ���� �˻��� ���� .
 
 select * from employee
 where ename like '%LA%' ;
 
 select * from employee
 where ename like '_CO%' ;
 
 -- null �˻�  :is null ,is not null 
 
 select * from employee ; 
 
 -- comission �÷��� ���� null �� ����ڸ� ���   :���ʽ��� ���� ���
  select *from employee 
 where commission is null;
 
 -- comission �÷��� ���� null �� �ƴ� ����ڸ� ���   :���ʽ��� �ִ� ���
 select *from employee 
 where commission is not null;
 
 -- cout ()  : ���ڵ��� ������ ���  : ����¡ó��  <==
 -- null ūī��Ʈ�� �����ʴ´�
 
 select count (*) �ѷ��ڵ��
 from employee ;
 
 select count (ename)
 from employee;
 
 select count (commission) --���ڵ� �� :null �÷��� ��� ���� �ʴ´� .
 from employee ;
 
 select commission �������� -- null  : ����ִ� ���� . 0�� 
 from employee ;
 
 desc employee; 
 
 -- ���̺��� ��ü ���ڵ带 ��Ȯ�ϰ� ���:not null �÷��� count(�÷���) ,count(*)
  -- ���Ĺ� �����ؼ� ��� : order by ������ asc(desc)
  -- asc : ���� ���� ����  :A == >  2.   ��==>�� 
 -- desc : �������� ����  : 2 ==> A  
 
 -- ������ �������� ���� 
 
 select*
 from employee
 order by salary asc ;
 
 -- ������ �������� ���� 
 
  select*
 from employee
 order by salary desc ;
 
 -- �̸��� �÷��� �������� ���� 
 
 select *
 from employee
 order by ename ;
 
 --��å ( job )  �÷� �� ������������
 select *
 from employee
 order by job desc  ;
 
 select *
 from employee
 where salary > 1500;
 
 from employee
 where salary > 1500 
 order by salary desc;
 
 -- oder by ���� ���� �÷��� ���� �Ҷ� ���� �÷��� ��� �����ϰ� �������� �����Ҷ� ���� ���� ���ؼ� 
 -- �亯�� 
 
 select dno,ename
 from employee
 order by dno asc,ename desc ;
 
 --job �÷��� ������������ ���� , dno �÷��� job�� ������ ���� ���ؼ� dno�� �������� ,
 -- ename :dno���� ������ ���� ���ؼ� ename��������������
 
 select job,dno,ename
 from employee
 order by job asc,dno asc,ename asc;
 
 select dno, job, ename
 from employee
 order by dno desc,job asc,ename desc ;
 
 
 
 
 
 