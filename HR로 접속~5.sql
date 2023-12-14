select *from employee

-- ��� ����� �Ҽ��� 2�ڸ����� ����ϵ� �ݿø� �ؼ� ��� �Ͻÿ�.  

-- 1.  10 �� �μ��� �����ϰ� �� �μ��� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�. �μ���ȣ�� �������� ���� �ϼ���.  

SELECT dno AS "�μ���ȣ", SUM(salary) AS "�հ�",
  ROUND(AVG(salary)) AS "���", MAX(salary) AS "�ִ밪", MIN(salary) AS "�ּҰ�"
FROM EMPLOYEE
WHERE dno != 10
GROUP BY dno
ORDER BY dno ASC;

-- 2.  ��å�� SALSMAN, PRESIDENT, CLERK �� ������ �� �μ��� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�.   	

SELECT JOB , SUM(salary) AS "�հ�", MAX(salary) AS "�ִ밪", MIN(salary) AS "�ּҰ�"
FROM EMPLOYEE
WHERE JOB NOT IN ('SALESMAN', 'PRESIDENT', 'CLERK') 
GROUP BY JOB;

-- 3. SMITH �� ������ �μ��� �ٹ��ϴ� ����� �� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�. 

SELECT DNO,SUM(SALARY) ,ROUND(AVG(SALARY)),MAX(SALARY),MIN(SALARY)
FROM EMPLOYEE
WHERE DNO=(SELECT DNO FROM EMPLOYEE WHERE ENAME='SMITH' )
GROUP BY DNO;

-- 4. group by - �μ��� �ּҿ����� �������� �ּҿ����� 1000 �̻��� �͸� ����ϼ���. 

SELECT JOB, MIN(SALARY)
FROM EMPLOYEE
WHERE SALARY > 1000
GROUP BY JOB;

-- 5. group by - �μ��� ������ �հ谡 9000 �̻�͸� ���

SELECT JOB, SUM(SALARY) 
FROM EMPLOYEE
GROUP BY JOB
HAVING SUM(SALARY)>=9000;

-- 6. group by - �μ��� ������ ����� 2000 �̻� ��� �ϵ� �μ���ȣ��  ������������ ���

SELECT JOB, SUM(SALARY) AS "�հ�"
FROM EMPLOYEE
GROUP BY JOB
HAVING SUM(SALARY) >= 2000
ORDER BY JOB ASC; 

-- 7. group by - ������ 1500 ���ϴ� �����ϰ� �� �μ����� ������ ����� ���ϵ� ������ ����� 2500�̻��� �͸� ��� �϶�. 

SELECT JOB, SUM(SALARY)
FROM EMPLOYEE
GROUP BY JOB
HAVING MIN(SALARY) > 1500 AND SUM(SALARY) >= 2500;

-- 8. sub query - �μ����� �ּ� �޿��� �޴� ������� �̸��� �޿��� ��å�� �μ���ȣ�� ����ϼ���. 

select  ename ,salary, dno
from employee
order by dno asc , salary desc ; 

-- 9. sub query - ��ü ��� �޿����� ���� �޴� �������  �̸��� �޿��� ��å�� �μ���ȣ�� ����ϼ���. 

SELECT ENAME, SALARY, JOB, DNO
FROM EMPLOYEE
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE);

-- 10. sub query - �޿��� ��� �޿����� ���� ������� �����ȣ�� �̸��� ǥ���ϵ� ����� �޿��� ���� �������� �����Ͻÿ�.

SELECT ENAME, SALARY, MANAGER
FROM EMPLOYEE
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE)
ORDER BY SALARY ASC;


