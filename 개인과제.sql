-- 개인 과제 --

-- 도서관 : 책번호, 책이름, 작가이름, 장르
create table library_tbl (
BookNo number(1) primary key, 
BookName varchar2(25) not null,
WriterName varchar2(25) not null,
Gerne varchar2(10) not null
);

-- 사용자 : 사용자이름, 책번호, 전화번호
create table library_user_tbl (
BookNo number(1) primary key,
UserName varchar2(10) not null,
PhoneNum varchar2(20) check (PhoneNum like '010-____-____') not null
);

insert into library_tbl values(0, '수학의정석', '김현수', '교육');
insert into library_tbl values(1, '영어의정석', '조은경', '교육'); 
insert into library_tbl values(2, '국어의정석', '허재화', '교육'); 
insert into library_tbl values(3, '과학의정석', '곽단야', '과학'); 
insert into library_tbl values(4, '사회란무엇인가', '표준태', '사회');
insert into library_tbl values(5, '사회의무엇인가', '표준태', '사회'); 


