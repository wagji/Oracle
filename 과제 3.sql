 select *
from employee;

-- 1. SUBSTR �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ��� �Ͻÿ�. 
 
 select hiredate as �Ի糯¥,
 substr(hiredate, 1,2) �Ի��, substr(hiredate, 4,2)�Ի��
 from employee; 

-- 2. SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ����� ��� �Ͻÿ�.

select ename as �̸�,substr(hiredate, 4,2)�Ի��
from employee
where substr (hiredate, 4,2) = '04' ;

-- 3. MOD �Լ��� ����Ͽ� ���ӻ���� Ȧ���� ����� ����Ͻÿ�. 

SELECT *
FROM employee
WHERE MOD(MANAGER, 2) = 1;

-- 4. MOD �Լ��� ����Ͽ� ������ 3�� ����� ����鸸 ����ϼ���.

SELECT *
FROM employee
WHERE MOD(salary, 3) = 0;

-- 5. �Ի��� �⵵�� 2�ڸ� (YY), ���� (MON)�� ǥ���ϰ� ������ ��� (DY)�� �����Ͽ� ��� �Ͻÿ�. 

  SELECT TO_CHAR (hiredate,'YY-MON , DY')FROM employee;

-- 6. ���� �� ���� �������� ��� �Ͻÿ�. ���� ��¥���� ���� 1�� 1���� �� ����� ����ϰ� TO_DATE �Լ��� ����Ͽ�
 --  ������ ������ ��ġ ��Ű�ÿ�.

SELECT TO_DATE('2023-01-01', 'YYYY-MM-DD') - SYSDATE 
FROM dual;

-- 7. �ڽ��� �¾ ��¥���� ������� �� ���� �������� ��� �ϼ���. 

SELECT TO_CHAR (sysdate,'2023/03/03', 'YYYY-MM-DD') - SYSDATE 
FROM dual;

SELECT TRUNC(SYSDATE) - TO_DATE('1993-03-03', 'YYYY-MM-DD') 
FROM dual;

-- 8. �ڽ��� �¾ ��¥���� ������� �� ������ �������� ��� �ϼ���.
SELECT MONTHS_BETWEEN(TRUNC(SYSDATE), TO_DATE('1993-03-03', 'YYYY-MM-DD')) 
FROM dual;

-- 9. ������� ��� ����� ����ϵ� ����� ���� ����� ���ؼ��� null ����� 0���� ��� �Ͻÿ�.

SELECT TO_CHAR(MANAGER , '00,00') FROM employee;


-- 10.   �����ȣ,
   --   [�����ȣ 2�ڸ������ �������� *���� ] as "������ȣ", 
     --  �̸�, 
       -- [�̸��� ù�ڸ� ��� �� ���ڸ�, ���ڸ��� * ����] as "�����̸�"       

SELECT eno,
  RPAD(SUBSTR(eno, 1, 2), LENGTH(eno), '*') AS "������ȣ",ename �̸�,
  RPAD(SUBSTR(ename, 1, 1), 4, '*') AS "�����̸�"
FROM employee;

-- 11.  �ֹι�ȣ:   �� ����ϵ� 801210-1*******   ��� �ϵ��� , ��ȭ ��ȣ : 010-12*******
-- 	dual ���̺� ���

SELECT '801210-1' || RPAD(SUBSTR(�ֹι�ȣ, 8), 7, '*') AS �ֹι�ȣ,
  '010-' || RPAD(SUBSTR(��ȭ��ȣ, 8), 6, '*') AS ��ȭ��ȣ
FROM dual;
    
-- 12 �ڽ��� ���Ͽ��� ������� ��� ��Ҵ��� ?  ���� ��Ҵ��� ���   <== months_between ( ���糯¥, ����)  : ������ 
        -- sysdate - ���� (date) 
        
SELECT MONTHS_BETWEEN(TRUNC(SYSDATE), TO_DATE('1993-03-03', 'YYYY-MM-DD')) AS "���",
  TRUNC(SYSDATE) - TO_DATE('1993-03-03', 'YYYY-MM-DD') AS "����"
FROM dual;

-- 13.  employee ���̺��� 2050�� 12�� 24 �ϱ����� ��¥(�ϼ�)  �� ��� 

SELECT TO_DATE('2050-12-24', 'YYYY-MM-DD') - SYSDATE AS "��¥(�ϼ�)"
FROM dual;

