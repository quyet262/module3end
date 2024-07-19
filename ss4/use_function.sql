use quan_ly_sinh_vien;
select address, count(address) as number_studen
from student
group by address;
select student_name, avg(mark)
from student
    join mark on student.student_id = mark.student_id
group by student_name;
select student_name, avg(mark) as DTB
from student
    join mark on student.student_id = mark.student_id
group by student_name
having DTB > 15;
select student_name, avg(mark) as DTB
from student
         join mark on student.student_id = mark.student_id
group by student_name
having DTB >= all (select avg(mark)
                   from mark
                   group by mark.student_id);

