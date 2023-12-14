/*     group by , subquery ���� 

��� ����� �Ҽ��� 2�ڸ����� ����ϵ� �ݿø� �ؼ� ��� �Ͻÿ�.  
1.  10 �� �μ��� �����ϰ� �� �μ��� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�. �μ���ȣ�� �������� ���� �ϼ���.  
2.  ��å�� SALSMAN, PRESIDENT, CLERK �� ������ �� �μ��� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�.   	
3. SMITH �� ������ �μ��� �ٹ��ϴ� ����� �� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�. 
4. group by - �μ��� �ּҿ����� �������� �ּҿ����� 1000 �̻��� �͸� ����ϼ���. 
5. group by - �μ��� ������ �հ谡 9000 �̻�͸� ���
6. group by - �μ��� ������ ����� 2000 �̻� ��� �ϵ� �μ���ȣ��  ������������ ���
7. group by - ������ 1500 ���ϴ� �����ϰ� �� �μ����� ������ ����� ���ϵ� ������ ����� 2500�̻��� �͸� ��� �϶�. 
8. sub query - �μ����� �ּ� �޿��� �޴� ������� �̸��� �޿��� ��å�� �μ���ȣ�� ����ϼ���. 
9. sub query - ��ü ��� �޿����� ���� �޴� �������  �̸��� �޿��� ��å�� �μ���ȣ�� ����ϼ���. 
10. sub query - �޿��� ��� �޿����� ���� ������� �����ȣ�� �̸��� ǥ���ϵ� ����� �޿��� ���� �������� �����Ͻÿ�. 

       :  �Ϸ�ð� : 17: 30�� 
*/ 
1.  10 �� �μ��� �����ϰ� �� �μ��� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�. �μ���ȣ�� �������� ���� �ϼ���. 
select  dno �μ���ȣ, count(*) , SUM (salary) , round ( avg(salary), 2) , max(salary), min (salary) 
from employee 
--where dno != 10         -- <> ,  ^= 
where dno not in (10) 
group by dno                -- ���� �μ��� �׷��� 
order by dno asc ; 

2.  ��å�� SALSMAN, PRESIDENT, CLERK �� ������ �� �μ��� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�.  
select  dno �μ���ȣ, count(*) , SUM (salary) , round ( avg(salary), 2) , max(salary), min (salary) 
from employee 
where job not in ('SALSMAN', 'PRESIDENT', 'CLERK') 
group by dno                -- ���� �μ��� �׷��� 
 
3. SMITH �� ������ �μ��� �ٹ��ϴ� ����� �� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�.

select dno �μ���ȣ, count(*) , SUM (salary) , round ( avg(salary), 2) , max(salary), min (salary) 
from employee
where job = ( select job from employee where ename = 'SMITH'  )
group by dno 

4. group by - �μ��� �ּҿ����� �������� �ּҿ����� 1000 �̻��� �͸� ����ϼ���. 

select dno , min (salary) 
from employee
group by dno 
having min (salary) >= 1000; 

5. group by - �μ��� ������ �հ谡 9000 �̻�͸� ���
select dno , sum (salary) 
from employee
group by dno 
having sum (salary) >= 9000; 

6. group by - �μ��� ������ ����� 2000 �̻� ��� �ϵ� �μ���ȣ��  ������������ ���

select dno , round( avg (salary) , 2) 
from employee
group by dno 
having round( avg (salary) , 2)  >= 2000; 

7. group by - ������ 1500 ���ϴ� �����ϰ� �� �μ����� ������ ����� ���ϵ� ������ ����� 2500�̻��� �͸� ��� �϶�. 

select dno  , round( avg (salary) , 2) 
from employee
where salary > 1500 
group by dno 
having round( avg (salary) , 2) >= 2500 ;  

8. sub query - �μ����� �ּ� �޿��� �޴� ������� �̸��� �޿��� ��å�� �μ���ȣ�� ����ϼ���. 

select ename �̸�, salary �޿�, job ��å , dno �μ���ȣ 
from employee 
where salary in (
        -- �μ��� �ּ� ���� �� ��� �ϴ� select 
        select min(salary) 
        from employee
        group by dno 
); 

9. sub query - ��ü ��� �޿����� ���� �޴� �������  �̸��� �޿��� ��å�� �μ���ȣ�� ����ϼ���. 

select ename �̸�, salary �޿�, job ��å, dno �μ���ȣ
from employee
where salary > (
        -- ��ü ����� select �ϴ� ���� �ۼ� 
        select round ( avg(salary) , 2) from employee 
        
    ) ; 


10. sub query - �޿��� ��� �޿����� ���� ������� �����ȣ�� �̸��� ǥ���ϵ� ����� �޿��� ���� �������� �����Ͻÿ�. 

select ename �̸�, salary �޿�, job ��å, dno �μ���ȣ
from employee
where salary > (
        -- ��ü ����� select �ϴ� ���� �ۼ� 
        select round ( avg(salary) , 2) from employee 
        
    )  
order by salary asc ;   