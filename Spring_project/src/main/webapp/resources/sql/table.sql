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

create table if not exists product(
	p_id int primary key auto_increment,
    p_brand varchar(100),
    p_name varchar(100),
    p_price int,
    p_gender varchar(100),
    p_description varchar(2000),
    p_fileName varchar(100),
    p_ratingAvg decimal(2,1)
)default charset=utf8mb4;

create table if not exists cart(
	c_id int auto_increment primary key,
    c_memberId  varchar(100),
    c_productId int,
    c_productCount int,
    foreign key (c_memberId) references member(m_id),
    foreign key (c_productId) references product(p_id)
)default charset=utf8mb4;

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

create table if not exists orderItem(
	orderItemId int auto_increment primary key,
    orderId  varchar(500),
    productId int,
    productCount int,
    foreign key (orderId) references orders(o_id),
    foreign key (productId) references product(p_id)
)default charset=utf8mb4;

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