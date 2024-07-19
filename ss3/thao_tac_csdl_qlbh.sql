use quan_ly_ban_hang;
insert into customer value (1,'Minh Quan', 10);
insert into customer value (2,'Ngọc Oanh', 50);
insert into customer value (3,'Hồng Hà', 20);
insert into orders(o_id, c_id, o_date) value (1,1,'2006-3-21');
insert into orders(o_id, c_id, o_date) value (2,2,'2006-3-23');
insert into orders(o_id, c_id, o_date) value (3,1,'2006-3-16');
insert into product value (1,'May Giat',3);
insert into product value (2,'Tủ Lạnh',5);
insert into product value (3,'Dieu Hoa',7);
insert into product value (4,'Quat',1);
insert into product value (5,'Bep Dien',2);
insert into order_detail value (1,1,3);
insert into order_detail value (1,3,7);
insert into order_detail value (1,4,2);
insert into order_detail value (2,1,1);
insert into order_detail value (3,1,8);
insert into order_detail value (2,5,4);
insert into order_detail value (2,3,3);
select o_id,o_date,o_totalprice from orders;
use quan_ly_ban_hang;
select c_name,p_name, od_qty from customer
    join orders on customer.c_id = orders.c_id
    join order_detail on orders.o_id = order_detail.o_id
    join product on order_detail.p_id = product.p_id;
select c_name from customer
    left join orders on customer.c_id = orders.c_id
   where orders.o_id is null;
select orders.o_id, o_date, sum(p_price * order_detail.od_qty) as total_order
from orders
    join order_detail on orders.o_id = order_detail.o_id
    join product on order_detail.p_id = product.p_id
group by orders.o_id, o_date ;