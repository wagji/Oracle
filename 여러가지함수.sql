
/*
    Oracle�� �پ��� �Լ� ��� �ϱ� :    ��ǲ == ���==> ��� 
    1. ���ڸ� ó���ϴ� �Լ� 
    2. ���ڸ� ó���ϴ� �Լ� 
    3. ��¥�� ó���ϴ� �Լ� 
    4. ��ȯ �Լ� 
    5. �Ϲ� �Լ�
*/
/*
1. ���ڸ� ó���ϴ� �Լ� : 
    - UPPER : �ҹ��ڸ� �빮�ڷ� ��ȯ���ִ� �Լ� ,
    - LOWER : �ҹ��ڷ� ó���� �ִ� �Լ� 
    - INITCAP : ù �ڸ� �빮�ڷ� ó���� �ִ� �Լ� 
    - LENGTH : ���ڼ��� ��ȯ ( ���� : 1byte , �ѱ� : 1byte ) 
    - LENGTHB :  ���ڼ� ��ȯ ( ���� : 1byte, �ѱ� : 3byte) 
    - CONCAT : ���ڿ��� �������ִ� �Լ� 
    - SUBSTR : ���ڸ� �߶���� �Լ�       
    - INSTR : Ư�� ������ ��ġ���� ��� 
    - LPAD : ���� �ڸ����� �Է� �޾Ƽ� �������� Ư�� ��ȣ�� ä�� ( ���� )
    - RPAD : ���� �ڸ����� �Է� �޾Ƽ� �������� Ư�� ��ȣ�� ä�� ( ������ )
    - RTRIM : �������� ���� ����
    - LTRIM : ������ ���� ���� 
    
    dual : ������ ���̺� 
*/

select UPPER ('Oracle') from dual ; 

select * from employee; 

select ename as �����̸�, UPPER (ename) �빮���̸�, LOWER(ename) �ҹ���, 
    INITCAP(ename) ù�ڸ��빮�� from employee; 

-- �˻��� �ȵ� : �÷��� ���� ��ҹ��ڸ� ����     
select * 
from employee
where ename = 'smith'; 

select * 
from employee
where ename = UPPER('smith'); 

select LENGTH ('Oracle mania') from dual;     -- 12
select LENGTH ('����Ŭ �ŴϾ�') from dual;         -- 7 


select LENGTHB ('Oracle mania') from dual;     -- 12
select LENGTHB ('����Ŭ �ŴϾ�') from dual;         --19      �ѱ� 1�� : 3byte  ( UTF-8 )

select ename ���� , LENGTH (ename) ���ڼ� from employee; 
select ename ���� , LENGTHB (ename) ���ڼ� from employee; 

-- CONCAT : ���ڿ��� ���ڿ��� ���� ���ִ� �Լ�
-- ||  �÷��� ������ �ִ� ������. 
select 'Oracle' ,  ' Mania'  from dual ;  

select concat ('Oracle' ,  ' Mania') as �����  from dual ;  

select concat ( ename , job ) from employee; 

select ename || job from employee; 

select ename || '      '  || job as �̸�����å  from employee; 

-- SUBSTR : ���ڸ� �߶���� �Լ� ,  substr (�÷�, 4, 3)   <== �÷��� �ִ� ���ڿ��� , 4��° �ڸ����� 3�ڸ� �߶�ͼ� ��� 

select substr ('Oracle Mania', 4,3) from dual ;   -- index : 1������ ���� 

select ename �����̸�, substr ( ename , 2, 3) �߶���̸� from employee ; 

select * from employee; 

-- employee ���̺��� �̸�, �Ի���� ��� �ϼ���. substr �Լ��� ��� 
select ename as �̸� , substr ( hiredate, 4, 2) �Ի�� from employee; 

-- employee ���̺��� �̸�, �Ի���� ��� �ϼ���. substr �Լ��� ���  -- 2���޿� �Ի��� ��� ��� 
select ename as �̸� , substr ( hiredate, 4, 2) �Ի�� 
from employee
where substr ( hiredate, 4, 2) = '02' ; 


-- 81�⵵�� �Ի��� ����� �̸�, �Ի��, �Ի��, �Ի����� ����ϼ��� ,  <== substr , where 
select ename �̸�, substr(hiredate, 1,2) �Ի��, substr(hiredate , 4,2) �Ի��, substr(hiredate , 7,2) �Ի���
from employee
where substr(hiredate, 1,2) = '81' ; 

-- INSTR : Ư�� ������ index ��ȣ�� ���   ,  index ��ȣ�� 1 ���� 
       -- instr(�÷���, 'A')    : �÷����� ���ڿ��߿� 'A' �� �ִ� index ��ȣ�� ��� 
       -- instr(�÷���, 'A',  4) :  index 4�� ���� �������� A�� �� �ִ� index ��ȣ�� ��� 
       -- �˻� ���� ������ 0 ���� ��� 
       
select ( instr ('Oracle Mania' , 'a')) from dual ;    -- 3   <== a �� ��ġ�� index 

select ( instr ('Oracle Mania' , 'a', 4 )) from dual ;   -- 9   <== index 4�� ���ĺ��� �˻� 'a' �� ��ġ�� index �˻� 

select ename �̸� , instr(ename, 'M') as M����ġ
from employee; 

-- �߿��� �����ʹ� �Ϻθ� ���߰� ��� 
-- LPAD :     LPAD (�÷���, �ø��ڸ���, '*')   :  ���� �ڸ��� *�� ä�� (����) 
-- RPAD :    RPAD (�÷���, �ø��ڸ���, '*')   :  ���� �ڸ��� *�� ä�� (����)

select '770824-123456'  �ֹι�ȣ ,   LPAD ('770824-1',  20, '*') as "LPAD" from dual; 

select '770824-123456'  �ֹι�ȣ ,   RPAD ('770824-1',  20, '*') as "LPAD" from dual; 

select * from employee; 

-- hiredate �÷��� �⵵�� ����ϰ� �������� *�� ��� .   <== substr, rpad �� ����ؼ� ó�� 
select ename �̸�, rpad ( substr(hiredate,1,2), 8 , '*') �Ի����� 
from employee;  

-- ���� ó�� : RTRIM : �������� ������ ���� , LTRIM : ������ ������ ���� , TRIM : ����, ������ ������ ��� ���� 

select '            Oracle Mania          '  as ����, 
            LTRIM (  '            Oracle Mania          ')  �����ǰ�������,
            RTRIM ( '            Oracle Mania          ') �����ʰ�������, 
            TRIM ( '            Oracle Mania          ') ����������

from dual; 


-- �յ� ���������� ���� ����ڷ� ��ȯ 
select * 
from employee
where ename = UPPER (TRIM ( '    smith    ' )) ; 


-- 2. ���ڸ� ó���ϴ� �Լ�  :  ROUND : �ݿø� �ϴ� �Լ�,   TRUNC : Ư���ڸ������� �߶󳻾����.  MOD : ������ ���� ��� 

-- ROUND : Ư�� �ڸ������� �ݿø� ,  5�̻� �ݿø�,  5�̸� �� �߶� ����. 
/*
    ROUND (�Ǽ�)  :   �Ҽ��� ���ڸ����� �ݿø�
    ROUND (�Ǽ�, ��?G���߸���) : 
        - �Ҽ��� �ڸ� (���) : �Ҽ��� �������� ���������� �̵��ؼ� , �� ���ڸ����� �ݿø���   <== ���� 
        - �Ҽ��� �ڸ� (����) : �Ҽ��� �������� �������� �̵��ؼ� , �� �ڸ����� �ݿø���
*/ 

select 98.7654 as ���� , 
            round (98.7654)  as R1,           -- �Ҽ��� �ڿ��� �ݿø� 
            round (98.7654, 2) as R2,        -- �Ҽ��� ���������� 2�ڸ� �̵��� �� �ڿ��� �ݿø�   <== ���� 
            round (98.7654, -1) as R3,       -- �Ҽ��� �������� 1�ڸ��̵��� �� �ڸ����� �ݿø�  
            round (98.7654, -2) as R3, 
            round (98.7654, -3) as R3
from dual ; 

-- �ٷ� �ҵ漼  : ������ 3.3 ,     salary * 0.033  �ҵ漼 

select salary ���� , salary * 0.033 �ҵ漼 , Round ( salary * 0.033) R1, Round( (salary * 0.033), 2 ) R2 , 
        Round(salary  - ( salary * 0.033 ) , 2 ) �Ǽ��ɾ�
from employee; 

-- TRUNC : Ư�� �ڸ����� �߶� ����.   <== Ư�� ��¥ �� ����  , ���� ��¥���� 100 ������ ��¥�� ������? 
select trunc (98.7654) T1, 
            trunc (98.7654 , 2) T2,
            trunc (98.7654, -1) T3, 
            trunc (98.7654, -2) T4 
from dual ; 

-- MOD   :   ������ ���� ���  , MOD ( ����1, ����2 ) 
-- TRUNC : �� �� ��� �Ҷ� 
select MOD ( 3, 2 ),            -- ������ 
            TRUNC ( 31 / 2 )        -- �� ���       
from dual ; 

/*
 ��¥ �Լ� : 
      - sysdate : ���� �ý����� ��¥�� ��� �ϴ� �Լ� 
      - months_between : �� ��¥ ������ �������� ��� 
      - add_months : Ư�� ��¥���� �������� �� �ؼ� ��� 
      - next_day : Ư�� ��¥���� ������ �ʷ��ϴ� ������ ���ڷ� �޾Ƽ� �����ϴ� ��¥�� ��� 
      - last_day : ���� ������ ��¥�� ��� 
      - round (��¥) : ��¥�� �ݿø� : 15�� �̻� �ݿø�, 15�� �̸� : ���� 
      - trunc (��¥) :  ��¥�� �߶󳻴� �Լ� 

*/ 

select sysdate from dual;    -- 23/12/07 

-- ��¥�� ������ ����  : 
select sysdate ���糯¥ , sysdate-1 ������¥, sysdate + 1 ���ϳ�¥ from dual ; 

-- ���ÿ��� 100���� ��¥�� ?
select sysdate -100 "100����¥" from dual; 
-- ���� 1000������ ��¥�� ? 
select sysdate +1000  "1000���ĳ�¥" from dual; 

-- �Ի��Ͽ��� ���ó����� �ѱٹ��ϼ��� ����.   date  �÷�.     (sysdate - hiredate) 
desc employee; 

-- �ѱ��ϼ� = trunc(���ó�¥ - �Ի糯¥ )
select ename �̸� , trunc(sysdate - hiredate) �ѱٹ��ϼ�  from employee; 

-- �Ի��Ͽ��� 1000�� ������ ��¥  �� �̸�, 1000�Ͻ����� ��¥�� ��� 
select ename �̸� , hiredate �Ի糯¥,  hiredate + 1000 �Ի���1000�ϳ�¥ from employee; 

-- Ư�� ��¥���� ���� ��������  ��� : TRUNC (��¥, 'MONTH')  , ROUND ( ��¥, 'MONTH') 
select hiredate ������¥ , TRUNC (hiredate, 'MONTH'), ROUND(hiredate, 'MONTH') from employee; 

-- ���� ������ �ٹ� �������� ��� : months_between (��¥, ��¥)   :  �� ��¥ ������ ������ ���
select ename �̸�, hiredate �Ի糯¥, trunc (months_between (sysdate , hiredate)) ������ from employee; 

-- ���ó�¥���� 100���� ������ ��¥ (add_months)  , 100�� ���� ��¥ 
-- date Ÿ�� �϶� ����

select sysdate ���ó�¥, add_months (sysdate, 100) "100������" , sysdate + 100 "100����" from dual; 

-- last_day : �� ��¥�� ������ ��¥�� ����� 
select last_day(sysdate) from dual; 

-- ��� ����� �Ի��ѳ��� ������ ��¥�� �������� ��� 
select hiredate �Ի糯¥, last_day(hiredate) ��������¥ from employee; 


/*
    ���� ��ȯ �Լ�  
        TO_CHAR : ��¥��, ������ ===> ������ 
        TO_DATE : ���� ====> ��¥�������� ��ȯ 
        TO_NUMBER : ���� ==> ������������ ��ȯ 
*/

-- TO_CHAR  : ��¥ ==> ���� 

select sysdate from dual;    --  23/12/07 

-- YYYY : �⵵ , MM :�� , MON: ��  , DD : �� , HH : �ð� , MI : �� , SS : �� , DAY : ���� (������), DY(��, ȭ) 

select TO_CHAR (sysdate , 'YYYY-MM-DD HH:MI:SS') from dual ; 

select hiredate �Ի糯¥  , TO_CHAR (hiredate , 'YYYY"��" MI"��" DD"��" HH:mm:SS') �Ի糯¥2
from employee; 

select TO_CHAR (sysdate , 'YYYY-MM-DD MON DAY DY HH:MI:SS') from dual ; 

-- TO_CHAR  ; ����  ==> ���� 
/*
        0 : �ڸ����� ó����, �ڸ����� ������ 0���� ó���� 
        9 : �ڸ����� ó����, �ڸ����� ������ �������� ó���� 
        L: �� ������ ��ȭ�� ��ȣ�� ǥ����. 
        
        . :  �Ҽ������� ó���� 
        , :  õ���� ������ 
*/ 

select TO_CHAR ( 9876 , '000,000') from dual ; 
select TO_CHAR ( 9876 , 'L999,999') from dual ; 

-- ������ �� ������ ��ȭ ����� �ٿ��� õ������ ��� 

select salary ���� , to_char(salary , 'L999,999') "����(�ѱ�)"
from employee; 


-- TO_DATE : ���� , ���� ==> ��¥�������� �ٲ�. 
     -- ��¥ + 100�� 
     -- months_between(��¥, ��¥) : ���� �� 

select to_date ('1998-10-10' , 'YYYY-MM-DD') from dual ; 

-- 1981�� 01�� 01�� ���� 100�� ���� ������ ��¥�� ��� , 100���� ���� ������ ��¥ , add_month(��¥, ������) 

select to_date ('1981/01/01', 'YYYY/MM/DD') + 100 "100���� ��¥" , 
           add_months( to_date ('1981/01/01', 'YYYY/MM/DD') , 100)  "100���������� ��¥"
from dual; 

-- ���� ==> ��¥�������� ��ȯ 

select to_date ( 770814 , 'YYMMDD') from dual 

-- �ڽ��� ���Ͽ��� ������� ��� ��Ҵ��� ?  ���� ��Ҵ��� ���   <== months_between ( ���糯¥, ����)  : ������ 
        -- sysdate - ���� (date) 
        
-- employee ���̺��� 2050�� 12�� 24 �ϱ����� ��¥(�ϼ�)  �� ��� 

