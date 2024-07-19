create database manager_tour;
use manager_tour;
create table category_tour(
    id_category int primary key ,
    category_code varchar(255) not null ,
    category_name varchar(255) not null
);
create table city(
    id_city int primary key ,
    city_name varchar(255) not null
);
create table clients(
    id_clients int primary key ,
    name_clients varchar(255) not null ,
    id_number varchar(255) not null ,
    date_birth date not null ,
    city_id int,
    foreign key (city_id) references city(id_city)
);
create table destination(
    id_destination int primary key ,
    destination_name varchar(255) not null ,
    describes varchar(255) not null ,
    cost int not null ,
    city_id int,
    foreign key (city_id) references city(id_city)
);
create table tour(
    id_tour int primary key ,
    tour_code varchar(255) not null ,
    category_id int not null ,
    destination_id int not null ,
    date_start date not null ,
    date_end date not null ,
    foreign key (category_id) references category_tour(id_category),
    foreign key (destination_id) references destination(id_destination)
);
create table order_tour(
    id_order_tour int primary key ,
    tour_id int not null ,
    clients_id int not null ,
    status varchar(255) not null ,
    foreign key (tour_id) references tour(id_tour),
    foreign key (clients_id) references clients(id_clients)
);
insert into city value (1,'Quảng Nam');
insert into city value (2,'Đà Nẵng');
insert into city value (3,'Quảng Ninh');
insert into city value (4,'Lâm Đồng');
insert into city value (5,'Bà Rịa - Vũng Tàu');
insert into destination value (1,'Hội An', 'Phố cổ',2000000,1);
insert into destination value (2,'Bãi Biển Mỹ Khê', 'Tắm',5000000,2);
insert into destination value (3,'Vịnh Hạ Long', 'Một trong 7 kỳ quan',10000000,3);
insert into destination value (4,'Đà Lạt', 'Cảnh đẹp mộng mơ, mát mẻ',8000000,4);
insert into destination value (5,'Bãi biển vũng tàu', 'Bãi biển có nhiều món ngon',10000000,5);
insert into clients value (1,'Đỗ Trung Quyết', '123456789','1994-02-26',3);
insert into clients value (2,'Nguyễn Đức Thảo Nguyên', '543656789','1994-02-26',5);
insert into clients value (3,'Lê Thành Công', '947456789','1994-02-26',3);
insert into clients value (4,'Đỗ Trung Quyết', '123456789','1994-02-26',4);
insert into clients value (5,'Hoàng Ngọc Hiếu', '123459479','1994-02-26',2);
insert into clients value (6,'Nguyễn Văn Nam', '545676789','1994-02-26',1);
insert into clients value (7,'Lý Hoàng Cầm', '123409739','1994-02-26',4);
insert into clients value (8,'Huỳnh Tấn Vũ Toàn', '123948589','1994-02-26',1);
insert into clients value (9,'Đàm Vĩnh Hưng', '123983689','1994-02-26',2);
insert into clients value (10,'Hoài Linh 14 Tỏi', '999956789','1994-02-26',3);
insert into category_tour (id_category, category_code, category_name) values
                                                                          (1, 'C1', 'Loại 1'),
                                                                          (2, 'C2', 'Loại 2');
insert into tour
    (id_tour, tour_code, category_id, destination_id, date_start, date_end) values
                                                                                             (1, 'T01', 1, 1, '2024-01-01', '2024-01-05'),
                                                                                             (2, 'T02', 1, 2, '2024-02-01', '2024-02-05'),
                                                                                             (3, 'T03', 1, 3, '2024-03-01', '2024-03-05'),
                                                                                             (4, 'T04', 1, 4, '2024-04-01', '2024-04-05'),
                                                                                             (5, 'T05', 1, 5, '2024-05-01', '2024-05-05'),
                                                                                             (6, 'T06', 2, 1, '2024-06-01', '2024-06-05'),
                                                                                             (7, 'T07', 2, 2, '2024-07-01', '2024-07-05'),
                                                                                             (8, 'T08', 2, 3, '2024-08-01', '2024-08-05'),
                                                                                             (9, 'T09', 2, 4, '2024-09-01', '2024-09-05'),
                                                                                             (10, 'T10', 2, 5, '2024-10-01', '2024-10-05'),
                                                                                             (11, 'T11', 1, 1, '2024-11-01', '2024-11-05'),
                                                                                             (12, 'T12', 1, 2, '2024-12-01', '2024-12-05'),
                                                                                             (13, 'T13', 2, 3, '2025-01-01', '2025-01-05'),
                                                                                             (14, 'T14', 2, 4, '2025-02-01', '2025-02-05'),
                                                                                             (15, 'T15', 2, 5, '2025-03-01', '2025-03-05');
insert into order_tour (id_order_tour, tour_id, clients_id, status) values
                                                                        (1, 1, 1, 'Đã đặt'),
                                                                        (2, 2, 2, 'Đã đặt'),
                                                                        (3, 3, 3, 'Đã đặt'),
                                                                        (4, 4, 4, 'Đã đặt'),
                                                                        (5, 5, 5, 'Đã đặt'),
                                                                        (6, 6, 6, 'Đã đặt'),
                                                                        (7, 7, 7, 'Đã đặt'),
                                                                        (8, 8, 8, 'Đã đặt'),
                                                                        (9, 9, 9, 'Đã đặt'),
                                                                        (10, 10, 10, 'Đã đặt');
select city_name, count(id_tour) as number_of_tours
from tour
         join destination d on d.id_destination = tour.destination_id
         join city c on c.id_city = d.city_id
group by city_name;
select count(tour.id_tour) as number_tour
from tour
where month(date_start) = 3 and year(date_start) = 2024;
select count(tour.id_tour) as number_tour
from tour
where month(date_end) = 4 and year(date_end) = 2024;




