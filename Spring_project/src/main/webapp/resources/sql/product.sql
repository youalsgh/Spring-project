create database market;

use market;

create table if not exists product(
	p_id int primary key auto_increment,
    p_brand varchar(100),
    p_name varchar(100),
    p_price int,
    p_gender varchar(100),
    p_discount double,
    p_description varchar(2000),
    p_fileName varchar(100)
)default charset=utf8mb4;

insert into product(p_brand, p_name, p_price, p_gender, p_discount, p_description, p_fileName) values
('brand', 'name', '10000', 'man', 0.2, '상세설명입니다', 'shop_01.jpg'),
('brand', 'name', '10000', 'man', 0.2, '상세설명입니다', 'shop_02.jpg'),
('brand', 'name', '10000', 'man', 0.2, '상세설명입니다', 'shop_03.jpg'),
('brand', 'name', '10000', 'man', 0.2, '상세설명입니다', 'shop_04.jpg'),
('brand', 'name', '10000', 'man', 0.2, '상세설명입니다', 'shop_05.jpg'),
('brand', 'name', '10000', 'man', 0.2, '상세설명입니다', 'shop_06.jpg'),
('brand', 'name', '10000', 'man', 0.2, '상세설명입니다', 'shop_07.jpg'),
('brand', 'name', '10000', 'man', 0.2, '상세설명입니다', 'shop_08.jpg'),
('brand', 'name', '10000', 'man', 0.2, '상세설명입니다', 'shop_09.jpg'),
('brand', 'name', '10000', 'man', 0.2, '상세설명입니다', 'shop_10.jpg'),
('brand', 'name', '10000', 'man', 0.2, '상세설명입니다', 'shop_11.jpg');

select * from product;

drop table product;