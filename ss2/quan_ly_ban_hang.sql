create database quan_ly_ban_hang;
       use quan_ly_ban_hang;
create table customer(
    c_id int not null auto_increment primary key ,
    c_name varchar(50) not null ,
    c_age int
);
create table product(
    p_id int not null auto_increment primary key ,
    p_name varchar(30) not null ,
    p_price float
);
create table orders(
    o_id int auto_increment primary key ,
    c_id int ,
    o_date date,
    o_totalprice double,
    foreign key (c_id) references customer(c_id)
);
create table order_detail(
    o_id int not null ,
    p_id int not null ,
    od_qty varchar(50),
    primary key (o_id,p_id),
    foreign key (o_id) references orders(o_id),
    foreign key (p_id) references product(p_id)
);
