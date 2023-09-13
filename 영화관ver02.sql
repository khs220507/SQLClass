create table tbl_customer_02(
id varchar2(4) primary key,
name varchar2(10) not null,
phone varchar2(15) check (phone like '010-____-____') not null unique
);

insert into tbl_customer_02 values ('k001', '김현수', '010-7553-5128');
insert into tbl_customer_02 values ('k002', '곽단야', '010-3245-1234');
insert into tbl_customer_02 values ('l001', '이정훈', '010-3652-1111');
insert into tbl_customer_02 values ('l002', '이윤정', '010-3652-9999');
insert into tbl_customer_02 values ('p001', '표준태', '010-7657-3784');
insert into tbl_customer_02 values ('j001', '조은경', '010-7553-5142');

create table tbl_movie02(
      m_code char(10) primary key,
      m_title varchar2(50) not null,
      m_genre varchar2(20) not null,
      m_price number(10) not null,
      m_runtime varchar2(5) not null,
      m_start_end varchar2(25) check(m_start_end like '__:__~__:__') not null
);


insert into tbl_movie02 values ('010', 'Avengers: Endgame', 'action', '13000', '180', '09:00~12:00');
insert into tbl_movie02 values ('020', 'Avengers: Endgame', 'action', '13000', '180', '15:00~18:00');
insert into tbl_movie02 values ('030', 'Avengers: Endgame', 'action', '13000', '180', '21:00~24:00');
insert into tbl_movie02 values ('011', 'Avengers: Endgame1', 'action', '11000', '170', '09:00~12:00');
insert into tbl_movie02 values ('111', 'Avengers: Endgame1', 'action', '11000', '170', '15:00~18:00');
insert into tbl_movie02 values ('211', 'Avengers: Endgame1', 'action', '11000', '170', '21:00~24:00');
insert into tbl_movie02 values ('012', 'Avengers: Endgame2', 'action', '12000', '180', '09:00~12:00');
insert into tbl_movie02 values ('112', 'Avengers: Endgame2', 'action', '12000', '180', '21:00~24:00');
insert into tbl_movie02 values ('212', 'Avengers: Endgame2', 'action', '12000', '180', '09:00~12:00');
insert into tbl_movie02 values ('013', '엘리멘탈', '코믹', '10000', '210' ,'09:00~12:00');
insert into tbl_movie02 values ('113', '엘리멘탈', '코믹', '10000', '210', '21:00~24:00');
insert into tbl_movie02 values ('213', '엘리멘탈', '코믹', '10000', '210', '09:00~12:00');
insert into tbl_movie02 values ('014', '쏘우', '스릴러', '15000', '230','09:00~12:00');
insert into tbl_movie02 values ('114', '쏘우', '스릴러', '15000', '230','21:00~24:00');
insert into tbl_movie02 values ('214', '쏘우', '스릴러', '15000', '230','09:00~12:00');

create table tbl_movie_order_02(
r_num varchar2(4) primary key,
o_id REFERENCES tbl_customer_02(id),
o_code REFERENCES tbl_movie02(m_code),
o_cnt number(2)
);

select * from tbl_movie_order_02;

--drop table tbl_movie_order_02;

insert into tbl_movie_order_02 values ('r001', 'k001', '010', 2);
insert into tbl_movie_order_02 values ('r002', 'k002', '010', 1);
insert into tbl_movie_order_02 values ('r003', 'l001', '211', 3);
insert into tbl_movie_order_02 values ('r004', 'l002', '211', 2);
insert into tbl_movie_order_02 values ('r005', 'p001', '114', 1);
insert into tbl_movie_order_02 values ('r006', 'j001', '114', 1);
insert into tbl_movie_order_02 values ('r007', 'j001', '212', 1);

select
o.R_NUM 예약번호,
c.ID 회원아이디,
c.NAME 회원이름,
c.PHONE 연락처,
m.M_TITLE 영화제목,
m.M_GENRE 장르,
m.M_RUNTIME||'분' 런타임,
m.M_START_END 상영시간,
m.M_PRICE || '원' 티켓가격,
o.O_CNT || '장' 예매수량,
(m.M_PRICE * O.O_CNT) || '원' 총금액
from
tbl_customer_02 c
inner join tbl_movie_order_02 o
on c.ID = o.O_ID
inner join tbl_movie02 m
on o.O_CODE = m.M_CODE;


--drop table tbl_movie_order_02;
--drop table tbl_movie02;
--drop table tbl_customer_02;

---- by 준태
--select
--o.R_NUM 예약번호,
--sum(m.M_PRICE * O.O_CNT) || '원' 총매출
--from
--tbl_customer_02 c
--inner join tbl_movie_order_02 o
--on c.ID = o.O_ID
--inner join tbl_movie02 m
--on o.O_CODE = m.M_CODE
--group by rollup(o.R_NUM);

