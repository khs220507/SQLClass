create view v_emp223
as
select e.ename, d.dname
from t_emp e
join t_dept d
on e.deptno = d.deptno;

-- �ζ��κ�
-- from �� �ڿ����� ���������� �ζ��κ��� �Ѵ�.

select *
from tbl_test_order;

select *
from(
select ocode, pcode, sale_cnt
from TBL_TEST_ORDER
) o join tbl_test_goods g
on o.pcode = g.pcode;

-- ��������
select * from t_emp;
select ename, salary from t_emp where salary > 250;

select ename, salary
from t_emp
where salary > (select salary from t_emp where ename='�ŵ���');

select * 
from  t_emp
where deptno in(20,40);

select * 
from  t_emp
where deptno in ( select deptno from t_dept where dname ='��ȹ��' or dname = '��������');

-- ��� �޿����� ���� ��� ��ȸ�ϱ�
select * 
from t_emp;

select ename , salary
from t_emp
where salary >100;

-- Scott�� view ���� �ֱ�
-- 1. cmdâ �����ϱ�
-- 2. sqlplus / as sysdba; // dba ���� �Ѵ�
-- 3. grant create view to scott; // scott�� view �����ֱ�
-- scott �������ε� create view �� �� �ִ�.
-- developer scott���� view �׽�Ʈ�ϱ�

--������ �߰��ϱ�
 --����÷��� ���� ������� �Է��ؾ��� 
 insert into member_tbl_11 values('test','0000','���ֿ�', '000-111-3333','1975-12-10' , null, null);
 insert into member_tbl_11(m_id, m_pw, m_name) values('test2','1234','ȫ�浿' );
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
 where 1=2;         --  ����ġ ���� �����
 
 select * from professor4;
 
 insert into professor4
 select * from professor;
 
 --update (������ �����ϱ�)
 select  * from member_tbl_11 where m_name = '���ֿ�';
 
 update member_tbl_11
 set  m_tel ='010-222-5555' 
 where m_id='test'; 
 commit;
 
 select * from member_tbl_11; 
 -- ������ ����Ʈ�ݾ��� �����ϱ�
 -- ��������Ʈ���� 1000������Ű�� , null�� ���� 1000����  update �����ۼ��ϱ�
 
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
-- ���̺� �����ϱ�,  ���̺� �÷� ���� �����ϱ�, ���̺� �����ϱ�

create table member2(
id varchar2(7),
name varchar2(10)
);

select * from member2;

-- ���̺� ���� �����ϱ�
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

-- ���̺� �����ϱ�
drop table tt2; -- ���̺� ��ü�� ���� (��Ű������ ����)
truncate table tt2; -- ���̺� ������ ���´�.

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


-- üũ ����
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
insert into test_2021_3 values(��a10�� , ��aaa@naver.com�� ,��010-111-2222�� , ��111��);
insert into test_2021_3 values('b10' , 'bbb@naver.com' ,'010-222-3333' , '222');
insert into test_2021_3 values('b10' , 'ccc@naver.com' ,'010-333-4444' , ��333');
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

-- ���� ���� ����ϱ�
create table new_emp1
(no NUMBER(4)

