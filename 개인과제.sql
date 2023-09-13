-- ���� ���� --

-- ������ : å��ȣ, å�̸�, �۰��̸�, �帣
create table library_tbl (
BookNo number(1) primary key, 
BookName varchar2(25) not null,
WriterName varchar2(25) not null,
Gerne varchar2(10) not null
);

-- ����� : ������̸�, å��ȣ, ��ȭ��ȣ
create table library_user_tbl (
BookNo number(1) primary key,
UserName varchar2(10) not null,
PhoneNum varchar2(20) check (PhoneNum like '010-____-____') not null
);

insert into library_tbl values(0, '����������', '������', '����');
insert into library_tbl values(1, '����������', '������', '����'); 
insert into library_tbl values(2, '����������', '����ȭ', '����'); 
insert into library_tbl values(3, '����������', '���ܾ�', '����'); 
insert into library_tbl values(4, '��ȸ�������ΰ�', 'ǥ����', '��ȸ');
insert into library_tbl values(5, '��ȸ�ǹ����ΰ�', 'ǥ����', '��ȸ'); 


