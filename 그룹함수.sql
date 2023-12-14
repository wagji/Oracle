/*  �׷� �Լ� : group by, having 
 select �÷��� 
 from ���̺�[��]
 where ���� 
 group by �÷���[�����Ѱ����׷���]
 having ���� [group by �� ��� ���� ����] 
 order by �÷��� asc[desc] 
*/ 
/* ���� �Լ� : number Ÿ���� �÷��� ����   <=== NULL �� �ڵ����� ó����...
    SUM  - �÷��� ��� ���� ��
    AVG - �÷��� ��� ���� ��
    MAX - �÷��� �ִ밪
    MIN - �÷��� �ּҰ�
    COUNT (*) - �׷��� �� ���ڵ� �� ��� . 
    ���� :  ���� ������ ����� �Ǳ� ������ �ٸ� �÷��� ���� ����. 
             �� . group by ���� grouping �� �÷��� ��� ���� 
*/ 
desc employee; 

-- �÷��� �Լ� ��� : 
-- ���� (salary)

select SUM(salary) �հ� ,  Round (AVG(salary), 2) ���,  MAX(salary) �ִ밪, Min (salary ) �ּҰ� , count(*) ���ȷ��ڵ��
from employee; 

-- ���� �Լ��� NULL�� �ڵ����� ó����. 

select commission
from employee; 

-- ���ʽ� (commission)  <== null�� �ڵ����� ó���� 
select SUM(commission) �հ� ,  Round (AVG(commission), 2) ���,  MAX(commission) �ִ밪, 
            Min (commission ) �ּҰ� , count(*) ���ȷ��ڵ��
from employee; 

-- �μ����� ������ �հ�, ���, �ִ���� , �ּ� ����, �׷��ε� ���� ��� 

select  dno �μ���ȣ, SUM(salary) �հ�, Round ( AVG(salary) ) ���, 
            MAX(salary) �ִ밪, MIN(salary) �ּҰ�, COUNT(*) �׷��εȼ�
from employee
group by dno ;           -- DNO �÷��� ������ ���� �׷����ؼ� �����Լ��� ������. 

select salary, dno 
from employee
order by dno asc; 

-- ��å(job) ���� ������ �հ�, ���, �ִ밪, �ּҰ�, �׷��εȼ��� ��� �� ������.

select  ename, job, salary 
from employee
order by job ; 

select  job ��å , count(*) �׷��εȰ��� , SUM (salary ) �հ�,
             round(AVG(salary),2) ��� , MAX(salary) �ִ밪, MIN(salary) �ּҰ�
from employee
group by job;                 -- job �÷��� ������ ���� �׷��� 

select count(*) ��ü���ڵ��  from employee; 

/*
goup by ������ where ���� 
where ���� 
*/
-- ���ݺ��� ������ ���,���,�հ�,����ִ�� �ּڰ�,  �׷��ε� ���� ����ϰ� �μ���ȣ 10�������ϰ� �μ���ȣ���� ���븸���
--����� desc ��� 

select *from employee
order by dno asc;

select job ����,count(job),SUM(salary) ����,ROund (AVG(salary))���,
MAX(salary) �ִ밪,MIN(salary)�ּҰ�
where dno!=20 
group by job
having round(AVG(salary)) >= 2000
order by ��� desc;

--group by ������ ���÷���

select job, dno from employee
order by job asc;

select dno,job,sum (salary)

-- ����å(job)�� ���ؼ� ������ �հ� ,���,�ִ�,�ּڰ� ,ī��Ʈ���� ����ϰ� �Ի����� 81�� �� �Ի��� ����鸸 ����
-- ������ ����� 1500���� �̻��� ���� �߷� �е� ����� �����ϴ�����

select job,count(*),
SUM(salary),ROUND(AVG(salary)) ,MAX(salary),MIN(SALARY)
from employee
where hiredate like '81%'
group by job having round(avg(salary))>=1500
order by �޿� desc;

 select job, COUNT(*) AS "������ ��� ��",
 SUM(salary) AS "�� �޿�",
 ROUND(AVG(salary)) AS "��� �޿�",MAX(salary) AS "�ִ� �޿�", MIN(salary) AS "�ּ� �޿�"
FROM employee
WHERE TO_CHAR(hiredate, 'YYYY') = '1981' -- '81%'�� '1981'�� �����Ͽ� �⵵�� ��
GROUP BY job HAVING ROUND(AVG(salary)) >= 1500 -- AVG(salary)�� 1500 �̻��� ��쿡 ���� ���� �߰�
ORDER BY "��� �޿�" DESC; 

/* group by ������ ���Ǵ� Ű����
   rollup : group by �÷� <== ��� ������ ���ο� ��ü��� �� �ѹ��� ����� �ش� .
   cube  :�׷��� ������ ���ο� ������ ,������ ���ο� ��ü ����� �������������
*/
-- 1.rollup .cube Ű���带 ������� �ʴ°�� :�׷����� ����� ���

select dno,job,count(*),
SUM(salary),round(avg(salary) ,2),max(salary),min(salary)
from employee 
group by dno,job
order by count(*) desc;

select dno,job
from employee
order by job asc;

-- 2.rollup Ű���带 ����ϴ°�� :�׷����� ������ , ��ü���뵵 ���

select dno,job,count(*),
SUM(salary),round(avg(salary) ,2)��,max(salary),min(salary)
from employee 
group by rollup (dno,job)
order by count(*) desc;

-- 3.cube : Ű���带 ����ϴ� ��� : �׷����� ������ ,��ü ���뵵 ���,���λ����� ���

select dno,job,count(*),
SUM(salary),round(avg(salary) ,2),max(salary),min(salary)
from employee 
group by cube(dno,job)
order by count(*) desc;

/*
subquery :select ������ salact ���� [sub query] ,�������� �۾��� �ѱ������� ó��;
 -- where ������ ���� ����
*/
-- 1. ename �� scott �� ����� ��å��������� ��� :2�� Ŀ���� �ʿ���.
-- 2. SCOT ����� ��å�� �˾ƿ��� ����

select job enma
from enplpp
where ename = scott

-- 3. ã�ƿ� ��ý�� ���������ؼ� ���̸�

select job,ename
from employee
where job='ANALYET'

-- subquery �� ����ؼ� ������ó����

select ename ,job
from employee
where job=(select to from employee where ename = 'scott' );

select*from employee;

-- scott �� allen �� ��å�� �ش���� �ʴ� ������� ������

-- .sctt ����å�� ����ϴ� ����

-- 1. scoott �� ��å�� ����ϴ� ����
select job from employee where ename = 'SCOTT' ;

-- 2.allen �� ��å�� ����ϴ� ����
select job from employee where ename = 'ALLEN'

-- 3.SCOOTT �� ALLEN �� ��å�� �ش���� �ʴ� ������� �߫x

select ename , job
from employee
where job not in ('ANALYST','SALESMAN');

-- subquery �� �������� ���

select ename ,job
from employee
where job not in (
(select job from employee where ename = 'SCOTT'),
(select job from employee where ename = 'ALLEN')
);

SELECT ename, job
FROM employee
WHERE job NOT IN (SELECT job FROM employee WHERE ename = 'SCOTT'
) AND job NOT IN (SELECT job FROM employee WHERE ename = 'ALLEN'
);

select ename,job
from employee
where job not in (
select job from employee
where ename in ('SCOTT' ,'ALLEN' ) 
);

-- ���� ��    :   =
-- ���� ���� ��  : I IN
-- 'SCOTT' ���� ���� �� ���� �޴� ����� ���� , ������ ���
  SELECT ENAME ��� , SALARY ����
  FROM EMPLOYEE 
  WHERE SALARY > ( SELECT SALARY FROM EMPLOYEE WHERE   ENAME = 'SCOTT'

SELECT *FROM EMPLOYEE
ORDER BY SALARY DESC;
-- �ּ� �޿��� �޴� ������� �̸� , ������ ,�޿����

SELECT ENMAE, JOB,SALARY
FROM EMPLOYEE
WHERE SALARY=(SELECT MIN(SALLAY)FROM EMMPLOYEE);

--SUBQUERY �� ����ؼ� ���
-- �μ����� �ּ� �޿��� �޴� ��������� �̸�,��å,������ ��� : ��Ʈ : GROUP BY ,DNO,MIN,IN Ű����

SELECT SALARY ,DNO,ENAME
FROM EMPLOYEE
ORDER BY DNO ASC, SALARY DESC;

-- SUBQUERY

SELECT ENAME �̸�,JOB ��å, SALARY ����
FROM EMPLOYEE
WHERE SALARY IN ( 

-- ���μ��� �ּҿ����� SELECT �Ѱ��� ���

FROM EMPLOYEE
GROUP BY DNO )
;

--�� �μ����� �ּ� �޿��� 30�� �μ��� �ּұ޿� ���� ū�μ��� ���

SELECT JOB
FROM EMPLOYEE
WHERE SALARY IN (SELECT MIN(SALARY) FROM EMPLOYEE 
GROUP BY DNO 

SELECT DNO , COUNT(*) ,MIN(SALARY)
FROM EMPLOYEE
GROUP BY DNO 
HAVING MIN (SALARY)> (
-- 30�� �μ��� �ּҿ���
SELECET MIN (SALARY)FROM EMPLOYEE
WHERE DNO = 30
);


