/*  그룹 함수 : group by, having 
 select 컬럼명 
 from 테이블[뷰]
 where 조건 
 group by 컬럼명[동일한값을그룹핑]
 having 조건 [group by 한 결과 값의 조건] 
 order by 컬럼명 asc[desc] 
*/ 
/* 집계 함수 : number 타입의 컬럼에 적용   <=== NULL 을 자동으로 처리됨...
    SUM  - 컬럼의 모든 값의 합
    AVG - 컬럼의 모든 값의 합
    MAX - 컬럼의 최대값
    MIN - 컬럼의 최소값
    COUNT (*) - 그룹핑 된 레코드 수 출력 . 
    주의 :  단일 행으로 출력이 되기 때문에 다른 컬럼과 사용시 오류. 
             단 . group by 절에 grouping 된 컬럼은 출력 가능 
*/ 


/*  그룹 함수 : group by, having 
 
 select 컬럼명 
 from 테이블[뷰]
 where 조건 
 group by 컬럼명[동일한값을그룹핑]
 having 조건 [group by 한 결과 값의 조건] 
 order by 컬럼명 asc[desc] 

*/ 

/* 집계 함수 : number 타입의 컬럼에 적용   <=== NULL 을 자동으로 처리됨...
    SUM  - 컬럼의 모든 값의 합
    AVG - 컬럼의 모든 값의 합
    MAX - 컬럼의 최대값
    MIN - 컬럼의 최소값
    COUNT (*) - 그룹핑 된 레코드 수 출력 . 
    
    주의 :  단일 행으로 출력이 되기 때문에 다른 컬럼과 사용시 오류. 
             단 . group by 절에 grouping 된 컬럼은 출력 가능 
    
*/ 
desc employee; 

-- 컬럼에 함수 사용 : 
-- 월급 (salary)
select SUM(salary) 합계 ,  Round (AVG(salary), 2) 평균,  MAX(salary) 최대값, Min (salary ) 최소값 , count(*) 계산된레코드수
from employee; 

-- 집계 함수는 NULL을 자동으로 처리함. 
select commission
from employee; 

-- 보너스 (commission)  <== null은 자동으로 처리됨 
select SUM(commission) 합계 ,  Round (AVG(commission), 2) 평균,  MAX(commission) 최대값, 
            Min (commission ) 최소값 , count(*) 계산된레코드수
from employee; 

-- 부서별로 월급의 합계, 평균, 최대월급 , 최소 월급, 그룹핑된 수를 출력 

select  dno 부서번호, SUM(salary) 합계, Round ( AVG(salary) ) 평균, 
            MAX(salary) 최대값, MIN(salary) 최소값, COUNT(*) 그룹핑된수
from employee
group by dno ;           -- DNO 컬럼의 동일한 값을 그룹핑해서 집계함수를 적용함. 

select salary, dno 
from employee
order by dno asc; 

-- 직책(job) 별로 월급의 합계, 평균, 최대값, 최소값, 그룹핑된수를 출력 해 보세요.
select  ename, job, salary 
from employee
order by job ; 

select  job 직책 , count(*) 그룹핑된갯수 , SUM (salary ) 합계,
             round(AVG(salary),2) 평균 , MAX(salary) 최대값, MIN(salary) 최소값
from employee
group by job;                 -- job 컬럼의 동일한 값을 그룹핑 

select count(*) 전체레코드수  from employee; 

/*
   group by  절에서 where [조건] vs having [조건] 
        where [조건] : group by 하기전에 조건을 가져옴.         , 별칭이름을 사용할 수 없다. 
        having [조건] : group by 해서 나온 결과에 대한 조건   , 별칭이름을 사용할 수 없다. 
        
        oder by 컬럼명 asc[desc]    :   별칭이름을 사용가능 

*/ 

-- 직급별로 월급의 합계, 평균, 최대값, 최소값, 그룹핑된수를 출력하되, 부서번호 20은 제외하고, 부서별로 평균이 2000이상인 내용만 출력 
        -- 평균을 desc 출력

select * from employee 
order by dno asc; 

select job 직급, count(job) , SUM(salary) 월의합계, Round (AVG(salary)) 평균, 
             MAX(salary) 최대값, MIN(salary) 최소값      
from employee 
where dno != 20        -- group by 전의 조건 
group by job 
having Round (AVG(salary)) >= 2000
order by 평균 desc; 


-- group by 절에서 컬럼이 2개 이상 ,   두 컬럼에 걸쳐서 동일한 내용을 그룹핑함. 
      -- job , dno 

select job , dno from employee
order by job asc ; 

select dno, job, sum (salary) 합한값, count(*)
from employee
group by job, dno 

-- 각 직책(job) 에 대해서 월급의 합계, 평균, 최대값, 최소값, 카운트수를 출력하되 입사일이 81년도 입사한 사원들만 적용
-- 월급의 평균이 1500만원 이상인 것만 출력 하되 평균을 내림차순 정렬 
select job 직책,  count(*) , sum(salary) 합계, round(avg(salary)) 평균, max(salary) 최대값, 
            min(salary) 최소값
from employee
where hiredate like '81%'
group by job
having round(avg(salary)) >= 1500
order by 평균 desc; 

/*   group by 절에서 사용되는 키워드 
        rollup  : grouy by 커럼   <== 결과 마지막 라인에 전체 결과도 한번더 출력 
        cube     :  그룹핑 마지막 라인에 결과 출력, 마지막 라인에 전체 결과도 세부적으로 출력 
*/ 

-- 1. rollup , cube 키워드를 사용하지 않는 경우  :  그룹핑한 결과만 출력
    select dno, job , count(*), SUM(salary), round(avg(salary),2) , max(salary), min(salary) 
    from employee
    group by dno, job 
    order by count(*) desc ; 
    
    select dno , job
    from employee
    order by job asc

-- 2. rollup  키워드를 사용하는 경우 : 그룹핑한 결과 출력, 전체 내용도 출력 
    select dno, job , count(*), SUM(salary), round(avg(salary),2) , max(salary), min(salary) 
    from employee
    group by rollup ( dno, job )
    order by count(*) desc ; 

-- 3. cube  키워드를 사용하는 경우 : 그룹핑한 결과 출력, 전체 내용도 출력, 세부 사항까지 출력 
    select dno, job , count(*), SUM(salary), round(avg(salary),2) , max(salary), min(salary) 
    from employee
    group by cube ( dno, job )
    order by count(*) desc ; 


/*
    SubQuery : select 문내의 select 쿼리 [ sub query ] , 여러번의 작업을 한 구문에서 처리 
            - where 절에서 많이 사용됨 
*/ 

-- ename [사원이름]  이 SCOTT인 사원의 직책과 같은 사원들을 출력  : 2 번 쿼리가 필요함. 

-- 1. SCOTT 사원의 직책을 알아오는 쿼리 
    select job, ename 
    from employee 
    where ename = 'SCOTT' 
    
-- 2. 알아온 직책을 조건으로 해서 이름을 출력 
select ename , job 
from employee
where job = 'ANALYST' ; 


-- SubQuery를 사용해서 하나의 쿼리로 처리함. 

select ename, job
from employee
where job = ( select job from employee where ename= 'ALLEN' ); 

select * from employee ; 


-- SCOTT과 ALLEN 의 직책에 해당되지 않는 사원들을 모두 출력 

    -- 1. scott의 직책을 출력하는 쿼리 
    -- 2. allen의 직책을 출력하는 쿼리 
    -- 3. where job not in ('scott의직책', 'allen 직책')

    -- 1. scott의 직책을 출력하는 쿼리
    select job from employee where ename = 'SCOTT';     -- ANALYST

    -- 2. allen의 직책을 출력하는 쿼리
    select job from employee where ename = 'ALLEN';      -- SALESMAN 
    
    --3. SCOTT과 ALLEN 의 직책에 해당되지 않는 사원들을 모두 출력 
    select ename , job 
    from employee
    where job not in ( 'ANALYST', 'SALESMAN'); 
    
    ---  SubQuery로 한 라인으로 출력 
    
    select ename , job 
    from employee
    where job not in ( 
        (select job from employee where ename = 'SCOTT'), 
        (select job from employee where ename = 'ALLEN')
        ); 
    
    select ename , job 
    from employee
    where job not in ( 
            select job from employee 
            where ename = 'SCOTT' or ename = 'ALLEN'     
        ); 
        
    select ename , job 
    from employee
    where job not in ( 
            select job from employee 
            where ename in ( 'SCOTT' , 'ALLEN' )     
        ); 

-- 단일 값       :    = 
-- 여러개의 값 :   in 
  
-- 'SCOTT' 보다 않은 월급을 받는 사원들 정보, 월급를 출력   

  select ename 사원, salary 월급 
  from employee
  where salary > ( select salary from employee where ename = 'SCOTT')
  
  
  select * from employee
  order by salary desc ; 
  
-- 최소 급여를 받는 사원정의 이름, 담당업무, 급여 출력 
select ename, job, salary 
from employee 
where salary = ( select MIN(salary) from employee ); 

-- subquery를 사용해서 출력 
-- 부서별(dno) 로 최소 급여를 받는 사원정보의 이름, 직책, 월급 을 출력   :    힌트 : group by , dno , min  , in 키워드 

select salary, dno , ename
from employee
order by dno asc , salary desc ; 

-- subquery
select ename 이름, job 직책, salary 월급 , dno 부서번호
from employee 
where salary in ( 
        -- 각 부서별 최소월급의 select 한 값을 출력 
        select min(salary) 
        from employee 
        group by dno  
    ); 

-- subquery 
-- 각 부서의 최소 급여가 30번 부서의 최소 급여보다 큰부서를 출력 .
select dno ,count(*) , min(salary) 부서별최소월급
from employee
group by dno               -- 부서번호 동일한 값을 그룹핑 
having min(salary) > (
            -- 서브쿼리 : 30 번부서의 최소 월급 
            select min(salary) from employee
            where dno = 30
            
           ); 
    
desc employee; 

-- 컬럼에 함수 사용 : 
-- 월급 (salary)

select SUM(salary) 합계 ,  Round (AVG(salary), 2) 평균,  MAX(salary) 최대값, Min (salary ) 최소값 , count(*) 계산된레코드수
from employee; 

-- 집계 함수는 NULL을 자동으로 처리함. 

select commission
from employee; 

-- 보너스 (commission)  <== null은 자동으로 처리됨 
select SUM(commission) 합계 ,  Round (AVG(commission), 2) 평균,  MAX(commission) 최대값, 
            Min (commission ) 최소값 , count(*) 계산된레코드수
from employee; 

-- 부서별로 월급의 합계, 평균, 최대월급 , 최소 월급, 그룹핑된 수를 출력 

select  dno 부서번호, SUM(salary) 합계, Round ( AVG(salary) ) 평균, 
            MAX(salary) 최대값, MIN(salary) 최소값, COUNT(*) 그룹핑된수
from employee
group by dno ;           -- DNO 컬럼의 동일한 값을 그룹핑해서 집계함수를 적용함. 

select salary, dno 
from employee
order by dno asc; 

-- 직책(job) 별로 월급의 합계, 평균, 최대값, 최소값, 그룹핑된수를 출력 해 보세요.

select  ename, job, salary 
from employee
order by job ; 

select  job 직책 , count(*) 그룹핑된갯수 , SUM (salary ) 합계,
             round(AVG(salary),2) 평균 , MAX(salary) 최대값, MIN(salary) 최소값
from employee
group by job;                 -- job 컬럼의 동일한 값을 그룹핑 

select count(*) 전체레코드수  from employee; 

/*
goup by 집에서 where 조건 
where 조건 
*/
-- 적금별로 월금의 장비,평균,합계,평균최댓삽 최솟값,  그룹핑된 술를 출력하고 부서번호 10은제외하고 부서번호별로 내용만출려
--평균을 desc 출력 

select *from employee
order by dno asc;

select job 직급,count(job),SUM(salary) 월급,ROund (AVG(salary))평균,
MAX(salary) 최대값,MIN(salary)최소값
where dno!=20 
group by job
having round(AVG(salary)) >= 2000
order by 평균 desc;

--group by 절에서 ㅓ컬럼이

select job, dno from employee
order by job asc;

select dno,job,sum (salary)

-- 각직책(job)에 대해서 월급의 합계 ,평균,최댓값,최솟값 ,카운트수를 출력하고 입사일이 81년 도 입사한 사원들만 적용
-- 월급의 평균이 1500만원 이상인 값만 추력 학되 평균을 내림하는정렬

select job,count(*),
SUM(salary),ROUND(AVG(salary)) ,MAX(salary),MIN(SALARY)
from employee
where hiredate like '81%'
group by job having round(avg(salary))>=1500
order by 급여 desc;

 select job, COUNT(*) AS "직무별 사원 수",
 SUM(salary) AS "총 급여",
 ROUND(AVG(salary)) AS "평균 급여",MAX(salary) AS "최대 급여", MIN(salary) AS "최소 급여"
FROM employee
WHERE TO_CHAR(hiredate, 'YYYY') = '1981' -- '81%'를 '1981'로 변경하여 년도로 비교
GROUP BY job HAVING ROUND(AVG(salary)) >= 1500 -- AVG(salary)가 1500 이상인 경우에 대한 조건 추가
ORDER BY "평균 급여" DESC; 

/* group by 절에서 사용되는 키워드
   rollup : group by 컬럼 <== 결과 마지막 라인에 전체결과 를 한번더 출력해 준다 .
   cube  :그룹핑 마지막 라인에 결과출력 ,마지막 라인에 전체 결과도 세부적으로출력
*/
-- 1.rollup .cube 키워드를 사용하지 않는경우 :그룹핑한 결과만 출력

select dno,job,count(*),
SUM(salary),round(avg(salary) ,2),max(salary),min(salary)
from employee 
group by dno,job
order by count(*) desc;

select dno,job
from employee
order by job asc;

-- 2.rollup 키워드를 사용하는경우 :그룹핑한 결과출력 , 전체내용도 출력

select dno,job,count(*),
SUM(salary),round(avg(salary) ,2)ㄴ,max(salary),min(salary)
from employee 
group by rollup (dno,job)
order by count(*) desc;

-- 3.cube : 키워드를 사용하는 경우 : 그룹핑한 결과출력 ,전체 내용도 출력,세부사양까지 출력

select dno,job,count(*),
SUM(salary),round(avg(salary) ,2),max(salary),min(salary)
from employee 
group by cube(dno,job)
order by count(*) desc;

/*
subquery :select 문내에 salact 쿼리 [sub query] ,여러번의 작업을 한구문에서 처리;
 -- where 절에서 많이 사용됨
*/
-- 1. ename 이 scott 인 사원의 직책과사원들을 출력 :2번 커리가 필요함.
-- 2. SCOT 사원의 직책을 알아오는 쿼리

select job enma
from enplpp
where ename = scott

-- 3. 찾아온 직첵을 조건으로해서 ㅁ이름

select job,ename
from employee
where job='ANALYET'

-- subquery 를 사용해서 워리를처리함

select ename ,job
from employee
where job=(select to from employee where ename = 'scott' );

select*from employee;

-- scott 와 allen 의 직책에 해당되지 않는 사원들을 모두출력

-- .sctt 의직책을 출력하는 쿼리

-- 1. scoott 의 직책을 출력하는 쿼리
select job from employee where ename = 'SCOTT' ;

-- 2.allen 의 직책을 출력하는 쿼리
select job from employee where ename = 'ALLEN'

-- 3.SCOOTT 와 ALLEN 의 직책에 해당되지 않는 사원들을 추쳘

select ename , job
from employee
where job not in ('ANALYST','SALESMAN');

-- subquery 로 라인으로 출력

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

-- 단일 값    :   =
-- 여러 개의 값  : I IN
-- 'SCOTT' 보다 많은 월 급을 받는 사원들 정보 , 월급을 출력
  SELECT ENAME 사원 , SALARY 월급
  FROM EMPLOYEE 
  WHERE SALARY > ( SELECT SALARY FROM EMPLOYEE WHERE   ENAME = 'SCOTT'

SELECT *FROM EMPLOYEE
ORDER BY SALARY DESC;
-- 최소 급여를 받는 사원정의 이름 , 담당업무 ,급여출력

SELECT ENMAE, JOB,SALARY
FROM EMPLOYEE
WHERE SALARY=(SELECT MIN(SALLAY)FROM EMMPLOYEE);

--SUBQUERY 를 사용해서 출력
-- 부서별로 최소 급여를 받는 사원정보의 이름,직책,월급을 출력 : 힌트 : GROUP BY ,DNO,MIN,IN 키워드

SELECT SALARY ,DNO,ENAME
FROM EMPLOYEE
ORDER BY DNO ASC, SALARY DESC;

-- SUBQUERY

SELECT ENAME 이름,JOB 직책, SALARY 월급
FROM EMPLOYEE
WHERE SALARY IN ( 

-- 각부서별 최소월급의 SELECT 한값을 출력

FROM EMPLOYEE
GROUP BY DNO )
;

--각 부서별로 최소 급여가 30번 부서의 최소급여 보다 큰부서를 출력

SELECT JOB
FROM EMPLOYEE
WHERE SALARY IN (SELECT MIN(SALARY) FROM EMPLOYEE 
GROUP BY DNO 

SELECT DNO , COUNT(*) ,MIN(SALARY)
FROM EMPLOYEE
GROUP BY DNO 
HAVING MIN (SALARY)> (
-- 30번 부서의 최소월급
SELECET MIN (SALARY)FROM EMPLOYEE
WHERE DNO = 30
);


