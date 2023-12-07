/*select 
 select * from employee ;
*/
-- employee 테이블의 모든 컬럼을
 
select 
from employee
whrere ;
-- 특정 컬럼을 출력 

 select eno, ename ,job
 from employee ;
 
 -- 특정 컬럼을 여러번 출력 하기 . 컬럼에 연산을 할수있다 .컬럼이름이 바뀔수 있다 . 
 
 select eno, ename , salary ,ename ,ename ,salary ,salary * 12
 from employee ;
 
 -- 컬럼 일동을 별칭으로 바꾸고 출력하기
 
 select eno as 사원번호 , ename 사원명, salary as 월급 ,salary *12 as 연봉 
 from employee ; 
 
 -- employee 테이블의 각컬럼의 의미  . 
 
 select * 
 from employee ; 
 
 select eno 사원번호,ename 사원명,job 직책,manager 직속상관,
 hiredate 입사날짜,salary 월급,commission 보너스,dno 부서번호 
 from employee ;
 
 -- 테이블 구조를 확인하기 , desc 테이블명 ,실제 컬럼명 ,null 허용여부 ,자료형 (number  : 정수 ,실수  char ,varohar2 : 무자명 ) 
 
 desc employee ; --insert 시 컬럼의 자료형, Null 허용여부를 확인후 값을 넣음 , 
 
 select*from employee ; 
 
 -- 연봉을 계산 :주의  :  NULL 과의 연산은 결과가 NULL
   --null 컬럼과 연산을 하면 모두 null
   
   -- null 처리가 안됨 
   
 select eno 사원번호,ename 사원명 ,salary 월급,commission 보너스,  -- 원본테이블 출력
       salary * 12 + commission 연봉
 from employee;
 
 -- nvl (컬럼명,0 ) ; null 을 처리하는 함수 , 컬럼에 값중 null 을 0으로 변환하는 함수  
 
  select eno 사원번호,ename 사원명 ,salary 월급,commission 보너스,  -- 원본테이블 출력
      nvl(commission,0) 널처리됨 ,salary * 12 +nvl(commission,0) 연봉
 from employee;
 
 -- 컬럼과 컬럼을 연산할수 있다  : + , - ,* ,/ < == number ( 정수 ,실수 )  타입 
 -- number : 정수를 여는거
 -- numbe(7,2)  : 실수 를넣는것, 전체 7자리 ,소숫점 이하 2자리  
 
 select * from employee; 
 desc employee; 
 
 select ename , salary ,salary+salary as "+연산"  , salary*salary as "*연산"  , salary*0.1 as "월급의10%"
 from employee ;
 
 -- 중복 처리후 출력 : distinct 컬럼명 
 
 select * from employee ;
 
 -- 우리 회사의 부서만 출력
 
 select distinct dno 
 from employee ;
 
 -- 우리회사의 직책만 중복 제거후 출력 (CLERK : 사무원 , SALESMAN : 영업사원 , MANAGER : 관리자 , ANNALYSET ; 분석가 
  -- PRESIDENT : 사장님  ) 
  -- 대소문자를 구분 하지않음  : 쿼리 (select , create, from , group by, oder by ) 컬럼명 , 테이블명 , 
  -- 테이블 안에 레코드 의 값은 대소문자를 구분함 .
  
  
select distinct job
FROM employee;
 
 select * from employee;
 -- job (직책 )이 MANAGER  (관리자 ) 인 사용자 정보만 출력 

select ename AS "사원명", job AS "직책"
from employee
where job = 'MANAGER';
 
 -- 부서 테이블확인
 select * from department ;
 select dno 부서번호, dname 부서명, loc 부서위치
 from department ;
 
 -- salgreade : 연봉의 순위를 적용하는 테이블 <== JOIN 
 select * from salgrade ;
 select grade 연봉의등급 , losal 제일낮은연봉, hisal 높은연봉
 from salgrade ;
 

 -- SELECT 문의 전체내용
 /*
 SELECT 컬럼명 
 FROM 테이블명 [ 뷰명 ]
 WHERE 조건
 GROOP BY 컬럼명 < == 컬럼에 동일한 값을 그룹핑에서 처리함
 HAVIG 조건   <== GROUP BY 결과에 대한 조건
 ODER BY 컬럼명 ASC[DESC] <== 컬럼을 정렬해서 출력 ,ASC :내림차순정렬 ,DESC :오름차순 정렬 
 */
 
 -- where 조건 사용하기 :비교연산자 (NUMBER 타입의 컬럼에서 사용 ) ; = 같다 ,  >, < ,>= ,  <=
 -- 같지않다 : <>  , != , ^= 
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
 
 -- or 연산자 
 
  select *
 from employee
 where salary = 1500 or salary = 800 or salary = 1600 ;
 
 -- in 키워드 : in  ( 값 ,값, 값  )
 
  select *
 from employee
 where salary in [1500,800,1600];
 
 -- and 연산자 사용 :부서 번호가 10번인 사원의 연봉이 1500이상인 사용자를 출력
 
   select *
 from employee
 where dno = 10 and salary > 1500; 
 
 -- 직책이 manager 이면서 월급이 2000이상인 사원의 사원번호 ,사원명 ,월급을 출력
 
 select eno 사원번호 , ename 사원명 ,salary 월급 , job 직책
 from employee
 where job = 'MANAGER' and salary>=2000 ;
 
 -- 비교 연산자를 date varchar ,char : 81년도 입사한 사원의 모두출력
 
 select *
 from employee
 where hiredate > '81/01/01' and hiredate < '81/02/28' ; 
 
 -- 문자열  : char , varchar , nvarchar ,nchar  : 문자열 ,  ''
  
 select *
 from employee
 where ename > 'D' ;
 
 -- like : 문자열에서 특정 값만 검색  : %  :모든것이 와도 상관없다 . _ :한글자가 어떤것이 와도 상관이 없다 .
 -- 컬럼의 특정 값을 검색시 사용됨 .
 
 select * from employee
 where ename like '%LA%' ;
 
 select * from employee
 where ename like '_CO%' ;
 
 -- null 검색  :is null ,is not null 
 
 select * from employee ; 
 
 -- comission 컬럼의 값이 null 인 사용자만 출력   :보너스가 없는 사원
  select *from employee 
 where commission is null;
 
 -- comission 컬럼의 값이 null 이 아닌 사용자만 출력   :보너스가 있는 사원
 select *from employee 
 where commission is not null;
 
 -- cout ()  : 레코드의 갯수를 출력  : 페이징처리  <==
 -- null 큰카운트로 하지않는다
 
 select count (*) 총레코드수
 from employee ;
 
 select count (ename)
 from employee;
 
 select count (commission) --레코드 수 :null 컬럼은 출력 하지 않는다 .
 from employee ;
 
 select commission 수능점수 -- null  : 비어있는 상태 . 0점 
 from employee ;
 
 desc employee; 
 
 -- 테이블의 전체 레코드를 정확하게 출력:not null 컬럼을 count(컬럼명) ,count(*)
  -- 정렬문 정렬해서 출력 : order by 퀄럼명 asc(desc)
  -- asc : 오름 차수 정렬  :A == >  2.   가==>하 
 -- desc : 내림차순 정렬  : 2 ==> A  
 
 -- 월급을 오름차순 정렬 
 
 select*
 from employee
 order by salary asc ;
 
 -- 월급을 내림차순 정렬 
 
  select*
 from employee
 order by salary desc ;
 
 -- 이름을 컬럼을 오름차순 정렬 
 
 select *
 from employee
 order by ename ;
 
 --직책 ( job )  컬럼 을 내림차순정렬
 select *
 from employee
 order by job desc  ;
 
 select *
 from employee
 where salary > 1500;
 
 from employee
 where salary > 1500 
 order by salary desc;
 
 -- oder by 에서 여러 컬럼을 정렬 할때 앞의 컬럼을 모두 정렬하고 같은값이 존재할때 같은 값에 대해서 
 -- 답변된 
 
 select dno,ename
 from employee
 order by dno asc,ename desc ;
 
 --job 컬럼을 오름차순으로 정렬 , dno 컬럼은 job의 동일한 값에 대해서 dno를 오름차순 ,
 -- ename :dno에서 동일한 값에 대해서 ename을오름차순정렬
 
 select job,dno,ename
 from employee
 order by job asc,dno asc,ename asc;
 
 select dno, job, ename
 from employee
 order by dno desc,job asc,ename desc ;
 
 
 
 
 
 