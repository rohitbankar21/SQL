Operators.
EMPLOYEE TABLE:
SQL> select * from emp1;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM        DNO
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
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

14 rows selected.
Q1. Increment the salary of all empoloyees by Rs.100?
SQL> SELECT ENAME,SAL "OLD_SAL",SAL+100 "INC_SAL" FROM EMP1;

ENAME         OLD_SAL    INC_SAL
---------- ---------- ----------
SMITH             800        900
ALLEN            1600       1700
WARD             1250       1350
JONES            2975       3075
MARTIN           1250       1350
BLAKE            2850       2950
CLARK            2450       2550
SCOTT            3000       3100
KING             5000       5100
TURNER           1500       1600
ADAMS            1100       1200
JAMES             950       1050
FORD             3000       3100
MILLER           1300       1400

14 rows selected.

Q2.Decrement the salary of all employees by Rs.100?
SQL> SELECT ENAME,SAL "OLD_SAL",SAL-100 "DEC_SAL" FROM EMP1;

ENAME         OLD_SAL    DEC_SAL
---------- ---------- ----------
SMITH             800        700
ALLEN            1600       1500
WARD             1250       1150
JONES            2975       2875
MARTIN           1250       1150
BLAKE            2850       2750
CLARK            2450       2350
SCOTT            3000       2900
KING             5000       4900
TURNER           1500       1400
ADAMS            1100       1000
JAMES             950        850
FORD             3000       2900
MILLER           1300       1200

14 rows selected.

Q3.Display the annual salary of all employees?
SQL> Select ename,sal "monthly_sal",sal*12 "annual_sal" from emp1;

ENAME      monthly_sal annual_sal
---------- ----------- ----------
SMITH              800       9600
ALLEN             1600      19200
WARD              1250      15000
JONES             2975      35700
MARTIN            1250      15000
BLAKE             2850      34200
CLARK             2450      29400
SCOTT             3000      36000
KING              5000      60000
TURNER            1500      18000
ADAMS             1100      13200
JAMES              950      11400
FORD              3000      36000
MILLER            1300      15600

14 rows selected.

Q4.Display the quarter salary of all employees?
SQL> SELECT ENAME,SAL,SAL*(12/3) FROM EMP1;

ENAME             SAL SAL*(12/3)
---------- ---------- ----------
SMITH             800       3200
ALLEN            1600       6400
WARD             1250       5000
JONES            2975      11900
MARTIN           1250       5000
BLAKE            2850      11400
CLARK            2450       9800
SCOTT            3000      12000
KING             5000      20000
TURNER           1500       6000
ADAMS            1100       4400
JAMES             950       3800
FORD             3000      12000
MILLER           1300       5200

14 rows selected.

Q5.Dsiplay the employees who earn greater than 1250?
SQL> SELECT * FROM EMP1 WHERE SAL>1250;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM        DNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

9 rows selected.

Q6.Display the employees who earn less than 3000?
SQL> SELECT * FROM EMP1 WHERE SAL<3000;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM        DNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

11 rows selected.

Q7.Display the employees who are hired after year 81 and before 87?
SQL> SELECT * FROM EMP1 WHERE HIREDATE>'31-DEC-81' AND HIREDATE<'18-JAN-87';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM        DNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

Q8.Display the employees who are not earning the commission?
SQL> SELECT * FROM EMP WHERE COMM IS NULL;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

10 rows selected.

Q9.Dsiplay the employees who earning some commission?
SQL> SELECT * FROM EMP WHERE COMM IS NOT NULL;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30

Q10.Display the names whose names between 'ADAMS' and 'SMITH'?

SQL> SELECT * FROM EMP WHERE ENAME BETWEEN 'ADAMS' AND 'SMITH';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

12 rows selected.

Q11.List all the employees who don't have reporting manager?
SQL> SELECT ENAME FROM EMP WHERE MGR IS NULL;

ENAME
----------
KING

Q12.List all the salesman in deptno 30 and having salary>1500?
SQL> SELECT * FROM EMP WHERE DEPTNO=30 AND JOB='SALESMAN' AND SAL>1500;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30

Q13.List all the employees whose name starts with 'A' or 'S'?
SQL> SELECT * FROM EMP  WHERE ENAME LIKE 'A%' OR ENAME LIKE 'S%';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20

Q14.List all the employees except those who are working in dept 10 and 20?
SQL> SELECT * FROM EMP WHERE DEPTNO NOT IN(10,20);

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30

6 rows selected.

Q15.List all the employees whose name doesn't start with S?
SQL> SELECT * FROM EMP WHERE ENAME NOT LIKE 'S%';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

12 rows selected.

Q16.List all the employees whose commission is null and working as a clerk?
SQL> SELECT * FROM EMP WHERE COMM IS NULL AND JOB='CLERK';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

Q17.List all the analyst in dept no 20 and having sal>2500?
SQL> SELECT * FROM EMP WHERE JOB='ANALYST' AND DEPTNO=20 AND SAL>2500;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20

Q18.List all the employees with there annual salary except those who are working in dept 30?
SQL> SELECT ENAME,SAL*12 "ANN_SAL" FROM EMP WHERE DEPTNO NOT IN 30;

ENAME         ANN_SAL
---------- ----------
SMITH            9600
JONES           35700
CLARK           29400
SCOTT           36000
KING            60000
ADAMS           13200
FORD            36000
MILLER          15600

8 rows selected.

Q19.Display the employee name with 10% hike in there salary?
SQL> SELECT ENAME,SAL AS "OLD_SAL",SAL+(SAL*0.1) AS "NEW_SAL" FROM EMP;

ENAME         OLD_SAL    NEW_SAL
---------- ---------- ----------
SMITH             800        880
ALLEN            1600       1760
WARD             1250       1375
JONES            2975     3272.5
MARTIN           1250       1375
BLAKE            2850       3135
CLARK            2450       2695
SCOTT            3000       3300
KING             5000       5500
TURNER           1500       1650
ADAMS            1100       1210
JAMES             950       1045
FORD             3000       3300
MILLER           1300       1430

14 rows selected.

Q20.List all the salesman who are having E as a second last charactor but salary having exactly 4 charactor?
SQL> SELECT* FROM EMP WHERE JOB='SALESMAN' AND ENAME LIKE'E%_' AND SAL LIKE'____';

no rows selected

Q21.Display all employees who are joined after 81?
SQL> SELECT * FROM EMP WHERE HIREDATE>'31-DEC-80';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

13 rows selected.

Q22.Display all the employees who are joined in feb?
SQL> SELECT * FROM EMP WHERE HIREDATE LIKE '%FEB%';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30

Q23.List all the employees who are not working as manager and clerk in dept 10 amd 20 with sal in range of 1000 and 3000?
SQL> SELECT * FROM EMP WHERE JOB NOT IN('MANAGER','CLERK') AND SAL BETWEEN 1000 AND 3000
  2  AND DEPTNO NOT LIKE '30';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20

Q24.List all the employees whose job has string man in it?
SQL> SELECT * FROM EMP WHERE JOB LIKE '%MAN%';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30

7 rows selected.

Q25.Display the employees who are hired in NOV and DEC?
SQL> Select * from emp where hiredate like '%NOV%' OR HIREDATE LIKE '%DEC%';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20

Q26.List all the employees with there commission who earns commission more than there salary?
SQL> SELECT * FROM EMP WHERE COMM>SAL;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30

	