SQL> Select * from emp;

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
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

14 rows selected.

Q1.List all the employees whose name having 4 characters?
SQL> Select * from emp where length(ename)=4;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20

Q2.List employees whose job having 4 characters?
SQL> Select * from emp where length(job)=4;

no rows selected

Q3.Find out how many times letter 's' occurs in 'qspiders'?
SQL> Select length('qspiders')-length(replace('qspiders','s')) from dual;

LENGTH('QSPIDERS')-LENGTH(REPLACE('QSPIDERS','S'))
--------------------------------------------------
                                                 2

Q4.List the employees qhose job is having last 3 characters as 'MAN'?
SQL> Select ename,job from emp where substr(job,-3)='MAN';

ENAME      JOB
---------- ---------
ALLEN      SALESMAN
WARD       SALESMAN
MARTIN     SALESMAN
TURNER     SALESMAN

Q5.List all the employees whose job is having first 3 characters as 'MAN'?
SQL> SELECT ENAME,JOB FROM EMP WHERE SUBSTR(JOB,1,3)='MAN';

ENAME      JOB
---------- ---------
JONES      MANAGER
BLAKE      MANAGER
CLARK      MANAGER

Q6.Display all the names whose name having exactly 1 'L'?
This Query solve by 2 method
Follow the steps given below
SQL> SELECT ENAME FROM EMP WHERE LENGTH(ENAME)-LENGTH(REPLACE(ENAME,'L'))=1;

ENAME
----------
BLAKE
CLARK

SQL> SELECT ENAME FROM EMP WHERE INSTR(ENAME,'L')>0 AND INSTR(ENAME,'L',1,2)=0;

ENAME
----------
BLAKE
CLARK

Q7.Display department names which are having letter 'O' in it?
SQL> SELECT DNAME FROM DEPT WHERE INSTR(DNAME,'O')>0;

DNAME
--------------
ACCOUNTING
OPERATIONS

Q8.Display the output as shown below
Scott working as a  clerk earns 3000 in dept 20
SQL> Select concat(concat(concat(concat(concat(concat(ename, ' working as a '), ' Clerk '),' earns '
), SAL),
  2   ' in dept '), deptno) from emp where ename='SCOTT';

CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(ENAME,'WORKINGASA'),'CLERK'),'EARNS'),SAL),'INDEPT'),DEPTN
----------------------------------------------------------------------------------------------------
SCOTT working as a  Clerk  earns 3000 in dept 20

Q9.Calculate number of L in string 'HELLLLL'?
SQL> SELECT LENGTH('HELLLLL')-LENGTH(REPLACE('HELLLLL','L')) FROM DUAL;

LENGTH('HELLLLL')-LENGTH(REPLACE('HELLLLL','L'))
------------------------------------------------
                                               5

Q10.Display all the employees whose job has string 'MAN'?
SQL> SELECT ENAME,JOB FROM EMP WHERE INSTR(JOB,'MAN',1)>0;

ENAME      JOB
---------- ---------
ALLEN      SALESMAN
WARD       SALESMAN
JONES      MANAGER
MARTIN     SALESMAN
BLAKE      MANAGER
CLARK      MANAGER
TURNER     SALESMAN

7 rows selected.

Q11.Display all the employees whosse job starts with string 'MAN'?
SQL> SELECT ENAME,JOB FROM EMP WHERE SUBSTR(JOB,1,3)='MAN';

ENAME      JOB
---------- ---------
JONES      MANAGER
BLAKE      MANAGER
CLARK      MANAGER

SQL> SELECT ENAME,JOB FROM EMP WHERE INSTR(JOB,'MAN')=1;

ENAME      JOB
---------- ---------
JONES      MANAGER
BLAKE      MANAGER
CLARK      MANAGER

Q12.Display all the employees whose job ends with a string 'MAN'?
SQL> SELECT * FROM EMP WHERE SUBSTR(JOB,-3)='MAN';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30

Q13.Display first 3 characters of ename in lower case and rest everything in upper case?
SQL> SELECT ENAME,LOWER(SUBSTR(ENAME,1,3))||UPPER(SUBSTR(ENAME,3)) FROM EMP;

ENAME      LOWER(SUBST
---------- -----------
SMITH      smiITH
ALLEN      allLEN
WARD       warRD
JONES      jonNES
MARTIN     marRTIN
BLAKE      blaAKE
CLARK      claARK
SCOTT      scoOTT
KING       kinNG
TURNER     turRNER
ADAMS      adaAMS
JAMES      jamMES
FORD       forRD
MILLER     milLLER

14 rows selected.

Q14.Display the result from emp table as below
"SMITH IS A CLERK AND GETS SALARY 2000"?
SQL> SELECT CONCAT(CONCAT(CONCAT(CONCAT(ENAME,' IS A '), JOB),' AND GETS SALARY '),2000) FROM EMP
  2  WHERE ENAME='SMITH';

CONCAT(CONCAT(CONCAT(CONCAT(ENAME,'ISA'),JOB),
----------------------------------------------
SMITH IS A CLERK AND GETS SALARY 2000

Q15.List all the employees hired on wednesday?
SQL> SELECT ENAME,HIREDATE FROM EMP WHERE TO_CHAR(HIREDATE,'DAY')='WEDNESDAY';

ENAME      HIREDATE
---------- ---------
SMITH      17-DEC-80

Q16.List all the employees hired on leao year?
SQL> SELECT * FROM EMP WHERE MOD(TO_NUMBER(TO_CHAR(HIREDATE,'YYYY')),4)=0;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20

Q17.List all the eemployees hired on Sunday in the month of May?
SQL> SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'D')=1 AND TO_CHAR(HIREDATE,'MM')=05

no rows selected

Q18.Display the first half name in lower case and rest in reverse?
SQL> SELECT ENAME,CONCAT(LOWER(SUBSTR(ENAME,1,LENGTH(ENAME)/2)),REVERSE(SUBSTR(ENAME,LENGTH
  2  (ENAME)/2+1))) FROM EMP;

ENAME      CONCAT(LOWER(SUBSTR(
---------- --------------------
SMITH      smHTI
ALLEN      alNEL
WARD       waDR
JONES      joSEN
MARTIN     marNIT
BLAKE      blEKA
CLARK      clKRA
SCOTT      scTTO
KING       kiGN
TURNER     turREN
ADAMS      adSMA
JAMES      jaSEM
FORD       foDR
MILLER     milREL

14 rows selected.

Q19.Display last 3 char of emp who are working as a manager?
SQL> SELECT ENAME,SUBSTR(ENAME,-3) FROM EMP WHERE JOB='MANAGER';

ENAME      SUB
---------- ---
JONES      NES
BLAKE      AKE
CLARK      ARK

Q20.Name of the employee whose name ends with 's'?
SQL> SELECT * FROM EMP WHERE INSTR(ENAME,'S',-1,1)>1;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30

Q21.Display first half of emp name?
SQL> SELECT ENAME,SUBSTR(ENAME,1,LENGTH(ENAME)/2) FROM EMP;

ENAME      SUBSTR(ENA
---------- ----------
SMITH      SM
ALLEN      AL
WARD       WA
JONES      JO
MARTIN     MAR
BLAKE      BL
CLARK      CL
SCOTT      SC
KING       KI
TURNER     TUR
ADAMS      AD
JAMES      JA
FORD       FO
MILLER     MIL

14 rows selected.

Q22.Write sysdate?
SQL> SELECT SYSDATE FROM DUAL;

SYSDATE
---------
03-OCT-21

Q23.Display total salary(sal+comm) of emp?
SQL> SELECT ENAME,SAL,COMM,SAL+NVL(COMM,0) "TOTAL SAL" FROM EMP;

ENAME             SAL       COMM  TOTAL SAL
---------- ---------- ---------- ----------
SMITH             800                   800
ALLEN            1600        300       1900
WARD             1250        500       1750
JONES            2975                  2975
MARTIN           1250       1400       2650
BLAKE            2850                  2850
CLARK            2450                  2450
SCOTT            3000                  3000
KING             5000                  5000
TURNER           1500          0       1500
ADAMS            1100                  1100
JAMES             950                   950
FORD             3000                  3000
MILLER           1300                  1300

14 rows selected.

Q24.Write a query to display total sal(sal+comm) of all emp and give commission rs.100 to all emp?
SQL> SELECT ENAME,SAL,COMM,SAL+NVL2(COMM,COMM+100,100) FROM EMP;

ENAME             SAL       COMM SAL+NVL2(COMM,COMM+100,100)
---------- ---------- ---------- ---------------------------
SMITH             800                                    900
ALLEN            1600        300                        2000
WARD             1250        500                        1850
JONES            2975                                   3075
MARTIN           1250       1400                        2750
BLAKE            2850                                   2950
CLARK            2450                                   2550
SCOTT            3000                                   3100
KING             5000                                   5100
TURNER           1500          0                        1600
ADAMS            1100                                   1200
JAMES             950                                   1050
FORD             3000                                   3100
MILLER           1300                                   1400

14 rows selected.

Q25.Increment the salary of all managers by Rs.100,Salesman by Rs.50 and remaining employees by Rs.10?
SQL> SELECT ENAME,JOB,SAL,DECODE(JOB,'MANAGERS',SAL+100,'SALESMAN',SAL+50,SAL+10) FROM EMP;

ENAME      JOB              SAL DECODE(JOB,'MANAGERS',SAL+100,'SALESMAN',SAL+50,SAL+10)
---------- --------- ---------- -------------------------------------------------------
SMITH      CLERK            800                                                     810
ALLEN      SALESMAN        1600                                                    1650
WARD       SALESMAN        1250                                                    1300
JONES      MANAGER         2975                                                    2985
MARTIN     SALESMAN        1250                                                    1300
BLAKE      MANAGER         2850                                                    2860
CLARK      MANAGER         2450                                                    2460
SCOTT      ANALYST         3000                                                    3010
KING       PRESIDENT       5000                                                    5010
TURNER     SALESMAN        1500                                                    1550
ADAMS      CLERK           1100                                                    1110
JAMES      CLERK            950                                                     960
FORD       ANALYST         3000                                                    3010
MILLER     CLERK           1300                                                    1310

14 rows selected.

Q26.Display sql like ***sql***?
SQL> SELECT LPAD(RPAD('SQL',6,'*'),9,'*') FROM DUAL;

LPAD(RPAD
---------
***SQL***

Q27.Write nearest highest value of 12.99?
SQL> SELECT CEIL(12.99) FROM DUAL;

CEIL(12.99)
-----------
         13

Q28.Write nearest lowest value of 12.99?
SQL> SELECT FLOOR(12.99) FROM DUAL;

FLOOR(12.99)
------------
          12

Q29.Round the given value 123.345 by 2?
SQL> SELECT ROUND(123.345,2) FROM DUAL;

ROUND(123.345,2)
----------------
          123.35

Q30.Write one example of power,sqrt and mod?
1.POWER
SQL> SELECT POWER(12,0) FROM DUAL;

POWER(12,0)
-----------
          1

2.SQRT
SQL> SELECT SQRT(625) FROM DUAL;

 SQRT(625)
----------
        25

3.MOD
SQL> SELECT MOD(13,2) FROM DUAL;

 MOD(13,2)
----------
         1



