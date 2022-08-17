create table if not exists cart(
	c_id int auto_increment primary key,
    c_memberId  varchar(100),
    c_productId int,
    c_productCount int,
    foreign key (c_memberId) references member(m_id),
    foreign key (c_productId) references product(p_id)
)default charset=utf8mb4;

alter table cart add unique (c_memberId, c_productId);

select * from cart;
drop table cart;
select a.c_id, a.c_memberId, a.c_productId, a.c_productCount, b.p_name, b.p_price, b.p_discount, b.p_fileName from cart a left outer join product b on a.c_productId = b.p_id where c_memberId = 'test';