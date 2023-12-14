select *from employee

-- 모든 평균은 소숫점 2자리까지 출력하되 반올림 해서 출력 하시오.  

-- 1.  10 번 부서를 제외하고 각 부서별 월급의 합계와 평균과 최대값, 최소값을 구하시오. 부서번호를 오름차순 정렬 하세요.  

SELECT dno AS "부서번호", SUM(salary) AS "합계",
  ROUND(AVG(salary)) AS "평균", MAX(salary) AS "최대값", MIN(salary) AS "최소값"
FROM EMPLOYEE
WHERE dno != 10
GROUP BY dno
ORDER BY dno ASC;

-- 2.  직책의 SALSMAN, PRESIDENT, CLERK 을 제외한 각 부서별 월급의 합계와 평균과 최대값, 최소값을 구하시오.   	

SELECT JOB , SUM(salary) AS "합계", MAX(salary) AS "최대값", MIN(salary) AS "최소값"
FROM EMPLOYEE
WHERE JOB NOT IN ('SALESMAN', 'PRESIDENT', 'CLERK') 
GROUP BY JOB;

-- 3. SMITH 과 동일한 부서에 근무하는 사원들 의 월급의 합계와 평균과 최대값, 최소값을 구하시오. 

SELECT DNO,SUM(SALARY) ,ROUND(AVG(SALARY)),MAX(SALARY),MIN(SALARY)
FROM EMPLOYEE
WHERE DNO=(SELECT DNO FROM EMPLOYEE WHERE ENAME='SMITH' )
GROUP BY DNO;

-- 4. group by - 부서별 최소월급을 가져오되 최소월급이 1000 이상인 것만 출력하세요. 

SELECT JOB, MIN(SALARY)
FROM EMPLOYEE
WHERE SALARY > 1000
GROUP BY JOB;

-- 5. group by - 부서별 월급의 합계가 9000 이상것만 출력

SELECT JOB, SUM(SALARY) 
FROM EMPLOYEE
GROUP BY JOB
HAVING SUM(SALARY)>=9000;

-- 6. group by - 부서별 월급의 평균이 2000 이상만 출력 하되 부서번호를  오름차순으로 출력

SELECT JOB, SUM(SALARY) AS "합계"
FROM EMPLOYEE
GROUP BY JOB
HAVING SUM(SALARY) >= 2000
ORDER BY JOB ASC; 

-- 7. group by - 월급이 1500 이하는 제외하고 각 부서별로 월급의 평균을 구하되 월급의 평균이 2500이상인 것만 출력 하라. 

SELECT JOB, SUM(SALARY)
FROM EMPLOYEE
GROUP BY JOB
HAVING MIN(SALARY) > 1500 AND SUM(SALARY) >= 2500;

-- 8. sub query - 부서별로 최소 급여를 받는 사용자의 이름과 급여와 직책과 부서번호를 출력하세요. 

select  ename ,salary, dno
from employee
order by dno asc , salary desc ; 

-- 9. sub query - 전체 평균 급여보다 많이 받는 사용자의  이름과 급여와 직책과 부서번호를 출력하세요. 

SELECT ENAME, SALARY, JOB, DNO
FROM EMPLOYEE
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE);

-- 10. sub query - 급여가 평균 급여보다 많은 사원들의 사원번호와 이름을 표시하되 결과를 급여에 대해 오름차순 정렬하시오.

SELECT ENAME, SALARY, MANAGER
FROM EMPLOYEE
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE)
ORDER BY SALARY ASC;


