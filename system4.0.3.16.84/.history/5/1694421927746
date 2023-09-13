select * from member_tbl_11;
--rownum 이용해서 범위의 목록 가져오기
--rownum 사용시 주의 사항!
select * from member_tbl_11.
where rownum between 1 and 4;

select * from member_tbl_11
where rownum between 5 and 8;

-- 
select * from
(select rownum num, m_id, m_pw, m_name from member_tbl_11)
where num between 1 and 4;

select * from
(select rownum num, m_id, m_pw, m_name from member_tbl_11)
where num between 9 and 12;

select * 
from (select rownum num, m_id, m_name, m_tel, M_BIRTHDAY, M_POINT, M_GRADE
from member_tbl_11)
where num between 1 and 4;


select * from acorntbl;

select *
from (select rownum num, id, pw, name from ACORNTBL)
where num BETWEEN 5 and 10;

