create view v_emp223
as
select e.ename, d.dname
from t_emp e
join t_dept d
on e.deptno = d.deptno;

-- 인라인뷰
-- from 절 뒤에오는 서브쿼리를 인라인뷰라고 한다.

select *
from tbl_test_order;

select *
from(
select ocode, pcode, sale_cnt
from TBL_TEST_ORDER
) o join tbl_test_goods g
on o.pcode = g.pcode;

-- 서브쿼리
select * from t_emp;
select ename, salary from t_emp where salary > 250;

select ename, salary
from t_emp
where salary > (select salary from t_emp where ename='신동엽');

select * 
from  t_emp
where deptno in(20,40);

select * 
from  t_emp
where deptno in ( select deptno from t_dept where dname ='기획팀' or dname = '메케팅임');

-- 평균 급여보다 많은 사람 조회하기
select * 
from t_emp;

select ename , salary
from t_emp
where salary >100;

-- Scott에 view 권한 주기
-- 1. cmd창 실행하기
-- 2. sqlplus / as sysdba; // dba 접속 한다
-- 3. grant create view to scott; // scott에 view 권한주기
-- scott 계정으로도 create view 할 수 있다.
-- developer scott에서 view 테스트하기

--데이터 추가하기
 --모든컬럼의 값을 순서대로 입력해야함 
 insert into member_tbl_11 values('test','0000','우주연', '000-111-3333','1975-12-10' , null, null);
 insert into member_tbl_11(m_id, m_pw, m_name) values('test2','1234','홍길동' );
 commit;
 select * from member_tbl_11;
 
 
 
 -- 
 create table professor3
 as
 select * from professor ;
 
 select * from professor3;
 
 create table professor4
 as
 select * from professor
 where 1=2;         --  불일치 조건 만들기
 
 select * from professor4;
 
 insert into professor4
 select * from professor;
 
 --update (데이터 변경하기)
 select  * from member_tbl_11 where m_name = '우주연';
 
 update member_tbl_11
 set  m_tel ='010-222-5555' 
 where m_id='test'; 
 commit;
 
 select * from member_tbl_11; 
 -- 모든고객의 포인트금액을 변경하기
 -- 기존포인트에서 1000증가시키는 , null인 고객은 1000으로  update 구문작성하기
 
 update member_tbl_11
 set m_pw='9999' , m_tel ='010-999-3333'
 where m_id='test';
 commit;
 
 delete 
 from member_tbl_11
 where m_id = 'test';
 commit;
 
 select * from member_tbl_11;
 
-- DDL
-- 테이블 생성하기,  테이블 컬럼 정보 수정하기, 테이블 삭제하기

create table member2(
id varchar2(7),
name varchar2(10)
);

select * from member2;

-- 테이블 정보 수정하기
alter table member2 modify id varchar2(5);
alter table member2 add(addr varchar2(5));
alter table member2 rename column id to user_id;
alter table member2 drop column addr;
desc member2;
select * from member2;

create table tt02
(no number(3,1) default 0,
name varchar2(10) default 'no name',
hiredate date default sysdate
);
insert into tt02(no) values(1);
select * from tt02;

-- 테이블 삭제하기
drop table tt2; -- 테이블 자체를 삭제 (스키마까지 삭제)
truncate table tt2; -- 테이블 정보는 남는다.

select * from tbl_test_customer;
select * from tbl_test_order;
select * from tbl_test_order;
insert into tbl_test_order(ocode, odate, id, pcode, sale_cnt) values('J009','2023-08-22','H007', 'P001', 100);

create table test_2021
(
id varchar2(7) not null ,
email varchar2(50) null ,
phone char(13) not null,
pwd varchar2(7) default '111'
);

insert into test_2021 (id, email, phone) 
values('test01', 'aaa@naver.com', '010-1111-1111');
commit;


-- 체크 제약
create table test_2021_2
(
id varchar2(50) null ,
phone varchar2(20) check (phone like '010-%-____') not null ,
email varchar2(50) null
);

insert into test_2021_2(id,phone)
values('test01', '010-0100-0000');


create table test_2021_0
(
id varchar2(50) not null,
email varchar2(200) null ,
phone char(13) not null,
pwd varchar2(200) default '111' ,
grade CHAR(2) CHECK( grade IN ('01', '02', '03'))
);

create table test_2021_3
(
id varchar2(7) not null primary key ,
email varchar2(50) ,
phone char(13) unique ,
pwd varchar2(10)
);
insert into test_2021_3 values(‘a10’ , ‘aaa@naver.com’ ,’010-111-2222’ , ’111’);
insert into test_2021_3 values('b10' , 'bbb@naver.com' ,'010-222-3333' , '222');
insert into test_2021_3 values('b10' , 'ccc@naver.com' ,'010-333-4444' , ‘333');
insert into test_2021_3 values('c10' , 'ddd@naver.com' ,'010-111-2222' , '111');


create table ord_tbl (
no varchar2(5) not null primary key ,
qty number(4) ,
cus_no varchar2(5)
);

insert into ord_tbl values( 'j01' , 3, 'a1' );
insert into ord_tbl values( 'j02' , 1, 'a1' );
insert into ord_tbl values( 'j03' , 7, 'a2' );

create table ord_tbl_2 (
no varchar2(5) not null primary key ,
qty number(4) not null,
cus_no varchar2(5) references mem_tbl_2(id)
);

insert into ord_tbl_2 values( 'j01' , 3, 'a1' );
insert into ord_tbl_2 values( 'j02' , 1, 'a1' );
insert into ord_tbl_2 values( 'j03' , 7, 'a2' );
insert into ord_tbl_2 values('j04', 7, 'a2');

-- 제약 조건 사용하기
create table new_emp1
(no NUMBER(4)

