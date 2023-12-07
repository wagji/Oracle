/*
Oracle 의 다양한 함수사용하기      :인풋=> 기능=> 결과     (){}
1.문자를 처리하는 함수
2.숫자를 처리하는 함수
3.날짜를 처리하는 함수
4.변환 함수
5.일반 함수
 */
 
 /*
 1. 문자를 처리하는 함수 :  
 
-- UPPER   : 소문자를 대문자로 변환해주는 함수 
-- LOWER   : 소문자로 처리해 주는 함수
-- INITCAP : 첫자만 대문자로 처리해주는 함수
-- LENGTH  : 글자수를 반환 (영문 :1byte , 한글 :2byte,3byte ;)
-- LENGTHB : 글자수 반환 (영문  :1byte, 한글 : 3 byte
-- CONCAT  : 문자열을 연결 해주는 함수 
-- SUBSTR  : 글자를 잘라오는함수
-- INSTR   : 특정 문자의 위치값을 출력
-- LPAD    : 글자 자릿수를 입력 받아서나머지는 특정 기호로 채움 (왼쪽)
-- RPAD    : 글자 자릿수를 입력 받아서 나모지는 특정 기호로 채움 (오른쪽)
-- RTRIM   : 오른쪽의 공백 제거
-- LTRIM   : 왼쪽의 공백 제거 

  dual  : 가상의 테이블
 */
 
 select *
from employee;
 
  select UPPER ('Oracle') from dual ;
  select *from employee;
  select ename 원본이름,UPPER(ename) 대문자이름,LOWER(ename) 소문자이름,INITCAP(ename)첫자만대문자 from employee;
 
 -- 검색이 안됨  :컬럼의 값은 대소문자를 구분한다
 
  select *
  from employee
  where ename = 'smith';
 
  select *
  from employee
  where ename = UPPER('smith');
 
  select LENGTH ('Orecle mania') from dual ; -- 12
  select LENGTH ('오라클 매니아') from dual ;    -- 7
 
  select LENGTHB ('Orecle mania') from dual ; -- 12
  select LENGTHB ('오라클 매니아') from dual ;  -- 19  ,한글 1자 : 3byte ( UTF--8)
 
  select ename 원본, LENGTH (ename) 글자수 from employee;
  select ename 원본, LENGTHB (ename) 글자수 from employee;
  
-- CONCAT : 문자열과 문자열을 연결 해주는 함수
-- || 컬럼을 연결해주는 연산자

 select 'Oracle' , 'Mania' from dual ;
 select concat ('Oracle' ,'Mania' )as 연결됨 from dual ;
 select concat (ename ,job )from employee;
 
 select ename || job from employee;
 select ename ||'    '|| job as 이름과직책 from employee;
 
 -- SUBSTR  : 문자를 잘라오는 함수 , ;SUBSTR (컬럼,4.3)  <==컬럼에 들어가있는 문자열중에 4번째 자리에서 3자리를 잘라와서 출력
  
 select substr ('Oracle Mania',4,3) from dual; -- index :1번부터 시작
 
 select ename 원본이름,substr(ename, 2, 3)잘라온이름 from dual;
 SELECT ename AS 원본이름, SUBSTR(ename, 2, 3) AS 잘라온이름 FROM dual;
 
 select*from employee;
 
-- employee 테이블에서 이름,입사날자만 출력 하세요  
select ename as 이름, substr(hiredate, 4,2)입사월 from employee;
-- employee 테이블에서 이름,입사월만 출력하세요 substr 함수를 사용 --이월달에 입사한 사원출력 

select ename as 이름,substr(hiredate, 4,2)입사월
from employee
where substr (hiredate, 4,2) = '02' ;

--81년도에 입사한 사원의 이름,입사년,입사월 ,입사일을 출력하세요, <== substr,where

select ename as 이름,substr(hiredate, 1,2)입사년,substr(hiredate, 4,2)입사월,substr(hiredate, 7,2)입사일
from employee
where substr (hiredate, 1,2) = '81' ;

 -- INSTR :특정문자의 index 번호를 출력 , index 번호는 1부터
 -- instr(컬럼명,'A'  ) ; 컬럼에서 문자열중이 'a'가있는 index 번호를 출력
 -- instr ( 컬럼명 'A' ,4)  ;index 4번부터오른쪽은 A가드어가있는 inde번호를 출력
 
 select (instr ('Oracle Mania','a'))from dual; -- 3 <== a 가 위치한 index
 select (instr ('Oracle Mania','a',4))from dual; -- 9 <== index 4번이후부터 검색 a가 위치한index 검색
 
 select ename 이름,instr(ename,'M')as M의위치
 from employee;
 
 -- LPAD :LPAD(컬럼명,늘릴자릿수,'*' ) 공백자리에 *을제공 (왼쪽
 -- RPAD : RPAD (컬럼명,늘릴자릿수'*' ) 공백자리에 *르렞공 오른쪽
 
SELECT '770824-123456' AS 주민번호, LPAD('770824-1', 20, '*') AS LPAD FROM dual;
SELECT '770824-123456' AS 주민번호, RPAD('770824-1', 20, '*') AS RPAD FROM dual;
 select*from employee;
 
 -- hiredate 칼럼 을 년도만 출력하고 나머지는 *로출력 < == suna
 
 select ename 이름,RPAD(substr(hiredate, 1,2),8,'*')입사년 

 -- 공백 처리 : RTRIM : 오른쪽의 공백을 제거 , LTRIM : 왼쪽의 공백을 제거 

 select'        Oracle Mania     ' from dual ;
  LTRIM ( ''
 RTRIM ( ''
 TRIM  ( ''
 
 -- 앞쪽 공백제거후 값을 대문자로 변환
 select *
 from employee
 where ename =UPPER (TRIM ( ' SMITH' ) ;
 
 -- 2. 숫자를 처리하는 함수 : ROUND : 반줄평하는함수 TRIdIC : 특정자리 수에서 잘라내서버림 
 
 -- ROUND :특정 자릿수에서 반올림 ,5이상은반올림 5이하는 잘라냄 
 /*
 ROUND (실수 ) : 소숫점 자리에서 반올림
 ROUND (실수,소숫잠자리
 -- 소숫점 자리 (방수) 소숫점 기준으로 오른쪽으로 이동해서 그문자를반올리
 */

  select 98,7845 as 원본,
 round (98,7562) ,  -- 소숫점 위에서 반올림
  round (98.7565,2)as R2, --소숫점  오른쪽으로 2자릴 이동후 반올림 
  round (98.7565,-10)as R3 --
  from dual;
 
 -- 근로소득세 : 월급의 3.3 % salary 0.33 소득세

select salary 월급, salary*0.033 소득세 ,Round(salary*0.033)R1, Round (salary*0.033,2)R2,
 salary - (salary*0.033)
from employee ;

 -- TRUNC : 특정 자리에서 잘라서 버림  <== 특정 날짜르르 연산 ,오늘 날짜에서 100일이후의 날짜가 언제냐 ? 
 
 select trunc (98.7653)T1,
       trunc (98.7435,2)T2,
       trunc(98.7631-1)T3,
       trunc(98.5362-2)T4
       from dual;
       
-- MOD  : 나머지 값만 출력 ; MOD  (인자1, 인자2)앞에 인자를 뒤에인자로 나누어서 나머지를 출력함
-- TRUNC :몫만 출력할때ㅐ

select MOD(3,2) ,
      TRUNC (32/2)
from dual; 

 
 