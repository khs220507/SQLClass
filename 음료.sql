create table goodstbl(
id varchar2(20) primary key,
name varchar2(30),
price number(4)
);

insert into goodstbl values('c001', '���̽��Ƹ޸�ī��', 2000);
insert into goodstbl values('c002', '�ٴҶ��', 2500);
insert into goodstbl values('c003', '�Ҹ޸�ī��', 2900);

commit;
