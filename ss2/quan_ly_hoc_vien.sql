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
INSERT INTO address (address) VALUES ('123 Main St'), ('456 Oak Ave'), ('789 Pine Rd'), ('321 Maple Dr'), ('654 Birch Ln');

INSERT INTO classes (name, language, description) VALUES ('Math 101', 'English', 'Basic Math'), ('Physics 101', 'English', 'Basic Physics'), ('Chemistry 101', 'English', 'Basic Chemistry'), ('Biology 101', 'English', 'Basic Biology'), ('Computer Science 101', 'English', 'Basic CS');

INSERT INTO students (full_name, address_id, age, phone, class_id) VALUES
                                                                       ('Nguyen Van A', 1, 20, '0123456789', 1),
                                                                       ('Tran Thi B', 2, 22, '0123456790', 2),
                                                                       ('Le Van C', 3, 24, '0123456791', 3),
                                                                       ('Pham Thi D', 4, 19, '0123456792', 4),
                                                                       ('Nguyen Van E', 5, 21, '0123456793', 5),
                                                                       ('Ngo Thi F', 1, 23, '0123456794', 1),
                                                                       ('Hoang Van G', 2, 25, '0123456795', 2),
                                                                       ('Do Thi H', 3, 18, '0123456796', 3),
                                                                       ('Bui Van I', 4, 22, '0123456797', 4),
                                                                       ('Ngo Van J', 5, 20, '0123456798', 5);

INSERT INTO point (course_id, student_id, point) VALUES
                                                     (1, 1, 85), (2, 1, 90), (3, 1, 75), (4, 1, 80), (5, 1, 88),
                                                     (1, 2, 70), (2, 2, 75), (3, 2, 85), (4, 2, 90), (5, 2, 95),
                                                     (1, 3, 65), (2, 3, 70), (3, 3, 80), (4, 3, 85), (5, 3, 90);

INSERT INTO course (name, description) VALUES
                                           ('Course 1', 'Description 1'),
                                           ('Course 2', 'Description 2'),
                                           ('Course 3', 'Description 3'),
                                           ('Course 4', 'Description 4'),
                                           ('Course 5', 'Description 5'),
                                           ('Course 6', 'Description 6'),
                                           ('Course 7', 'Description 7'),
                                           ('Course 8', 'Description 8'),
                                           ('Course 9', 'Description 9'),
                                           ('Course 10', 'Description 10'),
                                           ('Course 11', 'Description 11'),
                                           ('Course 12', 'Description 12'),
                                           ('Course 13', 'Description 13'),
                                           ('Course 14', 'Description 14'),
                                           ('Course 15', 'Description 15'),
                                           ('Course 16', 'Description 16'),
                                           ('Course 17', 'Description 17'),
                                           ('Course 18', 'Description 18'),
                                           ('Course 19', 'Description 19'),
                                           ('Course 20', 'Description 20');
select * from students where full_name like 'Nguyen%';
select * from students where full_name like '% Anh';
select * from students where age between 18 and 25;
select * from students where id_student in(4,8);
select upper(students.full_name) as upper_name from students;
select lower(students.full_name) as upper_name from students;
use quan_ly_hoc_vien;
select c.name , count(c.name) as quantity_student
from students
join classes c on c.id_class = students.class_id
group by c.name;


