create database quan_ly_hoc_vien;
use quan_ly_hoc_vien;
create table address(
    id_address int auto_increment primary key,
    address varchar(50)
);
create table classes(
    id_class  int auto_increment primary key ,
    name varchar(50),
    language varchar(30),
    description varchar(50)
);
create table students(
    id_student int auto_increment primary key,
    full_name varchar(50),
    address_id int,
    age int,
    phone varchar(10) unique ,
    class_id int,
    foreign key (address_id) references address(id_address),
    foreign key (class_id) references classes(id_class)
);
create table course(
    id_course int auto_increment primary key,
    name varchar(30),
    description varchar(50)
);
create table point(
    id_point int auto_increment primary key,
    course_id int,
    student_id int,
    point int,
    foreign key (course_id) references course(id_course),
    foreign key (student_id) references students(id_student)
);
insert into address value (1,'Hanoi');
insert into address value (2,'DaNang');
insert into address value (3,'Hue');
insert into address value (4,'HaiPhong');
insert into address value (5,'CaoBang');
insert into classes value (1,'c0124','anh','sdf');
insert into classes value (2,'c0224','anh','sdf');
insert into classes value (3,'c0324','anh','sdf');
insert into classes value (4,'c0424','anh','sdf');
insert into classes value (5,'c0524','anh','sdf');
insert into students value (1,'Nguyen Van A',1,18,'0987654',1);
insert into students value (2,'Nguyen Van B',2,18,'0987645',1);
insert into students value (3,'Nguyen Van C',1,18,'0987643',1);
insert into students value (4,'Nguyen Van D',3,18,'0987864',1);
insert into students value (5,'Nguyen Van E',4,18,'0983456',1);
insert into students value (6,'Nguyen Van F',5,18,'0987557',1);
insert into students value (7,'Nguyen Van G',1,18,'0987563',1);
insert into students value (8,'Nguyen Van H',1,18,'0987853',1);
insert into students value (9,'Nguyen Van I',1,18,'0987946',1);
insert into students value (10,'Nguyen Van J',1,18,'0987146',1);
insert into course value (1,'nam','grwwe');
insert into course value (2,'nam','grwwe');
insert into course value (3,'nam','grwwe');
insert into course value (4,'nam','grwwe');
insert into course value (5,'nam','grwwe');
insert into course value (6,'nam','grwwe');
insert into course value (7,'nam','grwwe');
insert into course value (8,'nam','grwwe');
insert into course value (9,'nam','grwwe');
insert into course value (10,'nam','grwwe');
insert into course value (11,'nam','grwwe');
insert into course value (12,'nam','grwwe');
insert into course value (13,'nam','grwwe');
insert into course value (14,'nam','grwwe');
insert into course value (15,'nam','grwwe');
insert into course value (16,'nam','grwwe');
insert into course value (17,'nam','grwwe');
insert into course value (18,'nam','grwwe');
insert into course value (19,'nam','grwwe');
insert into course value (20,'nam','grwwe');
insert into point value (1,1,1,8);
insert into point value (2,1,1,8);
insert into point value (3,1,1,8);
insert into point value (4,1,1,8);
insert into point value (5,1,1,8);
insert into point value (6,1,1,8);
insert into point value (7,1,1,8);
insert into point value (8,1,1,8);
insert into point value (9,1,1,8);
insert into point value (10,1,1,8);
insert into point value (11,1,1,8);
insert into point value (12,1,1,8);
insert into point value (13,1,1,8);
insert into point value (14,1,1,8);
insert into point value (15,1,1,8);
select * from students where full_name like 'Nguyen%';
select * from students where full_name like '%Anh';
select * from students where age between 18 and 25;
select * from students where id_student in(9,13);