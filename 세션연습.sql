select * from tbl_customer_02 c inner join tbl_movie_order_02 o on c.ID = o.O_ID inner join tbl_movie02 m on o.O_CODE = m.M_CODE;

desc tbl_customer_02;
desc tbl_movie_order_02;
desc tbl_movie02;
