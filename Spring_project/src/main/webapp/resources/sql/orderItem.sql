create table if not exists orderItem(
	orderItemId int auto_increment primary key,
    orderId  varchar(500),
    productId int,
    productCount int,
    foreign key (orderId) references orders(o_id),
    foreign key (productId) references product(p_id)
)default charset=utf8mb4;

select * from orderItem;

select a.orderItemId, a.orderId, a.productId, a.productCount, b.p_brand, b.p_name, b.p_price, b.p_fileName from orderItem a left outer join product b on a.productId = b.p_id where orderId = 202208091652396295;

select * from orderItem;
drop table orderItem;