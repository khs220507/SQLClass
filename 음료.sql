create table goodstbl(
id varchar2(20) primary key,
name varchar2(30),
price number(4)
);

insert into goodstbl values('c001', '아이스아메리카노', 2000);
insert into goodstbl values('c002', '바닐라라떼', 2500);
insert into goodstbl values('c003', '할메리카노', 2900);

commit;
