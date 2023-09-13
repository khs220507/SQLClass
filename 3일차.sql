create table tbl_test_customer(
id varchar2(20) not null primary key ,
name varchar2(20) ,
address varchar2(20),
tel varchar2(20)
);
create table tbl_test_goods(
pcode varchar2(20) not null primary key,
pname varchar(20) ,
price number(4)
);
create table tbl_test_order(
ocode varchar2(20) not null primary key,
odate date,
id varchar2(20),
pcode varchar2(20),
sale_cnt number(6)
);
insert into tbl_test_customer values( 'H001' ,'김병진', '라스베가스', '010-1111-2222');
insert into tbl_test_customer values( 'H002' ,'이윤', 'L.A', '010-1111-2222');
insert into tbl_test_customer values( 'H003' ,'곽단야', '워싱턴D.C', '010-1111-2222');
insert into tbl_test_customer values( 'H004' ,'허재혁', '뉴욕', '010-1111-2222');
insert into tbl_test_customer values( 'H005' ,'서예진', '텍사스', '010-1111-2222');
insert into tbl_test_customer values( 'H006' ,'이윤정', '서울', '010-1111-2222');
insert into tbl_test_goods values('P001' ,'쫀드기', 1000);
insert into tbl_test_goods values('P002' ,'눈깔사탕', 100);
insert into tbl_test_goods values('P003' ,'아폴로', 200);
insert into tbl_test_goods values('P004' ,'뻥튀기', 2000);
insert into tbl_test_goods values('P005' ,'약과', 5000);
insert into tbl_test_order values('J001' , '20210110' , 'H001', 'P001', 2);
insert into tbl_test_order values('J002' , '20210110' , 'H002', 'P002', 5);
insert into tbl_test_order values('J003' , '20210110' , 'H003', 'P003', 2);
insert into tbl_test_order values('J004' , '20210110' , 'H004', 'P004', 1);
insert into tbl_test_order values('J005' , '20210110' , 'H005', 'P002', 3);
insert into tbl_test_order values('J006' , '20210110' , 'H001', 'P002', 3);
insert into tbl_test_order values('J007' , '20210110' , 'H002', 'P001', 1);
insert into tbl_test_order values('J008' , '20210110' , 'H001', 'P002', 4);

-- 주문테이블 정보 조회하기, 주문테이블, 고객테이블 관계성이 있음 (주문테이블에 고객테이블의 id를 가지고 있음)
select * from TBL_TEST_ORDER;
select * from TBL_TEST_CUSTOMER;

select * from tbl_test_order o
join tbl_test_customer c
on o.ID = c.ID;

-- 고객명, 판매수량

select c.name name, o.sale_cnt "Sale Count"
from tbl_test_order o
join tbl_test_customer c
on o.ID = c.ID;

-- 고객별 판매수량
select c.name "이름", sum(o.sale_cnt) || '개' "수량"
from tbl_test_order o
join tbl_test_customer c
on o.ID = c.ID
group by c.name;

-- 동등조인, 등가조인, inner조인(일치하는것만 조인된다.)
select * 
from TBL_TEST_ORDER o
inner join TBL_TEST_CUSTOMER c -- inner 생략가능 (일치하지 않는것은 조회되지 않는다.)
on o.id = c.id;

-- 고객 주문수량 조회 (주문하지 않은 고객도 함께 조회될 수 있도록)
select c.name, o.SALE_CNT 
from TBL_TEST_ORDER o
right outer join TBL_TEST_CUSTOMER c -- inner 생략가능 (일치하지 않는것은 조회되지 않는다.)
on o.id = c.id;

select c.name, nvl(o.SALE_CNT,0) || '개' 
from TBL_TEST_ORDER o
right outer join TBL_TEST_CUSTOMER c -- inner 생략가능 (일치하지 않는것은 조회되지 않는다.)
on o.id = c.id;


select c.name, nvl(o.SALE_CNT,0) || '개' 
from TBL_TEST_ORDER o
right outer join TBL_TEST_CUSTOMER c -- inner 생략가능 (일치하지 않는것은 조회되지 않는다.)
on o.id = c.id;

select c.name, nvl(sum(o.SALE_CNT),0) qty 
from TBL_TEST_ORDER o
right outer join TBL_TEST_CUSTOMER c -- inner 생략가능 (일치하지 않는것은 조회되지 않는다.)
on o.id = c.id
group by c.name
order by 2 desc;

-- 주문정보를 조회하기
-- 여러 테이블을 조인 할 때
-- 두 개중에서 중심테이블 먼저 표시함
select * from TBL_TEST_CUSTOMER;
select * from TBL_TEST_CUSTOMER;

-- 주문하지않은 고객도 함께 조회하기 (outer 조인, left, right, full)
select c.name, nvl(o.sale_cnt, 0)
from TBL_TEST_ORDER o
right outer join TBL_TEST_CUSTOMER c
on o.id = c.id;

---- 고객별 집계 (group by)
--select c.name, nvl(sum(o.sale_cnt),0)
--from tbl_test_order o
--right outer join tbl_test_cuhstomer c
--on o.id = c.id
--group by c.name;


select * from TBL_TEST_CUSTOMER;
select * from TBL_TEST_ORDER; 
select * from TBL_TEST_GOODS;

-- 문제 01
select g.PNAME, sum(o.SALE_CNT) AMOUNT
from tbl_test_goods g
inner join TBL_TEST_ORDER o
on g.Pcode = o.PCODE
group by g.PNAME;

-- 문제 02
select g.PNAME, sum(g.PRICE * o.SALE_CNT)
from tbl_test_goods g
inner join TBL_TEST_ORDER o
on g.Pcode = o.PCODE
group by g.PNAME;

-- 문제 03
select c.name NAME, sum(o.SALE_CNT * g.PRICE) AMOUNT
from TBL_TEST_ORDER o
inner join TBL_TEST_CUSTOMER c
on o.ID = c.ID
join TBL_TEST_GOODS g
on o.PCODE = g.PCODE
group by c.name;

select g.PNAME name, nvl(sum(g.PRICE * o.SALE_CNT),0) AMOUNT 
from 
TBL_TEST_ORDER o
right outer join TBL_TEST_GOODS g
on o.PCODE = g.PCODE
group by g.pname;

-- rollup() : 각 기준별 소계를 요약해서 보여주는 함수
-- group by가 선행되어야 한다.
select * from emp;
select deptno, job, sal from emp;
select deptno, sal from emp;

--to_char(금액, '999,999')
select decode(deptno, null, '합계',deptno) deptno, to_char(sum(sal),'999,999') sal_total
from emp
group by  rollup(deptno);

-- group by
select deptno, job, sum(sal)
from emp
group by deptno, job
order by deptno, job;

-- rollup() 소계, 전체합계
select deptno, decode(job, null, '소계', job), sum(sal)
from emp
group by rollup(deptno, job)
order by deptno, job;

select decode(deptno, null, '전체합계', deptno) deptno, decode(job, null, '소계', job), sum(sal)
from emp
group by rollup(deptno, job)
order by deptno, job;

--pivot() 함수
select * from emp;

select deptno,empno, job
from emp;

-- 
select deptno, 
decode(job, 'CLERK', empno) clerk,
decode(job, 'MANAGER', empno) manager,
decode(job, 'PRESIDENT', empno) PRESIDENT,
decode(job, 'ANALYST', empno) ANALYST,
decode(job, 'SALESMAN', empno) SALESMAN
from emp;

select * from emp;

select deptno, 
count(decode(job, 'CLERK', empno)) clerk,
count(decode(job, 'MANAGER', empno)) manager,
count(decode(job, 'PRESIDENT', empno)) PRESIDENT,
count(decode(job, 'ANALYST', empno)) ANALYST,
count(decode(job, 'SALESMAN', empno)) SALESMAN
from emp
group by DEPTNO;

--pivot()
select * from( select deptno, job, empno from emp)
pivot(
count(empno) for job in ('CLERK' as "CLERK",
                          'MANAGER' as "MANAGER",
                          'PRESIDENT' as "PRESIDENT",
                          'ANALYSY' as "ANALYST",
                          'SALESMAN' as "SALESMAN")
);

-- rank() 함수
select * from emp;
select empno, ename, sal from emp;
select empno, ename, sal, rank() over (order by sal desc) from emp; -- asc, desc
select empno, ename, sal, dense_rank() over (order by sal desc) from emp; 
select empno, ename, sal, deptno, dense_rank() over(partition by deptno order by sal desc) as 순위
from emp;

-- sum() over : 누계 구하기
select * from panmae;

select p_date, p_total, sum(p_total) over(order by p_total)
from panmae;

select p_date, p_total, p_total, sum(p_total) over(partition by p_code order by p_total)
from panmae
where p_store = 1000;

-- 210p
-- 문제01
select * from emp;

select round(max(sal + decode(comm,null,0,comm)), 1),
round(min(sal+decode(comm,null,0,comm)),1),
round(avg(sal+decode(comm,null,0,comm)),2)
from emp;

-- 문제02
select * from STUDENT;
select birthday from Student;

select
count(BIRTHDAY) as TOTAL,
count(decode(substr(BIRTHDAY,4,2), 01, 'JAN')) || 'EA' JAN,
count(decode(substr(BIRTHDAY,4,2), 02, 'FEB')) || 'EA' FEB,
count(decode(substr(BIRTHDAY,4,2), 03, 'MAR')) || 'EA' MAR,
count(decode(substr(BIRTHDAY,4,2), 04, 'APR')) || 'EA' APR,
count(decode(substr(BIRTHDAY,4,2), 05, 'MAY')) || 'EA' MAY,
count(decode(substr(BIRTHDAY,4,2), 06, 'JUN')) || 'EA' JUN,
count(decode(substr(BIRTHDAY,4,2), 07, 'JUL')) || 'EA' JUL,
count(decode(substr(BIRTHDAY,4,2), 08, 'AUG')) || 'EA' AUG,
count(decode(substr(BIRTHDAY,4,2), 09, 'SEP')) || 'EA' SEP,
count(decode(substr(BIRTHDAY,4,2), 10, 'OCT')) || 'EA' OCT,
count(decode(substr(BIRTHDAY,4,2), 11, 'NOV')) || 'EA' NOV,
count(decode(substr(BIRTHDAY,4,2), 12, 'DEC')) || 'EA' DEC
from student;


-- 문제03
select * from STUDENT;

select
count(TEL) as TOTAL,
count(decode(substr(TEL,1, instr(TEL, ')')-1), 02, 'SEOUL')) SEOUL,
count(decode(substr(TEL,1, instr(TEL, ')')-1), 031, 'GYEONGGI')) GYEONGGI,
count(decode(substr(TEL,1, instr(TEL, ')')-1), 051, 'BUSAN')) BUSAN,
count(decode(substr(TEL,1, instr(TEL, ')')-1), 052, 'ULSAN')) ULSAN,
count(decode(substr(TEL,1, instr(TEL, ')')-1), 031, 'DAEGU')) DAEGU,
count(decode(substr(TEL,1, instr(TEL, ')')-1), 031, 'GYEONGNAM')) GYEONGNAM
from student;

-- 문제 04
INSERT INTO emp(empno,deptno, ename, sal) VALUES (1000,10,'Tiger',3600);
INSERT INTO emp(empno,deptno, ename, sal) VALUES (2000,10,'Cat',3000);

select * from emp;
select empno, ename, job, sal from emp;

select deptno, 
count(decode(job, 'CLERK', empno)) clerk,
count(decode(job, 'MANAGER', empno)) manager,
count(decode(job, 'PRESIDENT', empno)) PRESIDENT,
count(decode(job, 'ANALYST', empno)) ANALYST,
count(decode(job, 'SALESMAN', empno)) SALESMAN
from emp
group by DEPTNO;

select * from emp;


 




select deptno,
sum(decode(job, 'CLERK', sal)) CLERK,
sum(decode(job, 'MANAGER', sal)) MANAGER,
sum(decode(job, 'PRESIDENT', sal)) PRESIDENT,
sum(decode(job, 'ANALYST', sal)) ANALYST,
sum(decode(job, 'SALESMAN', sal)) SALESMAN,
sum(decode(deptno, '10', job, 'CLERK', sal)) TOTAL
from emp
group by DEPTNO
order by DEPTNO;



select deptno,
decode(job, 'CLERK', sal) CLERK,
decode(job, 'MANAGER', sal) MANAGER,
decode(job, 'PRESIDENT', sal) PRESIDENT,
decode(job, 'ANALYST', sal) ANALYST,
decode(job, 'SALESMAN', sal) SALESMAN,
  sal  TOTAL
from emp;
--group by DEPTNO
--order by DEPTNO;


select decode(deptno, null, '전체합계', deptno),
sum(decode(job, 'CLERK', sal, 0)) CLERK,
sum(decode(job, 'MANAGER', sal, 0)) MANAGER,
sum(decode(job, 'PRESIDENT', sal, 0)) PRESIDENT,
sum(decode(job, 'ANALYST', sal, 0)) ANALYST,
sum(decode(job, 'SALESMAN', sal, 0)) SALESMAN,
sum(sal) as TOTAL
from emp where job != 'Tiger' or job !='Cat'
group by rollup(DEPTNO)
order by DEPTNO;

-- HY 오디션 관리 프로그램

create table tbl_join_200(
  join_id varchar2(4)  not null primary key ,
  join_nm varchar2(20)  ,
  birth  char(8),
  gender char(1),
  specialty varchar2(1),
  charm varchar2(30)
);

insert into tbl_join_200 values( 'A001' , '케이쥬',  '20050102' , 'M', 'D', '깜찍댄스');
insert into tbl_join_200 values( 'A002' , '고키',  '20090102' , 'M', 'D', '동전마술');
insert into tbl_join_200 values( 'A003' , '나윤서',  '20070102' , 'M', 'D', '창작댄스');
insert into tbl_join_200 values( 'A004' , '장현수',  '20030103' , 'M', 'R', '보컬');
insert into tbl_join_200 values( 'A005' , '윤민',  '20020205' , 'M', 'V', '자작곡');

create table tbl_mentor_200(
    mentor_id varchar2(4) not null primary key ,
    mentor_nm varchar2(20)
);

insert into tbl_mentor_200 values( 'J001', '박진영');
insert into tbl_mentor_200 values( 'J002', '박재상');
insert into tbl_mentor_200 values( 'J003', '보아');



create table tbl_score_200(
  score_no  number(6) not null ,
  artistid varchar2(4) not null,
  mentorid varchar2(4) not null,
  score number(3),
  primary key( score_no, artistid, mentorid)
);

insert into tbl_score_200 values( 110001, 'A001', 'J001' , 80);
insert into tbl_score_200 values( 110002, 'A001', 'J002' , 90);
insert into tbl_score_200 values( 110003, 'A001', 'J003' , 70);
insert into tbl_score_200 values( 110004, 'A002', 'J001' , 60);
insert into tbl_score_200 values( 110005, 'A002', 'J002' , 50);
insert into tbl_score_200 values( 110006, 'A002', 'J003' , 70);
insert into tbl_score_200 values( 110007, 'A003', 'J001' , 80);
insert into tbl_score_200 values( 110008, 'A003', 'J002' , 60);
insert into tbl_score_200 values( 110009, 'A003', 'J003' , 70);
insert into tbl_score_200 values( 110010, 'A004', 'J001' , 80);
insert into tbl_score_200 values( 110011, 'A004', 'J002' , 78);
insert into tbl_score_200 values( 110012, 'A004', 'J003' , 89);
insert into tbl_score_200 values( 110013, 'A005', 'J001' , 62);
insert into tbl_score_200 values( 110014, 'A005', 'J002' , 91);
insert into tbl_score_200 values( 110015, 'A005', 'J003' , 67);
COMMIT;

-- 01. 참가자 조회 
select * from tbl_join_200;

select JOIN_ID "참가자ID", 
JOIN_NM "참가자이름",
to_char(to_date(BIRTH), '""yyyy"년"mm"월"dd"일"') "생년월일",
decode(GENDER, 'M', '남자', '여자') "성별", 
decode(SPECIALTY, 'D', '댄스', 'R', '랩', 'V', '보컬') "실력무대", 
CHARM "매력무대"
from TBL_JOIN_200;

-- 02. 참가자 점수조회
select * from TBL_JOIN_200;
select * from TBL_MENTOR_200;
select * from TBL_SCORE_200;

select
S.SCORE_NO "계좌번호",
s.ARTISTID "참가자ID",
j.JOIN_NM "참가자이름",
to_char(to_date(j.BIRTH), '""yyyy"년"mm"월"dd"일"') "생년월일",
s.SCORE "점수",
case when s.SCORE>=90 THEN 'A' 
when s.SCORE>=80 THEN 'B' 
when s.SCORE>=70 THEN 'C' 
when s.SCORE>=60 THEN 'D'
when s.SCORE<60 THEN 'F'
END "등급",
m.MENTOR_NM "멘토이름"
from TBL_SCORE_200 s
inner join TBL_MENTOR_200 m
on s.MENTORID = m.MENTOR_ID
inner join TBL_JOIN_200 j
on j.JOIN_ID = s.ARTISTID;

-- 03. 참가자 등수 조회
select
s.ARTISTID "참가자ID",
j.JOIN_NM "참가자이름",
sum(s.SCORE) "종합점수",
round(avg(s.SCORE),2) "평균점수",
rank() over (order by avg(s.score) desc) as 순위
from TBL_SCORE_200 s
inner join TBL_MENTOR_200 m
on s.MENTORID = m.MENTOR_ID
inner join TBL_JOIN_200 j
on j.JOIN_ID = s.ARTISTID
group by j.JOIN_NM, s.ARTISTID
order by avg(s.SCORE) desc;

-- 수강신청DB
create table tbl_course_300 (
        s_id varchar2(5) not null primary key,
        s_name varchar2(20)  ,
        s_grade number(6),
        teacher_id varchar2(10) ,
        weekday char(2) ,
        start_h number(4),
        end_h  number(4)
);

insert into tbl_course_300 values('1001',  '한식만들기' , 2, 1, 'M' , 0900, 1100 );
insert into tbl_course_300 values('1002',  '양식만들기' , 2, 2, 'TU' , 0900, 1200 );
insert into tbl_course_300 values('1003',  '제과제빵' , 3, 4, 'W' , 0900, 1200 );
insert into tbl_course_300 values('1004',  '중식만들기' , 3, 4, 'TH' , 0900, 1200 );
insert into tbl_course_300 values('1005',  '음료만들기' , 2, 5, 'M' , 1300, 1600 );
insert into tbl_course_300 values('1006',  '분식만들기' , 3, 5, 'TH' , 1500, 1800 );
insert into tbl_course_300 values('1007',  '전통주만들기' , 3, 5, 'W' , 1330, 1630 );
insert into tbl_course_300 values('1008',  '반찬만들기' , 2, 3, 'TH' , 1330, 1530 );
insert into tbl_course_300 values('1009',  '김치만들기' , 3, 3, 'F' , 0900, 1200 );
insert into tbl_course_300 values('1010',  '떡만들기' , 3, 2, 'F' , 1300, 1600 );



create table tbl_lecturer_300(
    t_id number(6) not null primary key,
    t_name varchar2(20)  ,
    major varchar2(20),
    field varchar2(20)
);

 

insert into tbl_lecturer_300 values( 1, '정국교수','한식,중식' ,'중식');
insert into tbl_lecturer_300 values( 2, '뷔교수','한식,중식' ,'중식');
insert into tbl_lecturer_300 values( 3, '지민교수','한식,양식' ,'양식');
insert into tbl_lecturer_300 values( 4, '제이홉교수','한식,양식' ,'한식');
insert into tbl_lecturer_300 values( 5, '슈가교수','제과제빵' ,'제과');
insert into tbl_lecturer_300 values( 6, '진교수','분식및음료' ,'분식');
insert into tbl_lecturer_300 values( 7, 'RM교수','분식및음료' ,'분식');

-- 문제01. 참가자 조회
select * from TBL_COURSE_300;
select * from TBL_LECTURER_300;

select
c.S_ID "과목코드",
c.S_NAME "과목명",
c.S_GRADE "학점",
l.T_NAME "담당강사",
decode(c.WEEKDAY, 'M ', '월', 'TU', '화', 'W ' ,'수', 'TH', '목', 'F ', '금') "요일",
c.START_H "시작시작",
c.END_H "종료시간"
from TBL_COURSE_300 c
inner join TBL_LECTURER_300 l
on c.TEACHER_ID = l.T_ID;


-- CU

create table goods_tbl_500(
goods_cd varchar2(6) not null primary key, 
goods_nm varchar2(30), 
goods_price number(8), 
cost number(8), in_date date
); 


insert into goods_tbl_500 values('110001','육계장사발면',1050,750,'20190302');
insert into goods_tbl_500 values('110002','단팥빵',1300,800,'20190302'); 
insert into goods_tbl_500 values('110003','사브로',2000,1700,'20190302');
insert into goods_tbl_500 values('110004','칠성사이다',900,750,'20190302'); 
insert into goods_tbl_500 values('110005','콜라',750,300,'20190302'); 
insert into goods_tbl_500 values('110006','아몬드초콜릿',1500,1300,'20190302'); 
insert into goods_tbl_500 values('110007','초코몽',850,600,'20190302');


 create table store_tbl_500(
 store_cd varchar2(5) not null primary key,
 store_nm varchar2(20), 
 store_fg varchar2(1)
);

 insert into store_tbl_500 values('A001','노원점','0');
 insert into store_tbl_500 values('A002','마포점','0'); 
insert into store_tbl_500 values('A003','석계점','0'); 
insert into store_tbl_500 values('B001','하계점','1');
 insert into store_tbl_500 values('C001','상계점','1'); 
insert into store_tbl_500 values('D001','중계점','0');
 insert into store_tbl_500 values('D002','태릉입구점','1'); 
insert into store_tbl_500 values('E001','화랑대점','0');


 create table sale_tbl_500(
 sale_no varchar2(4) not null primary key, 
 sale_ymd date not null,
 sale_fg varchar2(1) not null, 
 store_cd varchar2(5)  ,         
 goods_cd varchar2(6) ,
 sale_cnt number(3),
 pay_type varchar2(2),
 constraint  fk1 foreign key (store_cd)  references store_tbl_500(store_cd),
 constraint  fk2  foreign key (goods_cd) references goods_tbl_500(goods_cd)
); 

insert into sale_tbl_500 values('0001','20190325','1','A001','110001',2,'02'); 
insert into sale_tbl_500 values('0002','20190325','1','B001','110003',2,'02');
 insert into sale_tbl_500 values('0003','20190325','1','D001','110003',1,'01'); 
insert into sale_tbl_500 values('0004','20190325','1','A001','110006',5,'02'); 
insert into sale_tbl_500 values('0005','20190325','1','C001','110003',2,'02'); 
insert into sale_tbl_500 values('0006','20190325','2','C001','110003',2,'02');
 insert into sale_tbl_500 values('0007','20190325','1','A002','110005',4,'02');
 insert into sale_tbl_500 values('0008','20190325','1','A003','110004',4,'02');
 insert into sale_tbl_500 values('0009','20190325','1','B001','110001',2,'01');
 insert into sale_tbl_500 values('0010','20190325','1','A002','110006',1,'02');


-- 점포별 매출현황
select * from SALE_TBL_500;
select * from STORE_TBL_500;
select * from GOODS_TBL_500;

select * from
GOODS_TBL_500 goods
inner join SALE_TBL_500 sale
on goods.GOODS_CD = sale.GOODS_CD
inner join STORE_TBL_500 store
on sale.STORE_CD = store.STORE_CD;

select
store.STORE_NM 점포명,
sum(case when sale.PAY_TYPE = 01 then sale.SALE_CNT * good.GOODS_PRICE ELSE 0 END) || '원' 현금매출,
sum(case when sale.PAY_TYPE = 02 then sale.SALE_CNT * good.GOODS_PRICE ELSE 0 END) || '원' 카드매출,
sum(sale.SALE_CNT * good.GOODS_PRICE) || '원' 총매출
from
GOODS_TBL_500 good
inner join SALE_TBL_500 sale
on good.GOODS_CD = sale.GOODS_CD
inner join STORE_TBL_500 store
on sale.STORE_CD = store.STORE_CD
group by store.STORE_NM
order by 총매출 desc;

select 
decode(sale.SALE_FG, 1, '판매') 판매구분,
to_char(sale.SALE_YMD, 'yyyy-mm-dd') 판매일자,
good.GOODS_NM 상품명,
sale.SALE_CNT 판매수량,
sale.SALE_CNT * good.GOODS_PRICE 판매금액,
decode( sale.PAY_TYPE, 02, '카드', 01, '현금') 수취구분
from
GOODS_TBL_500 good
inner join SALE_TBL_500 sale
on good.GOODS_CD = sale.GOODS_CD
inner join STORE_TBL_500 store
on sale.STORE_CD = store.STORE_CD
where store.STORE_CD ='A001'; 

select
GOODS_CD 상품코드,
GOODS_NM 상품명,
GOODS_PRICE 판매단가,
COST "(상품)원가",
to_char(IN_DATE,'yyyy-mm-dd') 입고일자
from GOODS_TBL_500; 

commit;








