create table tblcall_list (
 regno number(3) not null primary key,
 regtime number(10) ,
 regdate date,
 cusno varchar2(10),
 startpoint varchar2(20),
 destination varchar2(20),
 taxino varchar2(10),
 state varchar2(1)
);

insert into tblcall_list values( 1,0830,'20210101','P001','���', '����' , 'T001', 'P' );
insert into tblcall_list values( 2,1210,'20210102','P002','����', '������' , 'T002', 'R' );
insert into tblcall_list values( 3,1120,'20210510','P003','����', '�λ�' , 'T003', 'P' );
insert into tblcall_list values( 4,1510,'20210520','P003','����', '����' , 'T001', 'P' );
insert into tblcall_list values( 5,1610,'20210530','P001','������', '����' , '����', 'R' );

commit;

create table tblcust(
  id varchar2(10) not null primary key,
  name varchar2(20),
  tel varchar2(20)
  );
  
insert into tblcust values('P001', '���', '01011112222');
insert into tblcust values('P002', '�̰�', '01022223333');
insert into tblcust values('P003', '�ڰ�', '01033334444');

commit;

create table tbl_taxi(
id varchar2(10) not null primary key,
name varchar2(20),
kind varchar2(20)
);

insert into tbl_taxi values('T001', '���ý�', '����');
insert into tbl_taxi values('T002', '���ý�', '����');
insert into tbl_taxi values('T003', '���ý�', '����');

commit;

select * from tbl_taxi;
select * from tblcust;
select * from tblcall_list;

select REGNO, REGTIME, TO_CHAR(REGDATE,'YYYY-MM-DD'),CUSNO,STARTPOINT,DESTINATION,TAXINO,STATE from tblcall_list;

-- ��ȸ�����ۼ�

select   substr(cust.tel, 1, 3) || '-' || substr(cust.tel, 4, 4)  || '-' || substr(cust.tel, 8, 4)  tel, 
        call.regno ,substr( lpad( regtime, 4, '0') , 1 ,2 )  || ':' || substr( lpad( regtime, 4, '0') , 3 ,2 )  regtime
        , to_char( call.regdate ,'yyyy-mm-dd' ) , 
        cust.name,  call.startpoint,
        call.DESTINATION  ,  call.taxino,
        decode(call.state ,'P', '�����Ϸ�', 'R', '�����غ�' , 'X', '��������')
from tblcall_list  call
join tblcust  cust
on  call.CUSNO  = cust.id;