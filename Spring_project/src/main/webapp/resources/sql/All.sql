create database market;

use market;

create table if not exists member(
	m_id varchar(100) not null primary key,
    m_password varchar(100) not null,
    m_name varchar(100),
    m_email varchar(100),
    adminCk int default 0,
    m_addr1 varchar(300),
    m_addr2 varchar(300),
    m_addr3 varchar(300)
)default charset=utf8mb4;

insert into member(m_id, m_password, m_name, m_email, adminCk) values('admin', '1234', '김민호', 'youalsgh@naver.com', 1);
insert into member(m_id, m_password, m_name, m_email) values('test', '1234', '김민호', 'youalsgh@naver.com');
insert into member(m_id, m_password, m_name, m_email) values('test1', '1234', '김민호', 'youalsgh@naver.com');
insert into member(m_id, m_password, m_name, m_email) values('test2', '1234', '김민호', 'youalsgh@naver.com');
insert into member(m_id, m_password, m_name, m_email) values('test3', '1234', '김민호', 'youalsgh@naver.com');
insert into member(m_id, m_password, m_name, m_email) values('test4', '1234', '김민호', 'youalsgh@naver.com');
select * from member;
select count(*) from member where m_id not in('admin');
drop table member;

create table if not exists product(
	p_id int primary key auto_increment,
    p_brand varchar(100),
    p_name varchar(100),
    p_price int,
    p_gender varchar(100),
    p_description varchar(2000),
    p_fileName varchar(100)
)default charset=utf8mb4;

insert into product(p_brand, p_name, p_price, p_gender, p_description, p_fileName) values
('brand', 'name', 10000, 'man', '상세설명입니다', 'shop_01.jpg'),
('brand', 'name', 10000, 'man', '상세설명입니다', 'shop_02.jpg'),
('brand', 'name', 10000, 'man', '상세설명입니다', 'shop_03.jpg'),
('brand', 'name', 10000, 'man', '상세설명입니다', 'shop_04.jpg'),
('brand', 'name', 10000, 'man', '상세설명입니다', 'shop_05.jpg'),
('brand', 'name', 10000, 'man', '상세설명입니다', 'shop_06.jpg'),
('brand', 'name', 10000, 'man', '상세설명입니다', 'shop_07.jpg'),
('brand', 'name', 10000, 'man', '상세설명입니다', 'shop_08.jpg'),
('brand', 'name', 10000, 'man', '상세설명입니다', 'shop_09.jpg'),
('brand', 'name', 10000, 'man', '상세설명입니다', 'shop_10.jpg'),
('brand', 'name', 10000, 'man', '상세설명입니다', 'shop_11.jpg');

select * from product;

drop table product;

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
select a.c_id, a.c_memberId, a.c_productId, a.c_productCount, b.p_name, b.p_price, b.p_fileName from cart a left outer join product b on a.c_productId = b.p_id where c_memberId = 'test';

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

create table if not exists orderItem(
	orderItemId int auto_increment primary key,
    orderId  varchar(500),
    productId int,
    productCount int,
    foreign key (orderId) references orders(o_id),
    foreign key (productId) references product(p_id)
)default charset=utf8mb4;

select * from orderItem;

select a.productCount, b.p_brand, b.p_name, b.p_price, b.p_fileName from orderItem a left outer join product b on a.productId = b.p_id where orderId = 202208091932533571;

select * from orderItem;
drop table orderItem;


create table if not exists reply(
	r_id int auto_increment primary key,
    r_productId int,
    r_memberId varchar(100),
    r_content varchar(2000),
    r_rating decimal(2,1),
    r_regDate timestamp default now(),
    foreign key (r_memberId) references member(m_id),
    foreign key (r_productId) references product(p_id)
)default charset=utf8mb4;

select * from reply;
drop table reply;
select a.r_id, a.r_memberId, a.r_productId, a.r_memberId, a.r_content, a.r_rating, a.r_regDate, b.m_name from reply a left outer join member b on a.r_memberId = b.m_id where r_productId =10;