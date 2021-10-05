Subqueries Questions:
Q1.Display all the employees whose department names ending with 's'?
SQL> SELECT * FROM EMP WHERE DEPTNO IN
  2  (SELECT DEPTNO FROM DEPT WHERE DNAME LIKE '%S');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30

6 rows selected.

Q2.Write a query to display the employee names who is having maximum salary in dept name "Accounting"?
SQL> (SELECT MAX(SAL) FROM EMP WHERE DEPTNO IN
  2  (SELECT DEPTNO FROM DEPT WHERE DNAME='ACCOUNTING'));

  MAX(SAL)
----------
      5000

Q3.Write a query to display the dept name who is having highest commission?
SQL> SELECT DNAME FROM DEPT WHERE DEPTNO=
  2  (SELECT DEPTNO FROM EMP WHERE COMM=
  3  (SELECT MAX(COMM) FROM EMP));

DNAME
--------------
SALES

Q4.Write a query to display the employee names whose department name has second character as 'o'?
SQL> SELECT * FROM EMP WHERE DEPTNO=
  2  (SELECT DEPTNO FROM DEPT WHERE SUBSTR(DNAME,2)='O');

no rows selected

Q5.Query to display all the employees whose deptno is same as 'scott'?
SQL> SELECT ENAME FROM EMP WHERE DEPTNO IN
  2  (SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT');

ENAME
----------
FORD
ADAMS
SCOTT
JONES
SMITH

Q6.Query to display all the employees in operations and Accountind dept?
SQL> SELECT ENAME FROM EMP WHERE DEPTNO IN
  2  (SELECT DEPTNO FROM DEPT WHERE DNAME IN('ACCOUNTING','OPERATION'));

ENAME
----------
CLARK
KING
MILLER

Q7.List all the employees who has salary greater than Miller?
SQL>  SELECT ENAME FROM EMP WHERE SAL>
  2  (SELECT SAL FROM EMP WHERE ENAME='MILLER');

ENAME
----------
ALLEN
JONES
BLAKE
CLARK
SCOTT
KING
TURNER
FORD

8 rows selected.

Q8.Query to display all the employees whose job not same as ALLEN and salary greater than Martin?
SQL>  SELECT ENAME,JOB FROM EMP WHERE JOB<>
  2   (SELECT JOB FROM EMP WHERE ENAME='ALLEN') AND SAL>
  3   (SELECT SAL FROM EMP WHERE ENAME='MARTIN');

ENAME      JOB
---------- ---------
JONES      MANAGER
BLAKE      MANAGER
CLARK      MANAGER
SCOTT      ANALYST
KING       PRESIDENT
FORD       ANALYST
MILLER     CLERK

7 rows selected.

Q9.Display all the employees who is having location is same as ADAM'S Manager?
SQL> SELECT * FROM EMP WHERE DEPTNO=
  2  (SELECT DEPTNO FROM DEPT WHERE LOC=
  3  (SELECT LOC FROM DEPT WHERE DEPTNO=
  4  (SELECT DEPTNO FROM EMP WHERE EMPNO=
  5  (SELECT MGR FROM EMP WHERE ENAME='ADAMS'))));

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20

Q10.Display the job,Manager number of employees who is working for Jones?
SQL> SELECT JOB FROM EMP WHERE MGR=
  2  (SELECT EMPNO FROM EMP WHERE ENAME='JONES');

JOB
---------
ANALYST
ANALYST

Q11.Display employee details who are reporting to Blake and have commission without using null or not null?
SQL> SELECT * FROM EMP WHERE MGR=
  2  (SELECT EMPNO FROM EMP WHERE ENAME='BLAKE') AND COMM>0;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30

Q12.Display all the employee whose department is sales and who is earning some commission(i.e.comm is not null or zero) and 
who is hired before the last person?
SQL> SELECT * FROM EMP WHERE COMM IS NOT NULL AND HIREDATE<
  2  (SELECT MAX(HIREDATE) FROM EMP) AND DEPTNO IN
  3  (SELECT DEPTNO FROM DEPT WHERE DNAME='SALES');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30

Q13.Display departnames of employees whose salary is greater than average salary of all the Clerks?
SQL> SELECT DNAME FROM DEPT WHERE DEPTNO IN
  2  (SELECT DEPTNO FROM EMP WHERE SAL IN
  3  (SELECT SAL FROM EMP WHERE SAL>
  4  (SELECT AVG(SAL) FROM EMP WHERE JOB='CLERK')));

DNAME
--------------
SALES
RESEARCH
ACCOUNTING

Q14.Display employee names who is having minimum salary in department research?
SQL> SELECT ENAME,SAL FROM EMP WHERE SAL IN
  2  (SELECT MIN(SAL) FROM EMP WHERE DEPTNO IN
  3  (SELECT DEPTNO FROM DEPT WHERE DNAME='RESEARCH'));

ENAME             SAL
---------- ----------
SMITH             800

Q15.Write a wuery to display employee name,job,location of all the employees who are working as a 
manager and works at Chicago?
SQL>  SELECT ENAME,JOB FROM EMP WHERE JOB='MANAGER' AND DEPTNO IN
  2  (SELECT DEPTNO FROM DEPT WHERE LOC='CHICAGO');

ENAME      JOB
---------- ---------
BLAKE      MANAGER

Q16.Display the employee number and name of employee woeking as a clerk and earning highest salary among clerk?
SQL> SELECT EMPNO,ENAME FROM EMP WHERE JOB='CLERK' AND SAL=
  2  (SELECT MAX(SAL) FROM EMP WHERE JOB='CLERK');

     EMPNO ENAME
---------- ----------
      7934 MILLER

Q17.Display the employee dept name and loc of all the employees who are clerk reporting to blake and salary 
is less than Martin salary?
SQL> SELECT DNAME,LOC FROM DEPT WHERE DEPTNO IN
  2  (SELECT DEPTNO FROM EMP WHERE JOB='CLERK' AND SAL<
  3  (SELECT SAL FROM EMP WHERE ENAME='MARTIN') AND MGR=
  4  (SELECT EMPNO FROM EMP WHERE ENAME='BLAKE'));

DNAME          LOC
-------------- -------------
SALES          CHICAGO

Q18.Display number of employees whose commission is more than salary?
SQL> SELECT COUNT(ENAME) FROM EMP WHERE COMM>SAL;

COUNT(ENAME)
------------
           1

Q19.Display number of employees who are earning the commission?
SQL> Select count(ename) from emp where comm is not null;

COUNT(ENAME)
------------
           4

Q20.Display all employees who are joined before last person?
SQL> SELECT * FROM EMP WHERE HIREDATE<
  2  (SELECT MAX(HIREDATE) FROM EMP);

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

13 rows selected.

Q21.Display all employees who are earning more than any of the manager?
SQL> SELECT * FROM EMP WHERE SAL>(SELECT MIN(SAL) FROM EMP WHERE JOB='MANAGER');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20

Q22.List employees who joined after a years of first employee of company and sal less than Blake salary?
SQL> SELECT * FROM EMP WHERE HIREDATE>
  2  (SELECT MIN(HIREDATE)+(365*3+366) FROM EMP) AND SAL>
  3  (SELECT SAL FROM EMP WHERE ENAME='BLAKE');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20

Q23.Display all the employees whose dept is sales and earning some commission and hiredate is before last person?
SQL> SELECT *FROM EMP WHERE DEPTNO IN
  2  (SELECT DEPTNO FROM DEPT WHERE DNAME='SALES') AND COMM IS NOT NULL AND HIREDATE<
  3  (SELECT MAX(HIREDATE) FROM EMP);

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30

Q24.Display all the department names for Ward's manager?
SQL> SELECT DNAME FROM DEPT WHERE DEPTNO =
  2  (SELECT DEPTNO FROM EMP WHERE EMPNO=
  3  (SELECT MGR FROM EMP WHERE EMPNO=
  4  (SELECT MGR FROM EMP WHERE ENAME='WARD')));

DNAME
--------------
ACCOUNTING

Q25.Display department name of employee whose earn minimum salary and have reporting to manager?
SQL> SELECT DNAME FROM DEPT WHERE DEPTNO IN
  2  (SELECT DEPTNO FROM EMP WHERE MGR IS NOT NULL AND SAL=
  3  (SELECT MIN(SAL) FROM EMP));

DNAME
--------------
RESEARCH

Q26.Display the last employee record according to EMPNO?
SQL> SELECT * FROM EMP WHERE EMPNO=
  2   (SELECT MAX(EMPNO) FROM EMP);

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

Q27.Select ename of employee who earns second max salary and works for location 'DALLAS'?
SQL> SELECT ENAME FROM EMP WHERE SAL=
  2  ((SELECT MAX(SAL) FROM EMP)-(SELECT MIN(NULLIF(((SELECT MAX(SAL) FROM EMP)-SAL)
  3  ,0)) FROM EMP));

ENAME
----------
SCOTT
FORD

Q28.LIst employees who have commission greater than maximum salary of all the salesman and
do not report to king?
SQL> SELECT * FROM EMP WHERE COMM>
  2  (SELECT MAX(SAL) FROM EMP WHERE JOB='SALESMAN' AND MGR!=
  3  (SELECT EMPNO FROM EMP WHERE ENAME='KING'));

no rows selected

