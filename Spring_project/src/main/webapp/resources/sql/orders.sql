create table if not exists orders(
	o_id varchar(500) primary key,
    o_addressee  varchar(100),
    o_memberId varchar(100),
    o_memberAddr1 varchar(300),
    o_memberAddr2 varchar(300),
    o_memberAddr3 varchar(300),
    o_orderState varchar(300),
    o_orderDate timestamp default now(),
    foreign key (o_memberId) references member(m_id)
)default charset=utf8mb4;

select * from orders;
drop table orders;