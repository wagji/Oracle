 select * from employee;

-- 1. ���� �����ڸ� ����Ͽ� ��� ����� ���ؼ� $300�� �޿� �λ��� ������� ����̸�, �޿�, �λ�� �޿��� ����ϼ���. 

SELECT ename AS �̸�, salary AS ����, (salary + 300) AS �λ�ȱ޿�
FROM employee;

-- 2. ����� �̸�, �޿�, ���� �� ������ ������ ���� ���������� ��� �Ͻÿ�. 
   --  ���� �� ������ ���޿� 12�� ������ $100�� �󿩱��� ���ؼ� ��� �Ͻÿ�. 

SELECT ename AS ����̸�,salary AS ����,NVL(commission, 100) AS ���ʽ�,
salary * 12 + NVL(commission, 100) AS ����
FROM employee
ORDER BY ���� DESC;

-- 3. �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� �޿��� ������ ���� ���������� ����ϼ���. 

SELECT ename AS ����̸�, salary AS �޿�
FROM employee
WHERE salary > 2000
ORDER BY salary DESC;

-- 4. �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����ϼ���. 

select ename ����̸�, dno �μ���ȣ 
from employee 
where ENO=7788 ;

-- 5. �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ��� �ϼ���. 

select ename ����̸�, salary �޿� 
from employee
where salary<2000 or salary>3000 ; 

-- 6. 1981�� 2�� 20�Ϻ��� 81�� 5�� 1�� ������ �Ի��� ����� �̸� ������, �Ի����� ����Ͻÿ�

select ename ����̸�,  hiredate �Ի糯¥
from employee
where  hiredate>= '81/02/20' and hiredate<= '81/05/01';

-- 7. �μ���ȣ�� 20�� 30�� ���� ����� �̸��� �μ���ȣ�� ����ϵ� �̸��� ����(��������)���� ����Ͻÿ�.

select ename ����̸�, dno �μ���ȣ
from employee
where dno = 20 or dno = 30
order by ename desc;

-- 8. ����� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿��� �μ���ȣ�� ����ϵ� �̸��� ������������ ����ϼ���. 

select ename ����̸�, salary �޿�, dno �μ���ȣ
from employee
where salary

-- 9. 1981�⵵ �Ի��� ����� �̸��� �Ի����� ��� �Ͻÿ� ( like �����ڿ� ���ϵ� ī�� ��� : _ , % )
SELECT ename AS ����̸�, hiredate AS �Ի���
FROM employee
WHERE TO_CHAR(hiredate, 'YYYY') = '1981';

-- 10. �����ڰ� ���� ����� �̸��� �������� ����ϼ���.

SELECT ename AS ����̸�, job AS ������
FROM employee
WHERE manager IS NULL;

-- 11. Ŀ�Լ��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ� �޿� �� Ŀ�Լ��� �������� �������� �����Ͽ� ǥ���Ͻÿ�.

SELECT ename AS ����̸�, salary AS �޿�, commission AS Ŀ�̼�
FROM employee
WHERE commission IS NOT NULL
ORDER BY salary DESC, commission DESC;

-- 12. �̸��� ����° ������ R�� ����� �̸��� ǥ���Ͻÿ�.

SELECT ename AS ����̸�
FROM employee
WHERE SUBSTR(ename, 3, 1) = 'R';

-- 13. �̸��� A �� E �� ��� �����ϰ� �ִ� ����� �̸��� ǥ���Ͻÿ�.

SELECT ename AS ����̸�
FROM employee
WHERE INSTR(ename, 'A') > 0 AND INSTR(ename, 'E') > 0;
 
-- 14. ��� ������ �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸鼭 
    --  �޿��� $1600, $950, �Ǵ� $1300 �� �ƴ� ����� �̸�, ������, �޿��� ����Ͻÿ�.
    
SELECT ename AS ����̸�, job AS ������, salary AS �޿�
FROM employee
WHERE (job = 'CLERK' OR job = 'SALESMAN') AND
      salary NOT IN (1600, 950, 1300);

-- 15. Ŀ�̼��� $500�̻��� ����� �̸��� �޿� �� Ŀ�̼��� ����Ͻÿ�.  
SELECT ename AS ����̸�, salary AS �޿�, commission AS Ŀ�̼�
FROM employee
WHERE commission >= 500;

